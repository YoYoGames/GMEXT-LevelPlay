
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.GMExtUtils;
import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.GMExtWire.GMFunction;
import ${YYAndroidPackageName}.enums.*;
import ${YYAndroidPackageName}.records.LevelPlayResult;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.RelativeLayout;

import androidx.annotation.NonNull;

import java.util.Objects;
import java.util.Optional;

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

    public LevelPlayError levelplay_init(GMFunction callback) {
        mInitCallback = callback;

        Activity activity = levelplay_get_activity();
        if (activity == null) {
            return LevelPlayError.ActivityUnavailable;
        }

        String appKey = GMExtUtils.GetExtensionOption("GMLevelPlay", "AndroidAppKey");
        if (appKey == null || appKey.length() == 0) {
            return LevelPlayError.MissingAppKey;
        }

        LevelPlayInitRequest initRequest = new LevelPlayInitRequest.Builder(appKey)
                .withUserId("UserID")
                .build();

        LevelPlay.init(activity, initRequest, this);
        return LevelPlayError.Ok;
    }

    @Override
    public void onInitFailed(@NonNull LevelPlayInitError error) {
        mLevelPlayInitialized = false;
        if (mInitCallback != null) mInitCallback.call(resultStream(false, String.valueOf(error)));
    }

    @Override
    public void onInitSuccess(LevelPlayConfiguration configuration) {
        mLevelPlayInitialized = true;
        if (mInitCallback != null) mInitCallback.call(resultStream(true, null));
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

    public LevelPlayError levelplay_interstitial_load() {
        if (!mLevelPlayInitialized) {
            return LevelPlayError.NotInitialized;
        }
        if (mInterstitialAd == null) {
            return LevelPlayError.AdNotInitialized;
        }
        mInterstitialAd.loadAd();
        return LevelPlayError.Ok;
    }

    public boolean levelplay_interstitial_is_ready() {
        return mInterstitialAd != null && mInterstitialAd.isAdReady();
    }

    public boolean levelplay_interstitial_is_placement_capped(String placement_id) {
        if (mInterstitialAd == null) return false;
        return LevelPlayInterstitialAd.isPlacementCapped(placement_id);
    }

    public LevelPlayError levelplay_interstitial_show(String placement_id) {
        Activity activity = levelplay_get_activity();
        if (activity == null) {
            return LevelPlayError.ActivityUnavailable;
        }
        if (mInterstitialAd == null) {
            return LevelPlayError.AdNotInitialized;
        }
        if (!mInterstitialAd.isAdReady()) {
            return LevelPlayError.AdNotReady;
        }
        if (LevelPlayInterstitialAd.isPlacementCapped(placement_id)) {
            return LevelPlayError.PlacementCapped;
        }

        mInterstitialAd.showAd(activity, placement_id);
        return LevelPlayError.Ok;
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

    public LevelPlayError levelplay_rewarded_video_load() {
        if (!mLevelPlayInitialized) {
            return LevelPlayError.NotInitialized;
        }
        if (mRewardedAd == null) {
            return LevelPlayError.AdNotInitialized;
        }
        mRewardedAd.loadAd();
        return LevelPlayError.Ok;
    }

    public boolean levelplay_rewarded_video_is_ready() {
        return mRewardedAd != null && mRewardedAd.isAdReady();
    }

    public boolean levelplay_rewarded_video_is_placement_capped(String placement_id) {
        if (mRewardedAd == null) return false;
        return LevelPlayRewardedAd.isPlacementCapped(placement_id);
    }

    public LevelPlayError levelplay_rewarded_video_show(String placement_id) {
        Activity activity = levelplay_get_activity();
        if (activity == null) {
            return LevelPlayError.ActivityUnavailable;
        }
        if (mRewardedAd == null) {
            return LevelPlayError.AdNotInitialized;
        }
        if (!mRewardedAd.isAdReady()) {
            return LevelPlayError.AdNotReady;
        }
        if (LevelPlayRewardedAd.isPlacementCapped(placement_id)) {
            return LevelPlayError.PlacementCapped;
        }

        mRewardedAd.showAd(activity, placement_id);
        return LevelPlayError.Ok;
    }

    public void levelplay_rewarded_callback_subscribe(GMFunction callback) {
        mRewardedCallback = callback;
    }

    // -------------------------------------------------------------------------
    // Banner
    // -------------------------------------------------------------------------

    public LevelPlayError levelplay_banner_create(String ad_unit_id, LevelPlayBannerSize size, LevelPlayBannerAlignH align_h, LevelPlayBannerAlignV align_v) {
        if (!mLevelPlayInitialized) {
            return LevelPlayError.NotInitialized;
        }
        if (levelplay_get_activity() == null) {
            return LevelPlayError.ActivityUnavailable;
        }

        RunnerActivity.ViewHandler.post(() -> {
            Activity activity = levelplay_get_activity();
            if (activity == null) {
                // Activity vanished between the synchronous guard above and this UI-thread hop;
                // there is no return channel left at this point, fall back to the callback.
                sendBannerFailure(ERR_ACTIVITY_UNAVAILABLE);
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
                // Root-view unavailability can only be discovered here, on the main thread,
                // after levelplay_banner_create's synchronous LevelPlayError return already
                // reached GML -- the one deliberate exception to "guard failures skip the
                // callback".
                sendBannerFailure("Root view is unavailable.");
                return;
            }

            rootView.addView(mBannerLayout);
            mLevelPlayBanner.requestLayout();
            mLevelPlayBanner.setVisibility(View.VISIBLE);
            mLevelPlayBanner.loadAd();
        });

        return LevelPlayError.Ok;
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
            sendBannerEvent(LevelPlayCallbackEvent.Loaded, adInfo, null);
        }

        @Override
        public void onAdLoadFailed(@NonNull LevelPlayAdError error) {
            sendBannerEvent(LevelPlayCallbackEvent.LoadFailed, null, error);
        }

        @Override
        public void onAdDisplayed(@NonNull LevelPlayAdInfo adInfo) {
            sendBannerEvent(LevelPlayCallbackEvent.Displayed, adInfo, null);
        }

        @Override
        public void onAdDisplayFailed(@NonNull LevelPlayAdInfo adInfo, @NonNull LevelPlayAdError error) {
            sendBannerEvent(LevelPlayCallbackEvent.DisplayFailed, adInfo, error);
        }

        @Override
        public void onAdClicked(@NonNull LevelPlayAdInfo adInfo) {
            sendBannerEvent(LevelPlayCallbackEvent.Clicked, adInfo, null);
        }

        @Override
        public void onAdExpanded(@NonNull LevelPlayAdInfo adInfo) {
            sendBannerEvent(LevelPlayCallbackEvent.Expanded, adInfo, null);
        }

        @Override
        public void onAdCollapsed(@NonNull LevelPlayAdInfo adInfo) {
            sendBannerEvent(LevelPlayCallbackEvent.Collapsed, adInfo, null);
        }

        @Override
        public void onAdLeftApplication(@NonNull LevelPlayAdInfo adInfo) {
            sendBannerEvent(LevelPlayCallbackEvent.LeftApplication, adInfo, null);
        }
    }

    private class InterstitialListener implements LevelPlayInterstitialAdListener {
        @Override
        public void onAdLoaded(@NonNull LevelPlayAdInfo adInfo) {
            sendInterstitialEvent(LevelPlayCallbackEvent.Loaded, adInfo, null);
        }

        @Override
        public void onAdLoadFailed(@NonNull LevelPlayAdError error) {
            sendInterstitialEvent(LevelPlayCallbackEvent.LoadFailed, null, error);
        }

        @Override
        public void onAdDisplayed(@NonNull LevelPlayAdInfo adInfo) {
            sendInterstitialEvent(LevelPlayCallbackEvent.Displayed, adInfo, null);
        }

        @Override
        public void onAdDisplayFailed(@NonNull LevelPlayAdError error, @NonNull LevelPlayAdInfo adInfo) {
            sendInterstitialEvent(LevelPlayCallbackEvent.DisplayFailed, adInfo, error);
        }

        @Override
        public void onAdClosed(@NonNull LevelPlayAdInfo adInfo) {
            sendInterstitialEvent(LevelPlayCallbackEvent.Closed, adInfo, null);
        }

        @Override
        public void onAdClicked(@NonNull LevelPlayAdInfo adInfo) {
            sendInterstitialEvent(LevelPlayCallbackEvent.Clicked, adInfo, null);
        }

        @Override
        public void onAdInfoChanged(@NonNull LevelPlayAdInfo adInfo) {
            sendInterstitialEvent(LevelPlayCallbackEvent.InfoChanged, adInfo, null);
        }
    }

    private class RewardedListener implements LevelPlayRewardedAdListener {
        @Override
        public void onAdLoaded(@NonNull LevelPlayAdInfo adInfo) {
            sendRewardedEvent(LevelPlayCallbackEvent.Loaded, adInfo, null, null);
        }

        @Override
        public void onAdLoadFailed(@NonNull LevelPlayAdError error) {
            sendRewardedEvent(LevelPlayCallbackEvent.LoadFailed, null, error, null);
        }

        @Override
        public void onAdDisplayed(@NonNull LevelPlayAdInfo adInfo) {
            sendRewardedEvent(LevelPlayCallbackEvent.Displayed, adInfo, null, null);
        }

        @Override
        public void onAdDisplayFailed(@NonNull LevelPlayAdError error, @NonNull LevelPlayAdInfo adInfo) {
            sendRewardedEvent(LevelPlayCallbackEvent.DisplayFailed, adInfo, error, null);
        }

        @Override
        public void onAdClosed(@NonNull LevelPlayAdInfo adInfo) {
            sendRewardedEvent(LevelPlayCallbackEvent.Closed, adInfo, null, null);
        }

        @Override
        public void onAdClicked(@NonNull LevelPlayAdInfo adInfo) {
            sendRewardedEvent(LevelPlayCallbackEvent.Clicked, adInfo, null, null);
        }

        @Override
        public void onAdInfoChanged(@NonNull LevelPlayAdInfo adInfo) {
            sendRewardedEvent(LevelPlayCallbackEvent.InfoChanged, adInfo, null, null);
        }

        @Override
        public void onAdRewarded(@NonNull LevelPlayReward reward, @NonNull LevelPlayAdInfo adInfo) {
            sendRewardedEvent(LevelPlayCallbackEvent.Rewarded, adInfo, null, reward);
        }
    }

    // -------------------------------------------------------------------------
    // Callback payload helpers — GMExtWire streams, no HashMap/Map payloads
    // -------------------------------------------------------------------------

    private void sendBannerEvent(LevelPlayCallbackEvent type, LevelPlayAdInfo adInfo, LevelPlayAdError error) {
        if (mBannerCallback == null) return;
        mBannerCallback.call(resultStream(type, error), type, adInfoOptional(adInfo));
    }

    private void sendInterstitialEvent(LevelPlayCallbackEvent type, LevelPlayAdInfo adInfo, LevelPlayAdError error) {
        if (mInterstitialCallback == null) return;
        mInterstitialCallback.call(resultStream(type, error), type, adInfoOptional(adInfo));
    }

    private void sendRewardedEvent(LevelPlayCallbackEvent type, LevelPlayAdInfo adInfo, LevelPlayAdError error, LevelPlayReward reward) {
        if (mRewardedCallback == null) return;
        mRewardedCallback.call(resultStream(type, error), type, adInfoOptional(adInfo), rewardOptional(reward));
    }

    // The one deliberate exception to "guard failures skip the callback" -- see
    // levelplay_banner_create's root-view-unavailable path.
    private void sendBannerFailure(String errorMessage) {
        if (mBannerCallback == null) return;
        mBannerCallback.call(resultStream(false, errorMessage), LevelPlayCallbackEvent.LoadFailed,
                Optional.<${YYAndroidPackageName}.records.LevelPlayAdInfo>empty());
    }

    private LevelPlayResult resultStream(boolean success, String errorMessage) {
        return new LevelPlayResult(success, Optional.ofNullable(errorMessage), Optional.empty());
    }

    private LevelPlayResult resultStream(LevelPlayCallbackEvent type, LevelPlayAdError error) {
        boolean success = type != LevelPlayCallbackEvent.LoadFailed && type != LevelPlayCallbackEvent.DisplayFailed;

        if (error == null) {
            return new LevelPlayResult(success, Optional.empty(), Optional.empty());
        }

        return new LevelPlayResult(
                success,
                Optional.ofNullable(error.getErrorMessage()),
                Optional.of(error.getErrorCode())
        );
    }

    private Optional<${YYAndroidPackageName}.records.LevelPlayAdInfo> adInfoOptional(LevelPlayAdInfo adInfo) {
        return adInfo != null ? Optional.of(adInfoStream(adInfo)) : Optional.empty();
    }

    private Optional<${YYAndroidPackageName}.records.LevelPlayReward> rewardOptional(LevelPlayReward reward) {
        return reward != null ? Optional.of(rewardStream(reward)) : Optional.empty();
    }

    private ${YYAndroidPackageName}.records.LevelPlayReward rewardStream(LevelPlayReward reward) {
        return new ${YYAndroidPackageName}.records.LevelPlayReward(
                Objects.requireNonNullElse(reward.getName(), ""),
                reward.getAmount()
        );
    }

    private ${YYAndroidPackageName}.records.LevelPlayAdInfo adInfoStream(LevelPlayAdInfo adInfo) {
        int width = 0;
        int height = 0;

        if (adInfo.getAdSize() != null) {
            width = adInfo.getAdSize().getWidth();
            height = adInfo.getAdSize().getHeight();
        }

        return new ${YYAndroidPackageName}.records.LevelPlayAdInfo(
                width,
                height,
                Optional.ofNullable(adInfo.getAdFormat()),
                Optional.ofNullable(adInfo.getAdNetwork()),
                Optional.ofNullable(adInfo.getAdUnitId()),
                Optional.ofNullable(adInfo.getAdUnitName()),
                Optional.ofNullable(adInfo.getPlacementName()),
                Optional.ofNullable(adInfo.getCountry()),
                Optional.ofNullable(adInfo.getPrecision()),
                Optional.ofNullable(adInfo.getRevenue())
        );
    }

}
