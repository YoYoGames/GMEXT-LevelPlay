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
 * Each ad type (interstitial, rewarded video, banner) is a single mutable instance, not a handle you
 * hold onto: call the type's `_init` function once with an ad unit ID, then `_load`/`_show` as needed.
 * Each type also has its own `_callback_subscribe` function - call it once to receive every lifecycle
 * event for that ad type, for as long as your game runs.
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
