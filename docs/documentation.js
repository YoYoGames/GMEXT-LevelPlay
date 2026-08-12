/**
 * @module home
 * @title LevelPlay
 *
 * @section Extension's Features
 * @desc
 *
 * * Initialize the Unity LevelPlay (ironSource) mediation SDK
 * * Show interstitial, rewarded video, and banner ads
 * * Route ad requests through any of 12 supported mediation networks via separate, optional
 *   sub-extensions
 * * Set consent, metadata, and Dynamic UserID for regulation/reward-verification purposes
 *
 * @section_end
 *
 * @section Introduction
 *
 * @desc
 *
 * This extension wraps Unity's [LevelPlay](https://developers.is.com/ironsource-mobile/) (formerly
 * ironSource) ad mediation SDK for **Android and iOS**. Call ${function.levelplay_init} once, before
 * any other function. Every function that talks to the SDK asynchronously reports its outcome through
 * a callback carrying a ${struct.LevelPlayResult} - check `result.success` before trusting the rest of
 * the payload.
 *
 * Interstitial and rewarded video ads are handle-based: `_create` constructs a reusable ad instance,
 * returns a handle, and attaches the callback that will receive every lifecycle event for that
 * handle's whole lifetime; `_load`/`_show`/`_destroy` then all operate on the handle, with `_load`
 * reusing the same callback on every reload (swap it explicitly with `_set_callback` if you ever need
 * to). Hold onto as many handles as you want at once - see
 * ${module.interstitial}/${module.rewarded_video}. Banner stays a single mutable instance (there is
 * only ever one banner view) with its own `_callback_subscribe` function - see ${module.banner}.
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
