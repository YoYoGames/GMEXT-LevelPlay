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
    return result != nil ? [result autorelease] : @"";
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

static std::string StringFromCString(const char *value)
{
    return value != nullptr ? std::string(value) : std::string();
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
- (void)moveBannerOnMainThreadWithAlignH:(gm_enums::LevelPlayBannerAlignH)align_h
                                  alignV:(gm_enums::LevelPlayBannerAlignV)align_v;

- (gm::wire::StructStream)adInfoStream:(LPMAdInfo *)adInfo;
- (gm::wire::StructStream)errorStream:(NSError *)error fallbackMessage:(NSString *)fallbackMessage;
- (gm::wire::StructStream)rewardStream:(LPMReward *)reward;
- (gm::wire::StructStream)eventStream:(const char *)type
                               message:(NSString *)message
                                adInfo:(LPMAdInfo *)adInfo
                                 error:(NSError *)error
                                reward:(LPMReward *)reward;

- (void)sendBannerEvent:(const char *)type
                message:(NSString *)message
                 adInfo:(LPMAdInfo *)adInfo
                  error:(NSError *)error;

- (void)sendInterstitialEvent:(const char *)type
                      message:(NSString *)message
                       adInfo:(LPMAdInfo *)adInfo
                        error:(NSError *)error;

- (void)sendRewardedEvent:(const char *)type
                  message:(NSString *)message
                   adInfo:(LPMAdInfo *)adInfo
                    error:(NSError *)error
                   reward:(LPMReward *)reward;

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
    [self.owner sendInterstitialEvent:"loaded" message:nil adInfo:adInfo error:nil];
}

- (void)didFailToLoadAdWithAdUnitId:(NSString *)adUnitId error:(NSError *)error
{
    [self.owner sendInterstitialEvent:"load_failed" message:error.localizedDescription adInfo:nil error:error];
}

- (void)didDisplayAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendInterstitialEvent:"displayed" message:nil adInfo:adInfo error:nil];
}

- (void)didFailToDisplayAdWithAdInfo:(LPMAdInfo *)adInfo error:(NSError *)error
{
    [self.owner sendInterstitialEvent:"display_failed" message:error.localizedDescription adInfo:adInfo error:error];

    //Audio_DeviceResume();
    //AudioResumeAll();
}

- (void)didCloseAdWithAdInfo:(LPMAdInfo *)adInfo
{
    //Audio_DeviceResume();
    //AudioResumeAll();

    [self.owner sendInterstitialEvent:"closed" message:nil adInfo:adInfo error:nil];
}

- (void)didClickAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendInterstitialEvent:"clicked" message:nil adInfo:adInfo error:nil];
}

- (void)didChangeAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendInterstitialEvent:"info_changed" message:nil adInfo:adInfo error:nil];
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
    [self.owner sendRewardedEvent:"loaded" message:nil adInfo:adInfo error:nil reward:nil];
}

- (void)didFailToLoadAdWithAdUnitId:(NSString *)adUnitId error:(NSError *)error
{
    [self.owner sendRewardedEvent:"load_failed" message:error.localizedDescription adInfo:nil error:error reward:nil];
}

- (void)didDisplayAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendRewardedEvent:"displayed" message:nil adInfo:adInfo error:nil reward:nil];
}

- (void)didFailToDisplayAdWithAdInfo:(LPMAdInfo *)adInfo error:(NSError *)error
{
    [self.owner sendRewardedEvent:"display_failed" message:error.localizedDescription adInfo:adInfo error:error reward:nil];

    //Audio_DeviceResume();
    //AudioResumeAll();
}

- (void)didCloseAdWithAdInfo:(LPMAdInfo *)adInfo
{
    //Audio_DeviceResume();
    //AudioResumeAll();

    [self.owner sendRewardedEvent:"closed" message:nil adInfo:adInfo error:nil reward:nil];
}

- (void)didClickAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendRewardedEvent:"clicked" message:nil adInfo:adInfo error:nil reward:nil];
}

- (void)didChangeAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendRewardedEvent:"info_changed" message:nil adInfo:adInfo error:nil reward:nil];
}

- (void)didRewardAdWithAdInfo:(LPMAdInfo *)adInfo reward:(LPMReward *)reward
{
    [self.owner sendRewardedEvent:"rewarded" message:nil adInfo:adInfo error:nil reward:reward];
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
    [self.owner sendBannerEvent:"loaded" message:nil adInfo:adInfo error:nil];
}

- (void)didFailToLoadAdWithAdUnitId:(NSString *)adUnitId error:(NSError *)error
{
    [self.owner sendBannerEvent:"load_failed" message:error.localizedDescription adInfo:nil error:error];
}

- (void)didDisplayAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendBannerEvent:"displayed" message:nil adInfo:adInfo error:nil];
}

- (void)didFailToDisplayAdWithAdInfo:(LPMAdInfo *)adInfo error:(NSError *)error
{
    [self.owner sendBannerEvent:"display_failed" message:error.localizedDescription adInfo:adInfo error:error];
}

- (void)didClickAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendBannerEvent:"clicked" message:nil adInfo:adInfo error:nil];
}

- (void)didExpandAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendBannerEvent:"expanded" message:nil adInfo:adInfo error:nil];
}

- (void)didCollapseAdWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendBannerEvent:"collapsed" message:nil adInfo:adInfo error:nil];
}

- (void)didLeaveAppWithAdInfo:(LPMAdInfo *)adInfo
{
    [self.owner sendBannerEvent:"left_application" message:nil adInfo:adInfo error:nil];
}

@end

@implementation GMLevelPlay

- (instancetype)init
{
    self = [super init];

    if (self) {
        self.levelPlayInitialized = NO;
        self.bannerConstraints = [NSArray array];

        self.interstitialDelegate = [[[GMLevelPlayInterstitialDelegate alloc] initWithOwner:self] autorelease];
        self.rewardedDelegate = [[[GMLevelPlayRewardedDelegate alloc] initWithOwner:self] autorelease];
        self.bannerDelegate = [[[GMLevelPlayBannerDelegate alloc] initWithOwner:self] autorelease];
    }

    return self;
}

- (void)dealloc
{
    [self destroyBannerOnMainThread];

    self.interstitialAd.delegate = nil;
    self.rewardedAd.delegate = nil;

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

    [super dealloc];
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

- (void)levelplay_init:(gm::wire::GMFunction)callback
{
    mInitCallback = callback;

    NSString *appKey = LevelPlayAppKey();

    if (appKey.length == 0) {
        gm::wire::StructStream event;
        event.add("type", std::string("init"));
        event.add("success", false);
        event.add("message", std::string("Missing extension option: GMLevelPlay / iOSAppKey."));

        mInitCallback.call(event);
        return;
    }

    LPMInitRequestBuilder *requestBuilder = [[LPMInitRequestBuilder alloc] initWithAppKey:appKey];
    LPMInitRequest *initRequest = [requestBuilder build];
    [requestBuilder release];

    // Project is compiling with manual reference counting, so do not use __weak / __strong here.
    GMLevelPlay *blockSelf = self;

    [LevelPlay initWithRequest:initRequest
                    completion:^(LPMConfiguration *_Nullable config, NSError *_Nullable error) {
        (void)config;

        NSError *safeError = [error retain];

        dispatch_async(dispatch_get_main_queue(), ^{
            gm::wire::StructStream event;
            event.add("type", std::string("init"));

            if (safeError != nil) {
                blockSelf.levelPlayInitialized = NO;
                event.add("success", false);
                event.add("message", StringFromNSError(safeError));
            } else {
                blockSelf.levelPlayInitialized = YES;
                event.add("success", true);
            }

            if (blockSelf->mInitCallback) {
                blockSelf->mInitCallback.call(event);
            }

            [safeError release];
        });
    }];
}

- (bool)levelplay_is_initialized
{
    return self.levelPlayInitialized;
}

- (void)levelplay_set_consent:(bool)enable
{
    if ([LevelPlay respondsToSelector:@selector(setConsent:)]) {
        [LevelPlay setConsent:enable];
    } else {
        [IronSource setConsent:enable];
    }
}

- (void)levelplay_set_metadata:(std::string_view)key value:(std::string_view)value
{
    [IronSource setMetaDataWithKey:NSStringFromStringView(key)
                             value:NSStringFromStringView(value)];
}

- (void)levelplay_set_dynamic_user_id:(std::string_view)user_id
{
    [IronSource setDynamicUserId:NSStringFromStringView(user_id)];
}

- (void)levelplay_launch_test_suite
{
    UIViewController *controller = [self rootViewController];

    if (controller != nil) {
        [IronSource launchTestSuite:controller];
    }
}

- (void)levelplay_interstitial_init:(std::string_view)ad_unit_id
{
    self.interstitialAd = [[[LPMInterstitialAd alloc] initWithAdUnitId:NSStringFromStringView(ad_unit_id)] autorelease];
    self.interstitialAd.delegate = self.interstitialDelegate;
}

- (bool)levelplay_interstitial_load
{
    if (!self.levelPlayInitialized) {
        [self sendInterstitialEvent:"load_failed"
                            message:@"LevelPlay SDK is not initialized."
                             adInfo:nil
                              error:nil];
        return false;
    }

    if (self.interstitialAd == nil) {
        [self sendInterstitialEvent:"load_failed"
                            message:@"Interstitial ad was not initialized."
                             adInfo:nil
                              error:nil];
        return false;
    }

    [self.interstitialAd loadAd];
    return true;
}

- (bool)levelplay_interstitial_is_ready
{
    return self.interstitialAd != nil && [self.interstitialAd isAdReady];
}

- (bool)levelplay_interstitial_is_placement_capped:(std::string_view)placement_id
{
    NSString *placement = NSStringFromStringView(placement_id);

    if (placement.length == 0) {
        return false;
    }

    return [LPMInterstitialAd isPlacementCapped:placement];
}

- (bool)levelplay_interstitial_show:(std::string_view)placement_id
{
    UIViewController *controller = [self rootViewController];

    if (controller == nil) {
        [self sendInterstitialEvent:"display_failed"
                            message:@"Current iOS view controller is unavailable."
                             adInfo:nil
                              error:nil];
        return false;
    }

    if (self.interstitialAd == nil) {
        [self sendInterstitialEvent:"display_failed"
                            message:@"Interstitial ad was not initialized."
                             adInfo:nil
                              error:nil];
        return false;
    }

    if (![self.interstitialAd isAdReady]) {
        [self sendInterstitialEvent:"display_failed"
                            message:@"Interstitial ad is not ready."
                             adInfo:nil
                              error:nil];
        return false;
    }

    NSString *placement = NSStringFromStringView(placement_id);

    if (placement.length > 0 && [LPMInterstitialAd isPlacementCapped:placement]) {
        [self sendInterstitialEvent:"display_failed"
                            message:@"Interstitial placement is capped."
                             adInfo:nil
                              error:nil];
        return false;
    }

    //AudioPauseAll(false);
    //Audio_DevicePause();

    [self.interstitialAd showAdWithViewController:controller
                                    placementName:placement.length > 0 ? placement : nil];

    return true;
}

- (void)levelplay_interstitial_callback_subscribe:(gm::wire::GMFunction)callback
{
    mInterstitialCallback = callback;
}

- (void)levelplay_rewarded_video_init:(std::string_view)ad_unit_id
{
    self.rewardedAd = [[[LPMRewardedAd alloc] initWithAdUnitId:NSStringFromStringView(ad_unit_id)] autorelease];
    self.rewardedAd.delegate = self.rewardedDelegate;
}

- (bool)levelplay_rewarded_video_load
{
    if (!self.levelPlayInitialized) {
        [self sendRewardedEvent:"load_failed"
                        message:@"LevelPlay SDK is not initialized."
                         adInfo:nil
                          error:nil
                         reward:nil];
        return false;
    }

    if (self.rewardedAd == nil) {
        [self sendRewardedEvent:"load_failed"
                        message:@"Rewarded ad was not initialized."
                         adInfo:nil
                          error:nil
                         reward:nil];
        return false;
    }

    [self.rewardedAd loadAd];
    return true;
}

- (bool)levelplay_rewarded_video_is_ready
{
    return self.rewardedAd != nil && [self.rewardedAd isAdReady];
}

- (bool)levelplay_rewarded_video_is_placement_capped:(std::string_view)placement_id
{
    NSString *placement = NSStringFromStringView(placement_id);

    if (placement.length == 0) {
        return false;
    }

    return [LPMRewardedAd isPlacementCapped:placement];
}

- (bool)levelplay_rewarded_video_show:(std::string_view)placement_id
{
    UIViewController *controller = [self rootViewController];

    if (controller == nil) {
        [self sendRewardedEvent:"display_failed"
                        message:@"Current iOS view controller is unavailable."
                         adInfo:nil
                          error:nil
                         reward:nil];
        return false;
    }

    if (self.rewardedAd == nil) {
        [self sendRewardedEvent:"display_failed"
                        message:@"Rewarded ad was not initialized."
                         adInfo:nil
                          error:nil
                         reward:nil];
        return false;
    }

    if (![self.rewardedAd isAdReady]) {
        [self sendRewardedEvent:"display_failed"
                        message:@"Rewarded ad is not ready."
                         adInfo:nil
                          error:nil
                         reward:nil];
        return false;
    }

    NSString *placement = NSStringFromStringView(placement_id);

    if (placement.length > 0 && [LPMRewardedAd isPlacementCapped:placement]) {
        [self sendRewardedEvent:"display_failed"
                        message:@"Rewarded placement is capped."
                         adInfo:nil
                          error:nil
                         reward:nil];
        return false;
    }

    //AudioPauseAll(false);
    //Audio_DevicePause();

    [self.rewardedAd showAdWithViewController:controller
                                placementName:placement.length > 0 ? placement : nil];

    return true;
}

- (void)levelplay_rewarded_callback_subscribe:(gm::wire::GMFunction)callback
{
    mRewardedCallback = callback;
}

- (void)levelplay_banner_create:(std::string_view)ad_unit_id
                           size:(gm_enums::LevelPlayBannerSize)size
                        align_h:(gm_enums::LevelPlayBannerAlignH)align_h
                        align_v:(gm_enums::LevelPlayBannerAlignV)align_v
{
/*    NSString *adUnitId = NSStringFromStringView(ad_unit_id);

    dispatch_async(dispatch_get_main_queue(), ^{
        [self destroyBannerOnMainThread];

        UIView *rootView = [self rootView];
        UIViewController *controller = [self rootViewController];

        if (rootView == nil || controller == nil) {
            [self sendBannerEvent:"load_failed"
                          message:@"Current iOS root view is unavailable."
                           adInfo:nil
                            error:nil];
            return;
        }

        self.bannerSize = [self adSizeFromEnum:size];

        self.bannerAdView = [[[LPMBannerAdView alloc] initWithAdUnitId:adUnitId] autorelease];
        //[self.bannerAdView setAdSize:self.bannerSize];
        [self.bannerAdView setDelegate:self.bannerDelegate];

        self.bannerAdView.translatesAutoresizingMaskIntoConstraints = NO;

        [rootView addSubview:self.bannerAdView];

        [self moveBannerOnMainThreadWithAlignH:align_h alignV:align_v];

        [self.bannerAdView loadAdWithViewController:controller];
    });*/
}

- (void)levelplay_banner_move:(gm_enums::LevelPlayBannerAlignH)align_h
                      align_v:(gm_enums::LevelPlayBannerAlignV)align_v
{
    /*
    dispatch_async(dispatch_get_main_queue(), ^{
        [self moveBannerOnMainThreadWithAlignH:align_h alignV:align_v];
    });*/
}

- (void)levelplay_banner_destroy
{/*
    dispatch_async(dispatch_get_main_queue(), ^{
        [self destroyBannerOnMainThread];
    });*/
}

- (void)levelplay_banner_callback_subscribe:(gm::wire::GMFunction)callback
{
//    mBannerCallback = callback;
}

- (void)destroyBannerOnMainThread
{
    if (self.bannerConstraints != nil && self.bannerConstraints.count > 0) {
        [NSLayoutConstraint deactivateConstraints:self.bannerConstraints];
        self.bannerConstraints = [NSArray array];
    }

    if (self.bannerAdView != nil) {
        [self.bannerAdView setDelegate:nil];
        [self.bannerAdView destroy];
        [self.bannerAdView removeFromSuperview];
        self.bannerAdView = nil;
    }

    self.bannerSize = nil;
}

- (void)moveBannerOnMainThreadWithAlignH:(gm_enums::LevelPlayBannerAlignH)align_h
                                  alignV:(gm_enums::LevelPlayBannerAlignV)align_v
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
        case gm_enums::LevelPlayBannerAlignH::Left:
            xConstraint = [self.bannerAdView.leftAnchor constraintEqualToAnchor:safeArea.leftAnchor];
            break;

        case gm_enums::LevelPlayBannerAlignH::Right:
            xConstraint = [self.bannerAdView.rightAnchor constraintEqualToAnchor:safeArea.rightAnchor];
            break;

        case gm_enums::LevelPlayBannerAlignH::Center:
        default:
            xConstraint = [self.bannerAdView.centerXAnchor constraintEqualToAnchor:safeArea.centerXAnchor];
            break;
    }

    NSLayoutConstraint *yConstraint = nil;

    switch (align_v) {
        case gm_enums::LevelPlayBannerAlignV::Top:
            yConstraint = [self.bannerAdView.topAnchor constraintEqualToAnchor:safeArea.topAnchor];
            break;

        case gm_enums::LevelPlayBannerAlignV::Center:
            yConstraint = [self.bannerAdView.centerYAnchor constraintEqualToAnchor:safeArea.centerYAnchor];
            break;

        case gm_enums::LevelPlayBannerAlignV::Bottom:
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

- (gm::wire::StructStream)adInfoStream:(LPMAdInfo *)adInfo
{
    gm::wire::StructStream stream;

    if (adInfo == nil) {
        return stream;
    }

    if (adInfo.adSize != nil) {
        stream.add("width", static_cast<std::int32_t>(adInfo.adSize.width));
        stream.add("height", static_cast<std::int32_t>(adInfo.adSize.height));
    } else {
        stream.add("width", static_cast<std::int32_t>(0));
        stream.add("height", static_cast<std::int32_t>(0));
    }

    stream.add("format", StringFromNSString(adInfo.adFormat));
    stream.add("network", StringFromNSString(adInfo.adNetwork));
    stream.add("unit_id", StringFromNSString(adInfo.adUnitId));
    stream.add("unit_name", StringFromNSString(adInfo.adUnitName));
    stream.add("placement_name", StringFromNSString(adInfo.placementName));
    stream.add("country", StringFromNSString(adInfo.country));

    if (adInfo.precision != nil) {
        stream.add("precision", StringFromNSString([adInfo.precision description]));
    } else {
        stream.add("precision", std::string(""));
    }

    if (adInfo.revenue != nil) {
        stream.add("revenue", [adInfo.revenue doubleValue]);
    } else {
        stream.add("revenue", 0.0);
    }

    return stream;
}

- (gm::wire::StructStream)errorStream:(NSError *)error fallbackMessage:(NSString *)fallbackMessage
{
    gm::wire::StructStream stream;

    NSString *message = nil;

    if (error != nil && error.localizedDescription != nil && error.localizedDescription.length > 0) {
        message = error.localizedDescription;
    } else if (fallbackMessage != nil) {
        message = fallbackMessage;
    } else {
        message = @"";
    }

    stream.add("message", StringFromNSString(message));
    stream.add("error_code", static_cast<std::int32_t>(error != nil ? error.code : 0));
    stream.add("error_message", StringFromNSString(message));

    return stream;
}

- (gm::wire::StructStream)rewardStream:(LPMReward *)reward
{
    gm::wire::StructStream stream;

    if (reward == nil) {
        return stream;
    }

    stream.add("name", StringFromNSString(reward.name));
    stream.add("amount", static_cast<std::int32_t>(reward.amount));

    return stream;
}

- (gm::wire::StructStream)eventStream:(const char *)type
                               message:(NSString *)message
                                adInfo:(LPMAdInfo *)adInfo
                                 error:(NSError *)error
                                reward:(LPMReward *)reward
{
    gm::wire::StructStream stream;

    stream.add("type", StringFromCString(type));

    if (message != nil && message.length > 0) {
        stream.add("message", StringFromNSString(message));
    }

    if (adInfo != nil) {
        stream.add("ad_info", [self adInfoStream:adInfo]);
    }

    if (error != nil) {
        stream.add("error", [self errorStream:error fallbackMessage:message]);
    }

    if (reward != nil) {
        stream.add("reward", [self rewardStream:reward]);
    }

    return stream;
}

- (void)sendBannerEvent:(const char *)type
                message:(NSString *)message
                 adInfo:(LPMAdInfo *)adInfo
                  error:(NSError *)error
{
    if (![NSThread isMainThread]) {
        std::string typeCopy = StringFromCString(type);
        NSString *messageCopy = [message copy];
        LPMAdInfo *adInfoCopy = [adInfo retain];
        NSError *errorCopy = [error retain];

        dispatch_async(dispatch_get_main_queue(), ^{
            [self sendBannerEvent:typeCopy.c_str()
                           message:messageCopy
                            adInfo:adInfoCopy
                             error:errorCopy];

            [messageCopy release];
            [adInfoCopy release];
            [errorCopy release];
        });
        return;
    }

    if (!mBannerCallback) {
        return;
    }

    gm::wire::StructStream event = [self eventStream:type
                                             message:message
                                              adInfo:adInfo
                                               error:error
                                              reward:nil];

    mBannerCallback.call(event);
}

- (void)sendInterstitialEvent:(const char *)type
                      message:(NSString *)message
                       adInfo:(LPMAdInfo *)adInfo
                        error:(NSError *)error
{
    if (![NSThread isMainThread]) {
        std::string typeCopy = StringFromCString(type);
        NSString *messageCopy = [message copy];
        LPMAdInfo *adInfoCopy = [adInfo retain];
        NSError *errorCopy = [error retain];

        dispatch_async(dispatch_get_main_queue(), ^{
            [self sendInterstitialEvent:typeCopy.c_str()
                                message:messageCopy
                                 adInfo:adInfoCopy
                                  error:errorCopy];

            [messageCopy release];
            [adInfoCopy release];
            [errorCopy release];
        });
        return;
    }

    if (!mInterstitialCallback) {
        return;
    }

    gm::wire::StructStream event = [self eventStream:type
                                             message:message
                                              adInfo:adInfo
                                               error:error
                                              reward:nil];

    mInterstitialCallback.call(event);
}

- (void)sendRewardedEvent:(const char *)type
                  message:(NSString *)message
                   adInfo:(LPMAdInfo *)adInfo
                    error:(NSError *)error
                   reward:(LPMReward *)reward
{
    if (![NSThread isMainThread]) {
        std::string typeCopy = StringFromCString(type);
        NSString *messageCopy = [message copy];
        LPMAdInfo *adInfoCopy = [adInfo retain];
        NSError *errorCopy = [error retain];
        LPMReward *rewardCopy = [reward retain];

        dispatch_async(dispatch_get_main_queue(), ^{
            [self sendRewardedEvent:typeCopy.c_str()
                             message:messageCopy
                              adInfo:adInfoCopy
                               error:errorCopy
                              reward:rewardCopy];

            [messageCopy release];
            [adInfoCopy release];
            [errorCopy release];
            [rewardCopy release];
        });
        return;
    }

    if (!mRewardedCallback) {
        return;
    }

    gm::wire::StructStream event = [self eventStream:type
                                             message:message
                                              adInfo:adInfo
                                               error:error
                                              reward:reward];

    mRewardedCallback.call(event);
}

@end
