#import "GMLevelPlay_ios.h"

#import "core/GMExtUtils.h"
#import "core/GMExtWire.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <IronSource/IronSource.h>

#include <cstdint>
#include <string>
#include <string_view>

extern UIViewController *g_controller;
extern UIView *g_glView;

/*
extern "C" void AudioPauseAll(bool bSuspend);
extern "C" void AudioResumeAll(void);
extern "C" void Audio_DevicePause(void);
extern "C" void Audio_DeviceResume(void);
*/

static NSString *NSStringFromStringView(std::string_view value)
{
    NSString *result = [[NSString alloc] initWithBytes:value.data()
                                                length:value.size()
                                              encoding:NSUTF8StringEncoding];
    return result != nil ? result : @"";
}

static std::string StringFromNSString(NSString *value)
{
    if (value == nil) return std::string();

    const char *utf8 = [value UTF8String];
    return utf8 != nullptr ? std::string(utf8) : std::string();
}

static std::string StringFromNSError(NSError *error)
{
    if (error == nil) return std::string();

    NSString *message = error.localizedDescription;
    if (message == nil || message.length == 0) {
        message = error.description;
    }

    return StringFromNSString(message);
}

static NSString *LevelPlayAppKey(void)
{
    std::string appKey = gm::ExtUtils::GetExtensionOption("GMLevelPlay", "iOSAppKey");

    if (appKey.empty()) {
        // Compatibility with the old YYLevelPlay extension option namespace.
        appKey = gm::ExtUtils::GetExtensionOption("LevelPlay", "iOSAppKey");
    }

    NSString *result = [NSString stringWithUTF8String:appKey.c_str()];
    return result != nil ? result : @"";
}

@class GMLevelPlay;

@interface GMLevelPlayInterstitialDelegate : NSObject <LPMInterstitialAdDelegate>
@property(nonatomic, assign) GMLevelPlay *owner;
- (instancetype)initWithOwner:(GMLevelPlay *)owner;
@end

@interface GMLevelPlayRewardedDelegate : NSObject <LPMRewardedAdDelegate>
@property(nonatomic, assign) GMLevelPlay *owner;
- (instancetype)initWithOwner:(GMLevelPlay *)owner;
@end

@interface GMLevelPlayBannerDelegate : NSObject <LPMBannerAdViewDelegate>
@property(nonatomic, assign) GMLevelPlay *owner;
- (instancetype)initWithOwner:(GMLevelPlay *)owner;
@end

// IMPORTANT:
// GMLevelPlay is already declared in GMLevelPlay_ios.h.
// Do NOT redeclare it as:
// @interface GMLevelPlay : GMLevelPlayInternal <GMLevelPlayInterface>
// That causes: duplicate interface definition for class 'GMLevelPlay'.
@interface GMLevelPlay ()
{
    // Store GMFunction as direct ivars, not Objective-C properties.
    // Using @property with a C++ value type makes the getter return temporary copies,
    // and those temporaries can destruct/free GameMaker-managed memory at unsafe times.
    gm::wire::GMFunction mInitCallback;
    gm::wire::GMFunction mBannerCallback;
    gm::wire::GMFunction mInterstitialCallback;
    gm::wire::GMFunction mRewardedCallback;
}

@property(nonatomic, assign) BOOL levelPlayInitialized;

@property(nonatomic, retain) LPMInterstitialAd *interstitialAd;
@property(nonatomic, retain) LPMRewardedAd *rewardedAd;
@property(nonatomic, retain) LPMBannerAdView *bannerAdView;
@property(nonatomic, retain) LPMAdSize *bannerSize;
@property(nonatomic, retain) NSArray<NSLayoutConstraint *> *bannerConstraints;

@property(nonatomic, retain) GMLevelPlayInterstitialDelegate *interstitialDelegate;
@property(nonatomic, retain) GMLevelPlayRewardedDelegate *rewardedDelegate;
@property(nonatomic, retain) GMLevelPlayBannerDelegate *bannerDelegate;

- (UIViewController *)rootViewController;
- (UIView *)rootView;

- (LPMAdSize *)adSizeFromEnum:(gm_enums::LevelPlayBannerSize)size;

- (void)destroyBannerOnMainThread;
- (void)moveBannerOnMainThreadWithAlignH:(gm_enums::LevelPlayBannerHAlign)align_h
                                  alignV:(gm_enums::LevelPlayBannerVAlign)align_v;

- (gm_structs::LevelPlayAdInfo)adInfoStream:(LPMAdInfo *)adInfo;
- (gm_structs::LevelPlayReward)rewardStream:(LPMReward *)reward;
- (gm_structs::LevelPlayResult)resultStream:(bool)success message:(NSString *)message;
- (gm_structs::LevelPlayResult)resultStream:(gm_enums::LevelPlayCallbackEvent)type error:(NSError *)error;

- (void)sendBannerEvent:(gm_enums::LevelPlayCallbackEvent)type
                  adInfo:(LPMAdInfo *)adInfo
                   error:(NSError *)error;

- (void)sendInterstitialEvent:(gm_enums::LevelPlayCallbackEvent)type
                        adInfo:(LPMAdInfo *)adInfo
                         error:(NSError *)error;

- (void)sendRewardedEvent:(gm_enums::LevelPlayCallbackEvent)type
                    adInfo:(LPMAdInfo *)adInfo
                     error:(NSError *)error
                    reward:(LPMReward *)reward;

// The one deliberate exception to "guard failures skip the callback" -- see
// levelplay_banner_create's root-view-unavailable path.
- (void)sendBannerFailure:(NSString *)message;

@end

@implementation GMLevelPlayInterstitialDelegate

- (instancetype)initWithOwner:(GMLevelPlay *)owner
{
    self = [super init];
    if (self) {
        self.owner = owner;
    }
    return self;
}

- (void)didLoadAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendInterstitialEvent:gm_enums::LevelPlayCallbackEvent::Loaded adInfo:adInfo error:nil];
}

- (void)didFailToLoadAdWithAdUnitId:(NSString *)adUnitId error:(NSError *)error
{
    [self.owner sendInterstitialEvent:gm_enums::LevelPlayCallbackEvent::LoadFailed adInfo:nil error:error];
}

- (void)didDisplayAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendInterstitialEvent:gm_enums::LevelPlayCallbackEvent::Displayed adInfo:adInfo error:nil];
}

- (void)didFailToDisplayAdWithAdInfo:(LPMAdInfo *)adInfo error:(NSError *)error
{
    [self.owner sendInterstitialEvent:gm_enums::LevelPlayCallbackEvent::DisplayFailed adInfo:adInfo error:error];

    //Audio_DeviceResume();
    //AudioResumeAll();
}

- (void)didCloseAdWithAdInfo:(LPMAdInfo *)adInfo
{
    //Audio_DeviceResume();
    //AudioResumeAll();

    [self.owner sendInterstitialEvent:gm_enums::LevelPlayCallbackEvent::Closed adInfo:adInfo error:nil];
}

- (void)didClickAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendInterstitialEvent:gm_enums::LevelPlayCallbackEvent::Clicked adInfo:adInfo error:nil];
}

- (void)didChangeAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendInterstitialEvent:gm_enums::LevelPlayCallbackEvent::InfoChanged adInfo:adInfo error:nil];
}

@end

@implementation GMLevelPlayRewardedDelegate

- (instancetype)initWithOwner:(GMLevelPlay *)owner
{
    self = [super init];
    if (self) {
        self.owner = owner;
    }
    return self;
}

- (void)didLoadAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendRewardedEvent:gm_enums::LevelPlayCallbackEvent::Loaded adInfo:adInfo error:nil reward:nil];
}

- (void)didFailToLoadAdWithAdUnitId:(NSString *)adUnitId error:(NSError *)error
{
    [self.owner sendRewardedEvent:gm_enums::LevelPlayCallbackEvent::LoadFailed adInfo:nil error:error reward:nil];
}

- (void)didDisplayAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendRewardedEvent:gm_enums::LevelPlayCallbackEvent::Displayed adInfo:adInfo error:nil reward:nil];
}

- (void)didFailToDisplayAdWithAdInfo:(LPMAdInfo *)adInfo error:(NSError *)error
{
    [self.owner sendRewardedEvent:gm_enums::LevelPlayCallbackEvent::DisplayFailed adInfo:adInfo error:error reward:nil];

    //Audio_DeviceResume();
    //AudioResumeAll();
}

- (void)didCloseAdWithAdInfo:(LPMAdInfo *)adInfo
{
    //Audio_DeviceResume();
    //AudioResumeAll();

    [self.owner sendRewardedEvent:gm_enums::LevelPlayCallbackEvent::Closed adInfo:adInfo error:nil reward:nil];
}

- (void)didClickAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendRewardedEvent:gm_enums::LevelPlayCallbackEvent::Clicked adInfo:adInfo error:nil reward:nil];
}

- (void)didChangeAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendRewardedEvent:gm_enums::LevelPlayCallbackEvent::InfoChanged adInfo:adInfo error:nil reward:nil];
}

- (void)didRewardAdWithAdInfo:(LPMAdInfo *)adInfo reward:(LPMReward *)reward
{
    [self.owner sendRewardedEvent:gm_enums::LevelPlayCallbackEvent::Rewarded adInfo:adInfo error:nil reward:reward];
}

@end

@implementation GMLevelPlayBannerDelegate

- (instancetype)initWithOwner:(GMLevelPlay *)owner
{
    self = [super init];
    if (self) {
        self.owner = owner;
    }
    return self;
}

- (void)didLoadAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendBannerEvent:gm_enums::LevelPlayCallbackEvent::Loaded adInfo:adInfo error:nil];
}

- (void)didFailToLoadAdWithAdUnitId:(NSString *)adUnitId error:(NSError *)error
{
    [self.owner sendBannerEvent:gm_enums::LevelPlayCallbackEvent::LoadFailed adInfo:nil error:error];
}

- (void)didDisplayAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendBannerEvent:gm_enums::LevelPlayCallbackEvent::Displayed adInfo:adInfo error:nil];
}

- (void)didFailToDisplayAdWithAdInfo:(LPMAdInfo *)adInfo error:(NSError *)error
{
    [self.owner sendBannerEvent:gm_enums::LevelPlayCallbackEvent::DisplayFailed adInfo:adInfo error:error];
}

- (void)didClickAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendBannerEvent:gm_enums::LevelPlayCallbackEvent::Clicked adInfo:adInfo error:nil];
}

- (void)didExpandAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendBannerEvent:gm_enums::LevelPlayCallbackEvent::Expanded adInfo:adInfo error:nil];
}

- (void)didCollapseAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendBannerEvent:gm_enums::LevelPlayCallbackEvent::Collapsed adInfo:adInfo error:nil];
}

- (void)didLeaveAppWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendBannerEvent:gm_enums::LevelPlayCallbackEvent::LeftApplication adInfo:adInfo error:nil];
}

@end

@implementation GMLevelPlay

- (instancetype)init
{
    self = [super init];

    if (self) {
        self.levelPlayInitialized = NO;
        self.bannerConstraints = [NSArray array];

        self.interstitialDelegate = [[GMLevelPlayInterstitialDelegate alloc] initWithOwner:self];
        self.rewardedDelegate = [[GMLevelPlayRewardedDelegate alloc] initWithOwner:self];
        self.bannerDelegate = [[GMLevelPlayBannerDelegate alloc] initWithOwner:self];
    }

    return self;
}

- (void)dealloc
{
    if ([NSThread isMainThread]) {
        if (self.bannerConstraints != nil && self.bannerConstraints.count > 0) {
            [NSLayoutConstraint deactivateConstraints:self.bannerConstraints];
        }

        if (self.bannerAdView != nil) {
            [self.bannerAdView destroy];
            [self.bannerAdView removeFromSuperview];
        }
    } else {
        // dealloc can run off the main thread; do not capture self in the hop below --
        // self's retain count is already zero here, and ARC would try to re-retain it
        // implicitly on any block capture that references self. Capture the plain UIKit
        // objects into local __strong variables instead; ARC keeps them alive for the
        // block's duration on its own, no manual retain/release needed.
        LPMBannerAdView *bannerAdView = self.bannerAdView;
        NSArray<NSLayoutConstraint *> *bannerConstraints = self.bannerConstraints;

        dispatch_sync(dispatch_get_main_queue(), ^{
            if (bannerConstraints != nil && bannerConstraints.count > 0) {
                [NSLayoutConstraint deactivateConstraints:bannerConstraints];
            }

            if (bannerAdView != nil) {
                [bannerAdView destroy];
                [bannerAdView removeFromSuperview];
            }
        });
    }

    // Not manually nil-ing interstitialAd/rewardedAd's delegate here: LPMInterstitialAd/
    // LPMRewardedAd document that the delegate is held weakly, and setDelegate: is
    // non-nullable in this SDK version (passing nil is a hard API violation, not just a
    // style choice) -- the weak reference self-zeroes once interstitialDelegate/
    // rewardedDelegate are released below, same effect without the disallowed nil send.

    self.interstitialAd = nil;
    self.rewardedAd = nil;
    self.bannerAdView = nil;
    self.bannerSize = nil;
    self.bannerConstraints = nil;

    self.interstitialDelegate.owner = nil;
    self.rewardedDelegate.owner = nil;
    self.bannerDelegate.owner = nil;

    self.interstitialDelegate = nil;
    self.rewardedDelegate = nil;
    self.bannerDelegate = nil;
}

- (UIViewController *)rootViewController
{
    return g_controller;
}

- (UIView *)rootView
{
    if (g_glView != nil) {
        return g_glView;
    }

    if (g_controller != nil) {
        return g_controller.view;
    }

    return nil;
}

- (LPMAdSize *)adSizeFromEnum:(gm_enums::LevelPlayBannerSize)size
{
    switch (size) {
        case gm_enums::LevelPlayBannerSize::Large:
            return [LPMAdSize largeSize];

        case gm_enums::LevelPlayBannerSize::MediumRectangle:
            return [LPMAdSize mediumRectangleSize];

        case gm_enums::LevelPlayBannerSize::Adaptive:
            return [LPMAdSize createAdaptiveAdSize];

        case gm_enums::LevelPlayBannerSize::Banner:
        default:
            return [LPMAdSize bannerSize];
    }
}

- (gm_enums::LevelPlayError)levelplay_init:(gm::wire::GMFunction)callback
{
    mInitCallback = callback;

    NSString *appKey = LevelPlayAppKey();

    if (appKey.length == 0) {
        return gm_enums::LevelPlayError::MissingAppKey;
    }

    LPMInitRequestBuilder *requestBuilder = [[LPMInitRequestBuilder alloc] initWithAppKey:appKey];
    LPMInitRequest *initRequest = [requestBuilder build];

    // Project compiles under ARC: this block strongly captures blockSelf automatically
    // (the normal, desired behavior here -- it keeps the singleton owner alive for the
    // outstanding async completion, not a retain-cycle risk since the SDK's own completion
    // block isn't stored long-term back on self).
    GMLevelPlay *blockSelf = self;

    [LevelPlay initWithRequest:initRequest
                    completion:^(LPMConfiguration *_Nullable config, NSError *_Nullable error) {
        (void)config;

        dispatch_async(dispatch_get_main_queue(), ^{
            gm_structs::LevelPlayResult result{};

            if (error != nil) {
                blockSelf.levelPlayInitialized = NO;
                result.success = false;
                result.error_message = StringFromNSError(error);
            } else {
                blockSelf.levelPlayInitialized = YES;
                result.success = true;
            }

            if (blockSelf->mInitCallback) {
                blockSelf->mInitCallback.call(result);
            }
        });
    }];

    return gm_enums::LevelPlayError::Ok;
}

- (bool)levelplay_is_initialized
{
    return self.levelPlayInitialized;
}

- (void)levelplay_set_consent:(bool)enable
{
    [LPMPrivacySettings setGDPRConsent:enable];
}

- (void)levelplay_set_metadata:(std::string_view)key value:(std::string_view)value
{
    [LevelPlay setMetaDataWithKey:NSStringFromStringView(key)
                             value:NSStringFromStringView(value)];
}

- (void)levelplay_set_dynamic_user_id:(std::string_view)user_id
{
    [LevelPlay setDynamicUserId:NSStringFromStringView(user_id)];
}

- (void)levelplay_launch_test_suite
{
    UIViewController *controller = [self rootViewController];

    if (controller != nil) {
        [LevelPlay launchTestSuite:controller];
    }
}

- (void)levelplay_interstitial_init:(std::string_view)ad_unit_id
{
    self.interstitialAd = [[LPMInterstitialAd alloc] initWithAdUnitId:NSStringFromStringView(ad_unit_id)];
    self.interstitialAd.delegate = self.interstitialDelegate;
}

- (gm_enums::LevelPlayError)levelplay_interstitial_load
{
    if (!self.levelPlayInitialized) {
        return gm_enums::LevelPlayError::NotInitialized;
    }

    if (self.interstitialAd == nil) {
        return gm_enums::LevelPlayError::AdNotInitialized;
    }

    [self.interstitialAd loadAd];
    return gm_enums::LevelPlayError::Ok;
}

- (bool)levelplay_interstitial_is_ready
{
    return self.interstitialAd != nil && [self.interstitialAd isAdReady];
}

- (bool)levelplay_interstitial_is_placement_capped:(std::string_view)placement_id
{
    if (placement_id.empty()) {
        return false;
    }

    return [LPMInterstitialAd isPlacementCapped:NSStringFromStringView(placement_id)];
}

- (gm_enums::LevelPlayError)levelplay_interstitial_show:(std::string_view)placement_id
{
    UIViewController *controller = [self rootViewController];

    if (controller == nil) {
        return gm_enums::LevelPlayError::ActivityUnavailable;
    }

    if (self.interstitialAd == nil) {
        return gm_enums::LevelPlayError::AdNotInitialized;
    }

    if (![self.interstitialAd isAdReady]) {
        return gm_enums::LevelPlayError::AdNotReady;
    }

    NSString *placement = NSStringFromStringView(placement_id);

    if (placement.length > 0 && [LPMInterstitialAd isPlacementCapped:placement]) {
        return gm_enums::LevelPlayError::PlacementCapped;
    }

    //AudioPauseAll(false);
    //Audio_DevicePause();

    [self.interstitialAd showAdWithViewController:controller
                                    placementName:placement.length > 0 ? placement : nil];

    return gm_enums::LevelPlayError::Ok;
}

- (void)levelplay_interstitial_callback_subscribe:(gm::wire::GMFunction)callback
{
    mInterstitialCallback = callback;
}

- (void)levelplay_rewarded_video_init:(std::string_view)ad_unit_id
{
    self.rewardedAd = [[LPMRewardedAd alloc] initWithAdUnitId:NSStringFromStringView(ad_unit_id)];
    self.rewardedAd.delegate = self.rewardedDelegate;
}

- (gm_enums::LevelPlayError)levelplay_rewarded_video_load
{
    if (!self.levelPlayInitialized) {
        return gm_enums::LevelPlayError::NotInitialized;
    }

    if (self.rewardedAd == nil) {
        return gm_enums::LevelPlayError::AdNotInitialized;
    }

    [self.rewardedAd loadAd];
    return gm_enums::LevelPlayError::Ok;
}

- (bool)levelplay_rewarded_video_is_ready
{
    return self.rewardedAd != nil && [self.rewardedAd isAdReady];
}

- (bool)levelplay_rewarded_video_is_placement_capped:(std::string_view)placement_id
{
    if (placement_id.empty()) {
        return false;
    }

    return [LPMRewardedAd isPlacementCapped:NSStringFromStringView(placement_id)];
}

- (gm_enums::LevelPlayError)levelplay_rewarded_video_show:(std::string_view)placement_id
{
    UIViewController *controller = [self rootViewController];

    if (controller == nil) {
        return gm_enums::LevelPlayError::ActivityUnavailable;
    }

    if (self.rewardedAd == nil) {
        return gm_enums::LevelPlayError::AdNotInitialized;
    }

    if (![self.rewardedAd isAdReady]) {
        return gm_enums::LevelPlayError::AdNotReady;
    }

    NSString *placement = NSStringFromStringView(placement_id);

    if (placement.length > 0 && [LPMRewardedAd isPlacementCapped:placement]) {
        return gm_enums::LevelPlayError::PlacementCapped;
    }

    //AudioPauseAll(false);
    //Audio_DevicePause();

    [self.rewardedAd showAdWithViewController:controller
                                placementName:placement.length > 0 ? placement : nil];

    return gm_enums::LevelPlayError::Ok;
}

- (void)levelplay_rewarded_callback_subscribe:(gm::wire::GMFunction)callback
{
    mRewardedCallback = callback;
}

- (gm_enums::LevelPlayError)levelplay_banner_create:(std::string_view)ad_unit_id
                           size:(gm_enums::LevelPlayBannerSize)size
                        align_h:(gm_enums::LevelPlayBannerHAlign)align_h
                        align_v:(gm_enums::LevelPlayBannerVAlign)align_v
{
    if (!self.levelPlayInitialized) {
        return gm_enums::LevelPlayError::NotInitialized;
    }

    if ([self rootViewController] == nil) {
        return gm_enums::LevelPlayError::ActivityUnavailable;
    }

    NSString *adUnitId = NSStringFromStringView(ad_unit_id);

    dispatch_async(dispatch_get_main_queue(), ^{
        [self destroyBannerOnMainThread];

        UIView *rootView = [self rootView];
        UIViewController *controller = [self rootViewController];

        if (controller == nil) {
            // Controller vanished between the synchronous guard above and this main-thread hop;
            // there is no return channel left at this point, fall back to the callback.
            [self sendBannerFailure:@"Current iOS view controller is unavailable."];
            return;
        }

        if (rootView == nil) {
            // Root-view unavailability can only be discovered here, on the main thread, after
            // levelplay_banner_create's synchronous LevelPlayError return already reached GML --
            // the one deliberate exception to "guard failures skip the callback".
            [self sendBannerFailure:@"Current iOS root view is unavailable."];
            return;
        }

        self.bannerSize = [self adSizeFromEnum:size];

        LPMBannerAdViewConfig *bannerConfig =
            [[[[LPMBannerAdViewConfigBuilder alloc] init] setWithAdSize:self.bannerSize] build];

        self.bannerAdView = [[LPMBannerAdView alloc] initWithAdUnitId:adUnitId config:bannerConfig];
        [self.bannerAdView setDelegate:self.bannerDelegate];

        self.bannerAdView.translatesAutoresizingMaskIntoConstraints = NO;

        [rootView addSubview:self.bannerAdView];

        [self moveBannerOnMainThreadWithAlignH:align_h alignV:align_v];

        [self.bannerAdView loadAdWithViewController:controller];
    });

    return gm_enums::LevelPlayError::Ok;
}

- (void)levelplay_banner_move:(gm_enums::LevelPlayBannerHAlign)align_h
                      align_v:(gm_enums::LevelPlayBannerVAlign)align_v
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self moveBannerOnMainThreadWithAlignH:align_h alignV:align_v];
    });
}

- (void)levelplay_banner_destroy
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self destroyBannerOnMainThread];
    });
}

- (void)levelplay_banner_callback_subscribe:(gm::wire::GMFunction)callback
{
    mBannerCallback = callback;
}

- (void)destroyBannerOnMainThread
{
    if (self.bannerConstraints != nil && self.bannerConstraints.count > 0) {
        [NSLayoutConstraint deactivateConstraints:self.bannerConstraints];
        self.bannerConstraints = [NSArray array];
    }

    if (self.bannerAdView != nil) {
        [self.bannerAdView destroy];
        [self.bannerAdView removeFromSuperview];
        self.bannerAdView = nil;
    }

    self.bannerSize = nil;
}

- (void)moveBannerOnMainThreadWithAlignH:(gm_enums::LevelPlayBannerHAlign)align_h
                                  alignV:(gm_enums::LevelPlayBannerVAlign)align_v
{
    if (self.bannerAdView == nil || self.bannerSize == nil) {
        return;
    }

    UIView *rootView = [self rootView];

    if (rootView == nil) {
        return;
    }

    if (self.bannerConstraints != nil && self.bannerConstraints.count > 0) {
        [NSLayoutConstraint deactivateConstraints:self.bannerConstraints];
        self.bannerConstraints = [NSArray array];
    }

    UILayoutGuide *safeArea = rootView.safeAreaLayoutGuide;

    NSLayoutConstraint *xConstraint = nil;

    switch (align_h) {
        case gm_enums::LevelPlayBannerHAlign::Left:
            xConstraint = [self.bannerAdView.leftAnchor constraintEqualToAnchor:safeArea.leftAnchor];
            break;

        case gm_enums::LevelPlayBannerHAlign::Right:
            xConstraint = [self.bannerAdView.rightAnchor constraintEqualToAnchor:safeArea.rightAnchor];
            break;

        case gm_enums::LevelPlayBannerHAlign::Center:
        default:
            xConstraint = [self.bannerAdView.centerXAnchor constraintEqualToAnchor:safeArea.centerXAnchor];
            break;
    }

    NSLayoutConstraint *yConstraint = nil;

    switch (align_v) {
        case gm_enums::LevelPlayBannerVAlign::Top:
            yConstraint = [self.bannerAdView.topAnchor constraintEqualToAnchor:safeArea.topAnchor];
            break;

        case gm_enums::LevelPlayBannerVAlign::Center:
            yConstraint = [self.bannerAdView.centerYAnchor constraintEqualToAnchor:safeArea.centerYAnchor];
            break;

        case gm_enums::LevelPlayBannerVAlign::Bottom:
        default:
            yConstraint = [self.bannerAdView.bottomAnchor constraintEqualToAnchor:safeArea.bottomAnchor];
            break;
    }

    CGFloat width = self.bannerSize.width;
    CGFloat height = self.bannerSize.height;

    NSMutableArray<NSLayoutConstraint *> *constraints = [NSMutableArray array];

    if (xConstraint != nil) {
        [constraints addObject:xConstraint];
    }

    if (yConstraint != nil) {
        [constraints addObject:yConstraint];
    }

    if (width > 0) {
        [constraints addObject:[self.bannerAdView.widthAnchor constraintEqualToConstant:width]];
    }

    if (height > 0) {
        [constraints addObject:[self.bannerAdView.heightAnchor constraintEqualToConstant:height]];
    }

    self.bannerConstraints = constraints;

    [NSLayoutConstraint activateConstraints:self.bannerConstraints];
}

- (gm_structs::LevelPlayAdInfo)adInfoStream:(LPMAdInfo *)adInfo
{
    gm_structs::LevelPlayAdInfo info{};

    if (adInfo == nil) {
        return info;
    }

    if (adInfo.adSize != nil) {
        info.width = static_cast<std::int32_t>(adInfo.adSize.width);
        info.height = static_cast<std::int32_t>(adInfo.adSize.height);
    }

    if (adInfo.adFormat != nil) {
        info.format = StringFromNSString(adInfo.adFormat);
    }

    if (adInfo.adNetwork != nil) {
        info.network = StringFromNSString(adInfo.adNetwork);
    }

    if (adInfo.adUnitId != nil) {
        info.unit_id = StringFromNSString(adInfo.adUnitId);
    }

    if (adInfo.adUnitName != nil) {
        info.unit_name = StringFromNSString(adInfo.adUnitName);
    }

    if (adInfo.placementName != nil) {
        info.placement_name = StringFromNSString(adInfo.placementName);
    }

    if (adInfo.country != nil) {
        info.country = StringFromNSString(adInfo.country);
    }

    if (adInfo.precision != nil) {
        info.precision = StringFromNSString([adInfo.precision description]);
    }

    if (adInfo.revenue != nil) {
        info.revenue = [adInfo.revenue doubleValue];
    }

    return info;
}

- (gm_structs::LevelPlayReward)rewardStream:(LPMReward *)reward
{
    gm_structs::LevelPlayReward r{};

    if (reward == nil) {
        return r;
    }

    r.name = StringFromNSString(reward.name);
    r.amount = static_cast<std::int32_t>(reward.amount);

    return r;
}

- (gm_structs::LevelPlayResult)resultStream:(bool)success message:(NSString *)message
{
    gm_structs::LevelPlayResult result{};
    result.success = success;

    if (message != nil && message.length > 0) {
        result.error_message = StringFromNSString(message);
    }

    return result;
}

- (gm_structs::LevelPlayResult)resultStream:(gm_enums::LevelPlayCallbackEvent)type error:(NSError *)error
{
    gm_structs::LevelPlayResult result{};
    result.success = (type != gm_enums::LevelPlayCallbackEvent::LoadFailed
                       && type != gm_enums::LevelPlayCallbackEvent::DisplayFailed);

    if (error != nil) {
        if (error.localizedDescription != nil && error.localizedDescription.length > 0) {
            result.error_message = StringFromNSString(error.localizedDescription);
        }

        result.sdk_error_code = static_cast<std::int32_t>(error.code);
    }

    return result;
}

- (void)sendBannerEvent:(gm_enums::LevelPlayCallbackEvent)type
                  adInfo:(LPMAdInfo *)adInfo
                   error:(NSError *)error
{
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self sendBannerEvent:type
                            adInfo:adInfo
                             error:error];
        });
        return;
    }

    if (!mBannerCallback) {
        return;
    }

    gm_structs::LevelPlayResult result = [self resultStream:type error:error];
    std::optional<gm_structs::LevelPlayAdInfo> adInfoOpt =
        adInfo != nil ? std::optional<gm_structs::LevelPlayAdInfo>([self adInfoStream:adInfo]) : std::nullopt;

    mBannerCallback.call(result, type, adInfoOpt);
}

- (void)sendInterstitialEvent:(gm_enums::LevelPlayCallbackEvent)type
                        adInfo:(LPMAdInfo *)adInfo
                         error:(NSError *)error
{
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self sendInterstitialEvent:type
                                  adInfo:adInfo
                                   error:error];
        });
        return;
    }

    if (!mInterstitialCallback) {
        return;
    }

    gm_structs::LevelPlayResult result = [self resultStream:type error:error];
    std::optional<gm_structs::LevelPlayAdInfo> adInfoOpt =
        adInfo != nil ? std::optional<gm_structs::LevelPlayAdInfo>([self adInfoStream:adInfo]) : std::nullopt;

    mInterstitialCallback.call(result, type, adInfoOpt);
}

- (void)sendRewardedEvent:(gm_enums::LevelPlayCallbackEvent)type
                    adInfo:(LPMAdInfo *)adInfo
                     error:(NSError *)error
                    reward:(LPMReward *)reward
{
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self sendRewardedEvent:type
                              adInfo:adInfo
                               error:error
                              reward:reward];
        });
        return;
    }

    if (!mRewardedCallback) {
        return;
    }

    gm_structs::LevelPlayResult result = [self resultStream:type error:error];
    std::optional<gm_structs::LevelPlayAdInfo> adInfoOpt =
        adInfo != nil ? std::optional<gm_structs::LevelPlayAdInfo>([self adInfoStream:adInfo]) : std::nullopt;
    std::optional<gm_structs::LevelPlayReward> rewardOpt =
        reward != nil ? std::optional<gm_structs::LevelPlayReward>([self rewardStream:reward]) : std::nullopt;

    mRewardedCallback.call(result, type, adInfoOpt, rewardOpt);
}

- (void)sendBannerFailure:(NSString *)message
{
    if (!mBannerCallback) {
        return;
    }

    gm_structs::LevelPlayResult result = [self resultStream:false message:message];

    mBannerCallback.call(result, gm_enums::LevelPlayCallbackEvent::LoadFailed,
                          std::optional<gm_structs::LevelPlayAdInfo>(std::nullopt));
}

@end
