/**
 * @module home
 * @title LevelPlay
 *
 * @section Extension's Features
 * @desc
 *
 * * Initialise the Unity LevelPlay (ironSource) mediation SDK
 * * Show interstitial, rewarded video and banner ads
 * * Route ad requests through any of the 12 supported mediation networks, using separate and
 *   optional sub-extensions
 * * Set the consent, the metadata and the Dynamic UserID that are used for regulation and for
 *   reward verification
 *
 * @section_end
 *
 * @section Introduction
 *
 * @desc
 *
 * This extension wraps the [LevelPlay](https://developers.is.com/ironsource-mobile/) ad mediation
 * SDK from Unity, which was formerly known as ironSource, for **Android and iOS**. You should call
 * ${function.levelplay_init} once, before any other function of this extension. Every function that
 * talks to the SDK asynchronously reports its outcome through a callback that carries a
 * ${struct.LevelPlayResult}, and you should always check `result.success` before you trust the rest
 * of the payload.
 *
 * Interstitial and rewarded video ads are handle-based. The `_create` function builds a reusable ad
 * instance, returns a handle to it and attaches the callback that receives every lifecycle event
 * for the whole lifetime of that handle. The `_load`, `_show` and `_destroy` functions then all
 * operate on that handle, and `_load` reuses the same callback on every reload, which you can swap
 * explicitly with `_set_callback` if you ever need to. You can hold as many handles as you want at
 * the same time. See ${module.interstitial} and ${module.rewarded_video}.
 *
 * A banner works differently, as it is a single mutable instance, given that only one banner view
 * ever exists, and it has a `_callback_subscribe` function of its own. See ${module.banner}.
 *
 * @section_end
 *
 * @section Guides
 * @desc Guides for the LevelPlay extension.
 * @reference page.getting_started
 * @reference page.extension_options
 * @section_end
 *
 * @section Modules
 * @desc The following are the available modules for the LevelPlay extension:
 *
 * @reference module.general
 * @reference module.interstitial
 * @reference module.rewarded_video
 * @reference module.banner
 *
 * @section_end
 *
 * @module_end
 */
