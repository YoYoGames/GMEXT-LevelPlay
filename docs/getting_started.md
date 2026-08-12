@title Getting Started

# Getting Started

This guide walks through the recommended call order for the LevelPlay extension, from initialization
through showing your first ad. See ${page.extension_options} for what each Extension Option does.

## Prerequisites

* A Unity LevelPlay (ironSource) account with your app and ad units already created.
* The extension's `AndroidAppKey`/`iOSAppKey` Extension Options filled in for the platform(s) you
  target (${page.extension_options}).
* If you want to use mediation, import the `LevelPlay_<Network>` extension(s) for the networks you
  want (AppLovin, Facebook, Google, HyprMX, InMobi, Liftoff, Pangle, SuperAwesome, Tencent, UnityAds,
  VK, Yandex) - each ships disabled by default (`copyToTargets` off) and is enabled per-project. Check
  each network's own adapter documentation for its minimum supported OS version before enabling it;
  this extension's own baseline iOS deployment target is 12.0, but individual networks can require
  higher.

## 1. Initialize

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

Every other ad function fails with ${constant.LevelPlayError}.NotInitialized until this callback has
fired with `success == true`.

## 2. Subscribe to callbacks

Subscribe once per ad type, before loading - the subscription lasts for as long as your game runs (or
until you call the `_callback_subscribe` function again with a different function):

```gml
levelplay_interstitial_callback_subscribe(function(_result, _type, _ad_info)
{
    switch (_type)
    {
        case LevelPlayCallbackEvent.Loaded:
            levelplay_interstitial_show("");
            break;
        case LevelPlayCallbackEvent.LoadFailed:
            show_debug_message($"Interstitial failed to load: {_result.error_message}");
            break;
    }
});
```

See ${module.interstitial}, ${module.rewarded_video}, and ${module.banner} for each ad type's full
callback shape - rewarded video's callback carries an extra `reward` argument, and banner's fires
repeatedly for the life of the banner instead of once per load/show pair.

## 3. Load and show ads

Interstitial and rewarded video follow the same init/load/show pattern:

```gml
levelplay_interstitial_init("your_ad_unit_id");
levelplay_interstitial_load();

// ...later, once the Loaded callback has fired...

if (levelplay_interstitial_is_ready())
    levelplay_interstitial_show("");
```

Banner ads are created directly, with no separate load step - see ${function.levelplay_banner_create}.

## 4. Handling callbacks

Always check `result.success` first:

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

Synchronous failures (e.g. calling `_show` before an ad is ready) are reported immediately through
each function's ${constant.LevelPlayError} return value instead - see ${module.general}.

## 5. Cleanup

Destroy an active banner with ${function.levelplay_banner_destroy} when you're done with it.
Interstitial and rewarded video have no separate dispose call - calling `_init` again with a new ad
unit ID replaces the previous instance.

## Testing notes

Call ${function.levelplay_launch_test_suite} during development to open LevelPlay's integration test
suite and verify your platform setup. [[Note: LevelPlay/ironSource does not publish a universal test
ad unit ID like some other networks - register a real test ad unit on your own dashboard for
development.]]
