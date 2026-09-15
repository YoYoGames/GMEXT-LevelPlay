@title Getting Started

# Getting Started

This guide walks you through the recommended order in which to call the functions of the LevelPlay
extension, from the initialisation through to showing your first ad. See ${page.extension_options}
for what each of the Extension Options does.

## Prerequisites

* A Unity LevelPlay (ironSource) account, with your app and your ad units already created.
* The `AndroidAppKey` or the `iOSAppKey` Extension Option of the extension filled in for the
  platforms that you target (${page.extension_options}).
* If you want to use mediation, import the `LevelPlay_<Network>` extension for each of the networks
  that you want, which are AppLovin, Facebook, Google, HyprMX, InMobi, Liftoff, Pangle, SuperAwesome,
  Tencent, UnityAds, VK and Yandex. Each of these ships disabled by default, with `Copies To`
  targets disabled. You should check the adapter documentation of each
  network for its minimum supported OS version before you enable it, as the baseline iOS deployment
  target of this extension is 12.0 but an individual network can require a higher one.

## 1. Initialise

```gml
levelplay_init(function(_result)
{
    if (!_result.success)
    {
        show_debug_message($"LevelPlay failed to initialize: {_result.error_message}");
        return;
    }

    // Safe to load ads from here on.
});
```

The code above initialises the SDK and only starts using it once the callback has reported success.
${function.levelplay_interstitial_load}, ${function.levelplay_rewarded_video_load} and
${function.levelplay_banner_create} fail with ${constant.LevelPlayError}.NotInitialized until that
callback has been called with `success` set to `true`. The remaining functions do not test the
initialisation state at all, so they report whatever is wrong at their own level instead, which for
`_show` means ${constant.LevelPlayError}.AdNotReady, given that nothing can have loaded yet.

## 2. Create, load and show ads

Interstitial and rewarded video ads are handle-based. The `_create` function builds a reusable ad
instance and attaches `callback` as its listener for the whole lifetime of the handle, and `_load`
then loads, or reloads, that instance using the same callback, which means that you only specify the
callback once and not on every reload:

```gml
on_interstitial_event = function(_result, _type, _ad_info)
{
    switch (_type)
    {
        case LevelPlayCallbackEvent.Loaded:
            levelplay_interstitial_show(handle);
            break;
        case LevelPlayCallbackEvent.LoadFailed:
            show_debug_message($"Interstitial failed to load: {_result.error_message}");
            break;
        case LevelPlayCallbackEvent.Closed:
            levelplay_interstitial_load(handle); // reload for next time, same callback
            break;
    }
};

handle = levelplay_interstitial_create("your_ad_unit_id", on_interstitial_event);
levelplay_interstitial_load(handle);
```

The code above creates a single interstitial handle and keeps it loaded, showing the ad as soon as
it is ready and reloading it once the player has closed it. You can hold as many handles as you
want, as each one of them is independent.

You should only call ${function.levelplay_interstitial_set_callback} or
${function.levelplay_rewarded_video_set_callback} if you actually want to swap the callback of a
handle for a different one, which most usage never needs. See ${module.interstitial} and
${module.rewarded_video} for the full shape of the callback, as the one for rewarded video carries
an extra `reward` argument.

Banner ads work differently. Only one banner instance ever exists, it is created directly with no
separate load step, and its own `_callback_subscribe` function is called repeatedly for the life of
the banner instead of once per load and show pair. See ${module.banner}.

## 3. Handling callbacks

You should always check `result.success` first:

```gml
function(_result, _type, _ad_info)
{
    if (!_result.success)
    {
        show_debug_message($"Failed: {_result.error_message}");
        return;
    }
    // handle _type
}
```

The code above rejects a failed event before it reads anything else from the payload. A synchronous
failure, which is what you get when you call `_show` before an ad is ready, for example, is reported
immediately through the ${constant.LevelPlayError} return value of each function instead. See
${module.general}.

## 4. Cleanup

You should destroy an active banner with ${function.levelplay_banner_destroy} once you are done with
it. You should call ${function.levelplay_interstitial_destroy} or
${function.levelplay_rewarded_video_destroy} once you are truly done with an interstitial or a
rewarded video handle, and both of them have no effect on a handle that is already invalid. A handle
that you intend to keep reusing does not need to be destroyed between shows, only reloaded.

## Testing notes

You should call ${function.levelplay_launch_test_suite} during development to open the integration
test suite of LevelPlay and verify the setup of your platform.

[[Note: LevelPlay and ironSource do not publish a universal test ad unit ID like some other networks
do, so you should register a real test ad unit on your own dashboard for development.]]
