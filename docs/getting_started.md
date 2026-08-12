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

## 2. Create, load, and show ads

Interstitial and rewarded video are handle-based: `_create` builds a reusable ad instance and attaches
`callback` as its listener for the handle's whole lifetime, then `_load` (re)loads it using that same
callback - you only specify the callback once, not on every reload:

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

Hold onto as many handles as you want - each is independent. Only call
${function.levelplay_interstitial_set_callback}/${function.levelplay_rewarded_video_set_callback} if
you actually want to swap a handle's callback for a different one; most usage never needs it. See
${module.interstitial} and ${module.rewarded_video} for the full callback shape (rewarded video's
callback carries an extra `reward` argument).

Banner ads are different: there is only ever one instance, created directly with no separate load
step, and its own `_callback_subscribe` function fires repeatedly for the life of the banner instead
of once per load/show pair - see ${module.banner}.

## 3. Handling callbacks

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

## 4. Cleanup

Destroy an active banner with ${function.levelplay_banner_destroy} when you're done with it. Call
${function.levelplay_interstitial_destroy}/${function.levelplay_rewarded_video_destroy} when you're
truly done with an interstitial/rewarded handle - both are no-ops on an already-invalid handle. A
handle you intend to keep reusing doesn't need destroying between shows, just reloading.

## Testing notes

Call ${function.levelplay_launch_test_suite} during development to open LevelPlay's integration test
suite and verify your platform setup. [[Note: LevelPlay/ironSource does not publish a universal test
ad unit ID like some other networks - register a real test ad unit on your own dashboard for
development.]]
