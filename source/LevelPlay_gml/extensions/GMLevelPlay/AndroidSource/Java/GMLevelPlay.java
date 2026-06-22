
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.GMExtUtils;
import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.GMExtWire.GMFunction;
import ${YYAndroidPackageName}.enums.*;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.RelativeLayout;

import androidx.annotation.NonNull;

import com.ironsource.mediationsdk.IronSource;
import com.unity3d.mediation.LevelPlay;
import com.unity3d.mediation.LevelPlayAdError;
import com.unity3d.mediation.LevelPlayAdInfo;
import com.unity3d.mediation.LevelPlayAdSize;
import com.unity3d.mediation.LevelPlayConfiguration;
import com.unity3d.mediation.LevelPlayInitError;
import com.unity3d.mediation.LevelPlayInitListener;
import com.unity3d.mediation.LevelPlayInitRequest;
import com.unity3d.mediation.banner.LevelPlayBannerAdView;
import com.unity3d.mediation.banner.LevelPlayBannerAdViewListener;
import com.unity3d.mediation.interstitial.LevelPlayInterstitialAd;
import com.unity3d.mediation.interstitial.LevelPlayInterstitialAdListener;
import com.unity3d.mediation.rewarded.LevelPlayReward;
import com.unity3d.mediation.rewarded.LevelPlayRewardedAd;
import com.unity3d.mediation.rewarded.LevelPlayRewardedAdListener;


public class GMLevelPlay extends GMLevelPlayInternal implements LevelPlayInitListener {

    private static final String ERR_NOT_INITIALIZED = "LevelPlay SDK is not initialized.";
    private static final String ERR_ACTIVITY_UNAVAILABLE = "Current Android activity is unavailable.";

    private boolean mLevelPlayInitialized = false;

    private GMFunction mInitCallback = null;
    private GMFunction mBannerCallback = null;
    private GMFunction mInterstitialCallback = null;
    private GMFunction mRewardedCallback = null;

    private final RewardedListener mRewardedListener = new RewardedListener();
    private final InterstitialListener mInterstitialListener = new InterstitialListener();
    private final BannerListener mBannerListener = new BannerListener();

    private LevelPlayInterstitialAd mInterstitialAd = null;
    private LevelPlayRewardedAd mRewardedAd = null;

    private RelativeLayout mBannerLayout = null;
    private LevelPlayBannerAdView mLevelPlayBanner = null;

    private Activity levelplay_get_activity() {
        return RunnerActivity.CurrentActivity;
    }

    private ViewGroup levelplay_get_root_view(Activity activity) {
        if (activity == null) return null;
        return activity.findViewById(android.R.id.content);
    }

    // -------------------------------------------------------------------------
    // Lifecycle
    // -------------------------------------------------------------------------

    public void onPause() {
        Activity activity = levelplay_get_activity();
        if (activity != null) IronSource.onPause(activity);
    }

    public void onResume() {
        Activity activity = levelplay_get_activity();
        if (activity != null) IronSource.onResume(activity);
    }

    public void onDestroy() {
        levelplay_banner_destroy();
        mInterstitialAd = null;
        mRewardedAd = null;
        mInitCallback = null;
        mBannerCallback = null;
        mInterstitialCallback = null;
        mRewardedCallback = null;
        mLevelPlayInitialized = false;
    }

    // -------------------------------------------------------------------------
    // Init / settings
    // -------------------------------------------------------------------------

    public void levelplay_init(GMFunction callback) {
        mInitCallback = callback;

        Activity activity = levelplay_get_activity();
        if (activity == null) {
            if (mInitCallback != null) mInitCallback.call(initEventStream(false, ERR_ACTIVITY_UNAVAILABLE));
            return;
        }

        String appKey = GMExtUtils.GetExtensionOption("GMLevelPlay", "AndroidAppKey");
        if (appKey == null || appKey.length() == 0) {
            if (mInitCallback != null) mInitCallback.call(initEventStream(false, "Missing extension option: GMLevelPlay / AndroidAppKey."));
            return;
        }

        LevelPlayInitRequest initRequest = new LevelPlayInitRequest.Builder(appKey)
                .withUserId("UserID")
                .build();

        LevelPlay.init(activity, initRequest, this);
    }

    @Override
    public void onInitFailed(@NonNull LevelPlayInitError error) {
        mLevelPlayInitialized = false;
        if (mInitCallback != null) mInitCallback.call(initEventStream(false, String.valueOf(error)));
    }

    @Override
    public void onInitSuccess(LevelPlayConfiguration configuration) {
        mLevelPlayInitialized = true;
        if (mInitCallback != null) mInitCallback.call(initEventStream(true, null));
    }

    public boolean levelplay_is_initialized() {
        return mLevelPlayInitialized;
    }

    public void levelplay_set_consent(boolean enable) {
        IronSource.setConsent(enable);
    }

    // https://developers.is.com/ironsource-mobile/android/regulation-advanced-settings/#step-4
    public void levelplay_set_metadata(String key, String value) {
        IronSource.setMetaData(key, value);
    }

    public void levelplay_set_dynamic_user_id(String user_id) {
        IronSource.setDynamicUserId(user_id);
    }

    public void levelplay_launch_test_suite() {
        Activity activity = levelplay_get_activity();
        if (activity != null) IronSource.launchTestSuite(activity);
    }

    // -------------------------------------------------------------------------
    // Interstitial
    // -------------------------------------------------------------------------

    public void levelplay_interstitial_init(String ad_unit_id) {
        mInterstitialAd = new LevelPlayInterstitialAd(ad_unit_id);
        mInterstitialAd.setListener(mInterstitialListener);
    }

    public boolean levelplay_interstitial_load() {
        if (!mLevelPlayInitialized) {
            sendInterstitialEvent("load_failed", ERR_NOT_INITIALIZED, null, null);
            return false;
        }
        if (mInterstitialAd == null) {
            sendInterstitialEvent("load_failed", "Interstitial ad was not initialized.", null, null);
            return false;
        }
        mInterstitialAd.loadAd();
        return true;
    }

    public boolean levelplay_interstitial_is_ready() {
        return mInterstitialAd != null && mInterstitialAd.isAdReady();
    }

    public boolean levelplay_interstitial_is_placement_capped(String placement_id) {
        if (mInterstitialAd == null) return false;
        return LevelPlayInterstitialAd.isPlacementCapped(placement_id);
    }

    public boolean levelplay_interstitial_show(String placement_id) {
        Activity activity = levelplay_get_activity();
        if (activity == null) {
            sendInterstitialEvent("display_failed", ERR_ACTIVITY_UNAVAILABLE, null, null);
            return false;
        }
        if (mInterstitialAd == null) {
            sendInterstitialEvent("display_failed", "Interstitial ad was not initialized.", null, null);
            return false;
        }
        if (!mInterstitialAd.isAdReady()) {
            sendInterstitialEvent("display_failed", "Interstitial ad is not ready.", null, null);
            return false;
        }
        if (LevelPlayInterstitialAd.isPlacementCapped(placement_id)) {
            sendInterstitialEvent("display_failed", "Interstitial placement is capped.", null, null);
            return false;
        }

        mInterstitialAd.showAd(activity, placement_id);
        return true;
    }

    public void levelplay_interstitial_callback_subscribe(GMFunction callback) {
        mInterstitialCallback = callback;
    }

    // -------------------------------------------------------------------------
    // Rewarded
    // -------------------------------------------------------------------------

    public void levelplay_rewarded_video_init(String ad_unit_id) {
        mRewardedAd = new LevelPlayRewardedAd(ad_unit_id);
        mRewardedAd.setListener(mRewardedListener);
    }

    public boolean levelplay_rewarded_video_load() {
        if (!mLevelPlayInitialized) {
            sendRewardedEvent("load_failed", ERR_NOT_INITIALIZED, null, null, null);
            return false;
        }
        if (mRewardedAd == null) {
            sendRewardedEvent("load_failed", "Rewarded ad was not initialized.", null, null, null);
            return false;
        }
        mRewardedAd.loadAd();
        return true;
    }

    public boolean levelplay_rewarded_video_is_ready() {
        return mRewardedAd != null && mRewardedAd.isAdReady();
    }

    public boolean levelplay_rewarded_video_is_placement_capped(String placement_id) {
        if (mRewardedAd == null) return false;
        return LevelPlayRewardedAd.isPlacementCapped(placement_id);
    }

    public boolean levelplay_rewarded_video_show(String placement_id) {
        Activity activity = levelplay_get_activity();
        if (activity == null) {
            sendRewardedEvent("display_failed", ERR_ACTIVITY_UNAVAILABLE, null, null, null);
            return false;
        }
        if (mRewardedAd == null) {
            sendRewardedEvent("display_failed", "Rewarded ad was not initialized.", null, null, null);
            return false;
        }
        if (!mRewardedAd.isAdReady()) {
            sendRewardedEvent("display_failed", "Rewarded ad is not ready.", null, null, null);
            return false;
        }
        if (LevelPlayRewardedAd.isPlacementCapped(placement_id)) {
            sendRewardedEvent("display_failed", "Rewarded placement is capped.", null, null, null);
            return false;
        }

        mRewardedAd.showAd(activity, placement_id);
        return true;
    }

    public void levelplay_rewarded_callback_subscribe(GMFunction callback) {
        mRewardedCallback = callback;
    }

    // -------------------------------------------------------------------------
    // Banner
    // -------------------------------------------------------------------------

    public void levelplay_banner_create(String ad_unit_id, LevelPlayBannerSize size, LevelPlayBannerAlignH align_h, LevelPlayBannerAlignV align_v) {
        RunnerActivity.ViewHandler.post(() -> {
            Activity activity = levelplay_get_activity();
            if (activity == null) {
                sendBannerEvent("load_failed", ERR_ACTIVITY_UNAVAILABLE, null, null);
                return;
            }

            levelplay_banner_destroy_internal();

            mLevelPlayBanner = new LevelPlayBannerAdView(activity, ad_unit_id);
            mLevelPlayBanner.setAdSize(levelplay_banner_size(size));
            mLevelPlayBanner.setBannerListener(mBannerListener);

            LayoutParams params = levelplay_banner_layout_params(align_h, align_v);
            mBannerLayout = new RelativeLayout(activity);
            mBannerLayout.addView(mLevelPlayBanner, params);

            ViewGroup rootView = levelplay_get_root_view(activity);
            if (rootView == null) {
                levelplay_banner_destroy_internal();
                sendBannerEvent("load_failed", "Root view is unavailable.", null, null);
                return;
            }

            rootView.addView(mBannerLayout);
            mLevelPlayBanner.requestLayout();
            mLevelPlayBanner.setVisibility(View.VISIBLE);
            mLevelPlayBanner.loadAd();
        });
    }

    public void levelplay_banner_move(LevelPlayBannerAlignH align_h, LevelPlayBannerAlignV align_v) {
        RunnerActivity.ViewHandler.post(() -> {
            if (mLevelPlayBanner == null) return;

            Activity activity = levelplay_get_activity();
            if (activity == null) return;

            LayoutParams params = levelplay_banner_layout_params(align_h, align_v);

            if (mBannerLayout != null) {
                mBannerLayout.removeView(mLevelPlayBanner);
                ViewGroup rootView = levelplay_get_root_view(activity);
                if (rootView != null) rootView.removeView(mBannerLayout);
            }

            mBannerLayout = new RelativeLayout(activity);
            mBannerLayout.addView(mLevelPlayBanner, params);

            ViewGroup rootView = levelplay_get_root_view(activity);
            if (rootView != null) rootView.addView(mBannerLayout);
        });
    }

    public void levelplay_banner_destroy() {
        RunnerActivity.ViewHandler.post(this::levelplay_banner_destroy_internal);
    }

    public void levelplay_banner_callback_subscribe(GMFunction callback) {
        mBannerCallback = callback;
    }

    private LevelPlayAdSize levelplay_banner_size(LevelPlayBannerSize size) {
        switch (size) {
            case Large: return LevelPlayAdSize.LARGE;
            case MediumRectangle: return LevelPlayAdSize.MEDIUM_RECTANGLE;
            case Adaptive:
                Activity activity = levelplay_get_activity();
                if (activity != null) return LevelPlayAdSize.createAdaptiveAdSize(activity);
                return LevelPlayAdSize.BANNER;
            case Banner:
            default: return LevelPlayAdSize.BANNER;
        }
    }

    private RelativeLayout.LayoutParams levelplay_banner_layout_params(LevelPlayBannerAlignH align_h, LevelPlayBannerAlignV align_v) {
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(
                LayoutParams.WRAP_CONTENT,
                LayoutParams.WRAP_CONTENT
        );

        switch (align_h) {
            case Left:
                params.addRule(RelativeLayout.ALIGN_PARENT_LEFT);
                break;
            case Right:
                params.addRule(RelativeLayout.ALIGN_PARENT_RIGHT);
                break;
            case Center:
            default:
                params.addRule(RelativeLayout.CENTER_HORIZONTAL);
                break;
        }

        switch (align_v) {
            case Top:
                params.addRule(RelativeLayout.ALIGN_PARENT_TOP);
                break;
            case Center:
                params.addRule(RelativeLayout.CENTER_VERTICAL);
                break;
            case Bottom:
            default:
                params.addRule(RelativeLayout.ALIGN_PARENT_BOTTOM);
                break;
        }

        return params;
    }

    private void levelplay_banner_destroy_internal() {
        if (mLevelPlayBanner != null) {
            ViewGroup parent = (ViewGroup) mLevelPlayBanner.getParent();
            if (parent != null) parent.removeView(mLevelPlayBanner);
            mLevelPlayBanner.destroy();
            mLevelPlayBanner = null;
        }

        if (mBannerLayout != null) {
            Activity activity = levelplay_get_activity();
            ViewGroup rootView = levelplay_get_root_view(activity);
            if (rootView != null) rootView.removeView(mBannerLayout);
            mBannerLayout = null;
        }
    }

    // -------------------------------------------------------------------------
    // Listeners
    // -------------------------------------------------------------------------

    private class BannerListener implements LevelPlayBannerAdViewListener {
        @Override
        public void onAdLoaded(@NonNull LevelPlayAdInfo adInfo) {
            sendBannerEvent("loaded", null, adInfo, null);
        }

        @Override
        public void onAdLoadFailed(@NonNull LevelPlayAdError error) {
            sendBannerEvent("load_failed", String.valueOf(error), null, error);
        }

        @Override
        public void onAdDisplayed(@NonNull LevelPlayAdInfo adInfo) {
            sendBannerEvent("displayed", null, adInfo, null);
        }

        @Override
        public void onAdDisplayFailed(@NonNull LevelPlayAdInfo adInfo, @NonNull LevelPlayAdError error) {
            sendBannerEvent("display_failed", String.valueOf(error), adInfo, error);
        }

        @Override
        public void onAdClicked(@NonNull LevelPlayAdInfo adInfo) {
            sendBannerEvent("clicked", null, adInfo, null);
        }

        @Override
        public void onAdExpanded(@NonNull LevelPlayAdInfo adInfo) {
            sendBannerEvent("expanded", null, adInfo, null);
        }

        @Override
        public void onAdCollapsed(@NonNull LevelPlayAdInfo adInfo) {
            sendBannerEvent("collapsed", null, adInfo, null);
        }

        @Override
        public void onAdLeftApplication(@NonNull LevelPlayAdInfo adInfo) {
            sendBannerEvent("left_application", null, adInfo, null);
        }
    }

    private class InterstitialListener implements LevelPlayInterstitialAdListener {
        @Override
        public void onAdLoaded(@NonNull LevelPlayAdInfo adInfo) {
            sendInterstitialEvent("loaded", null, adInfo, null);
        }

        @Override
        public void onAdLoadFailed(@NonNull LevelPlayAdError error) {
            sendInterstitialEvent("load_failed", String.valueOf(error), null, error);
        }

        @Override
        public void onAdDisplayed(@NonNull LevelPlayAdInfo adInfo) {
            sendInterstitialEvent("displayed", null, adInfo, null);
        }

        @Override
        public void onAdDisplayFailed(@NonNull LevelPlayAdError error, @NonNull LevelPlayAdInfo adInfo) {
            sendInterstitialEvent("display_failed", String.valueOf(error), adInfo, error);
        }

        @Override
        public void onAdClosed(@NonNull LevelPlayAdInfo adInfo) {
            sendInterstitialEvent("closed", null, adInfo, null);
        }

        @Override
        public void onAdClicked(@NonNull LevelPlayAdInfo adInfo) {
            sendInterstitialEvent("clicked", null, adInfo, null);
        }

        @Override
        public void onAdInfoChanged(@NonNull LevelPlayAdInfo adInfo) {
            sendInterstitialEvent("info_changed", null, adInfo, null);
        }
    }

    private class RewardedListener implements LevelPlayRewardedAdListener {
        @Override
        public void onAdLoaded(@NonNull LevelPlayAdInfo adInfo) {
            sendRewardedEvent("loaded", null, adInfo, null, null);
        }

        @Override
        public void onAdLoadFailed(@NonNull LevelPlayAdError error) {
            sendRewardedEvent("load_failed", String.valueOf(error), null, error, null);
        }

        @Override
        public void onAdDisplayed(@NonNull LevelPlayAdInfo adInfo) {
            sendRewardedEvent("displayed", null, adInfo, null, null);
        }

        @Override
        public void onAdDisplayFailed(@NonNull LevelPlayAdError error, @NonNull LevelPlayAdInfo adInfo) {
            sendRewardedEvent("display_failed", String.valueOf(error), adInfo, error, null);
        }

        @Override
        public void onAdClosed(@NonNull LevelPlayAdInfo adInfo) {
            sendRewardedEvent("closed", null, adInfo, null, null);
        }

        @Override
        public void onAdClicked(@NonNull LevelPlayAdInfo adInfo) {
            sendRewardedEvent("clicked", null, adInfo, null, null);
        }

        @Override
        public void onAdInfoChanged(@NonNull LevelPlayAdInfo adInfo) {
            sendRewardedEvent("info_changed", null, adInfo, null, null);
        }

        @Override
        public void onAdRewarded(@NonNull LevelPlayReward reward, @NonNull LevelPlayAdInfo adInfo) {
            sendRewardedEvent("rewarded", null, adInfo, null, reward);
        }
    }

    // -------------------------------------------------------------------------
    // Callback payload helpers — GMExtWire streams, no HashMap/Map payloads
    // -------------------------------------------------------------------------

    private void sendBannerEvent(String type, String message, LevelPlayAdInfo adInfo, LevelPlayAdError error) {
        if (mBannerCallback == null) return;
        mBannerCallback.call(eventStream(type, message, adInfo, error, null));
    }

    private void sendInterstitialEvent(String type, String message, LevelPlayAdInfo adInfo, LevelPlayAdError error) {
        if (mInterstitialCallback == null) return;
        mInterstitialCallback.call(eventStream(type, message, adInfo, error, null));
    }

    private void sendRewardedEvent(String type, String message, LevelPlayAdInfo adInfo, LevelPlayAdError error, LevelPlayReward reward) {
        if (mRewardedCallback == null) return;
        mRewardedCallback.call(eventStream(type, message, adInfo, error, reward));
    }

    private GMExtWire.StructStream initEventStream(boolean success, String message) {
        GMExtWire.StructStream stream = new GMExtWire.StructStream();
        stream.kv("type", "init");
        stream.kv("success", success);
        if (message != null) stream.kv("message", message);
        return stream;
    }

    private GMExtWire.StructStream eventStream(String type, String message, LevelPlayAdInfo adInfo, LevelPlayAdError error, LevelPlayReward reward) {
        GMExtWire.StructStream stream = new GMExtWire.StructStream();
        stream.kv("type", type);

        if (message != null) stream.kv("message", message);
        if (adInfo != null) stream.kv("ad_info", adInfoStream(adInfo));
        if (error != null) stream.kv("error", errorStream(error));
        if (reward != null) stream.kv("reward", rewardStream(reward));

        return stream;
    }

    private GMExtWire.StructStream errorStream(LevelPlayAdError error) {
        GMExtWire.StructStream stream = new GMExtWire.StructStream();
        stream.kv("message", String.valueOf(error));
        stream.kv("error_code", error.getErrorCode());
        stream.kv("error_message", error.getErrorMessage());
        return stream;
    }

    private GMExtWire.StructStream rewardStream(LevelPlayReward reward) {
        GMExtWire.StructStream stream = new GMExtWire.StructStream();
        stream.kv("name", reward.getName());
        stream.kv("amount", reward.getAmount());
        return stream;
    }

    private GMExtWire.StructStream adInfoStream(LevelPlayAdInfo adInfo) {
        GMExtWire.StructStream stream = new GMExtWire.StructStream();

        if (adInfo.getAdSize() != null) {
            stream.kv("width", adInfo.getAdSize().getWidth());
            stream.kv("height", adInfo.getAdSize().getHeight());
        } else {
            stream.kv("width", 0);
            stream.kv("height", 0);
        }

        stream.kv("format", safeString(adInfo.getAdFormat()));
        stream.kv("network", safeString(adInfo.getAdNetwork()));
        stream.kv("unit_id", safeString(adInfo.getAdUnitId()));
        stream.kv("unit_name", safeString(adInfo.getAdUnitName()));
        stream.kv("placement_name", safeString(adInfo.getPlacementName()));
        stream.kv("country", safeString(adInfo.getCountry()));
        stream.kv("precision", safeString(adInfo.getPrecision()));
        stream.kv("revenue", adInfo.getRevenue());

        return stream;
    }

    private String safeString(String value) {
        return value == null ? "" : value;
    }

}
