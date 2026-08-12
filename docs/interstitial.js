/**
 * @function levelplay_interstitial_create
 * @desc Constructs an interstitial ad instance for the given ad unit and returns a handle to it,
 * attaching `callback` as its listener for the handle's whole lifetime. The handle is reusable
 * across many load/show cycles - call ${function.levelplay_interstitial_destroy} when you're truly
 * done with it.
 * @param {String} ad_unit_id The interstitial ad unit ID, from the LevelPlay dashboard.
 * @param {Function} callback The function to call for every lifecycle event on this handle.
 * @event callback
 * @desc Fires once per lifecycle event: Loaded, LoadFailed, Displayed, DisplayFailed, Closed, Clicked,
 * or InfoChanged.
 * @member {Struct.LevelPlayResult} result The event's result. `success` is `false` only for
 * LoadFailed/DisplayFailed.
 * @member {Enum.LevelPlayCallbackEvent} type Which lifecycle event this is.
 * @member {Struct.LevelPlayAdInfo} [ad_info] Information about the ad. Absent only if the SDK provided
 * no ad-info object at all for this event.
 * @event_end
 * @returns {Real} A handle for use with the other `levelplay_interstitial_*` functions.
 * @example
 * ```gml
 * on_interstitial_event = function(_result, _type, _ad_info)
 * {
 *     switch (_type)
 *     {
 *         case LevelPlayCallbackEvent.Loaded:
 *             levelplay_interstitial_show(handle);
 *             break;
 *         case LevelPlayCallbackEvent.LoadFailed:
 *             show_debug_message($"Interstitial failed to load: {_result.error_message}");
 *             break;
 *         case LevelPlayCallbackEvent.Closed:
 *             levelplay_interstitial_load(handle); // reload for next time
 *             break;
 *     }
 * };
 *
 * handle = levelplay_interstitial_create("your_ad_unit_id", on_interstitial_event);
 * levelplay_interstitial_load(handle);
 * ```
 * @function_end
 */

/**
 * @function levelplay_interstitial_load
 * @desc Requests a (re)load of the interstitial ad for this handle, using the callback given to
 * ${function.levelplay_interstitial_create} (or the last one set via
 * ${function.levelplay_interstitial_set_callback}).
 * @param {Real} handle A handle from ${function.levelplay_interstitial_create}.
 * @returns {Enum.LevelPlayError} ${constant.LevelPlayError}.Ok if the request was accepted,
 * ${constant.LevelPlayError}.NotInitialized if ${function.levelplay_init} hasn't completed, or
 * ${constant.LevelPlayError}.InvalidHandle if `handle` isn't a live handle from
 * ${function.levelplay_interstitial_create} (or has already been destroyed).
 * @function_end
 */

/**
 * @function levelplay_interstitial_set_callback
 * @desc Replaces this handle's active callback - the one originally given to
 * ${function.levelplay_interstitial_create} - without reloading the ad. Only needed if you want a
 * different callback than the one the handle already has; most usage never needs this.
 * @param {Real} handle A handle from ${function.levelplay_interstitial_create}.
 * @param {Function} callback The function to use from now on for this handle's lifecycle events.
 * @returns {Enum.LevelPlayError} ${constant.LevelPlayError}.Ok if the callback was replaced, or
 * ${constant.LevelPlayError}.InvalidHandle if `handle` isn't a live handle.
 * @function_end
 */

/**
 * @function levelplay_interstitial_is_ready
 * @desc Returns whether the interstitial ad for this handle has finished loading and is ready to
 * show. Returns `false` for an invalid handle.
 * @param {Real} handle A handle from ${function.levelplay_interstitial_create}.
 * @returns {Bool}
 * @function_end
 */

/**
 * @function levelplay_interstitial_is_placement_capped
 * @desc Returns whether the given placement has reached its daily cap. Returns `false` for an empty
 * or invalid placement.
 * @param {String} placement_id The placement to check.
 * @returns {Bool}
 * @function_end
 */

/**
 * @function levelplay_interstitial_show
 * @desc Shows the interstitial ad for this handle. The handle stays valid after showing - call
 * ${function.levelplay_interstitial_load} again to reload it for another show.
 * @param {Real} handle A handle from ${function.levelplay_interstitial_create}.
 * @param {String} [placement_id] The placement to show the ad for. Omit for no specific placement.
 * @returns {Enum.LevelPlayError} ${constant.LevelPlayError}.Ok if the show request was accepted, or
 * one of ${constant.LevelPlayError}.ActivityUnavailable/InvalidHandle/AdNotReady/PlacementCapped
 * otherwise.
 * @function_end
 */

/**
 * @function levelplay_interstitial_destroy
 * @desc Releases this handle's interstitial ad instance. No-op if the handle is already invalid.
 * @param {Real} handle A handle from ${function.levelplay_interstitial_create}.
 * @function_end
 */

/**
 * @function levelplay_interstitial_get_live_handles
 * @desc Returns every currently-live interstitial handle (created via
 * ${function.levelplay_interstitial_create} but not yet destroyed). Intended for leak detection
 * during development - e.g. logging `array_length(...)` periodically to catch handles that are
 * never destroyed.
 * @returns {Array[Real]}
 * @function_end
 */

/**
 * @module interstitial
 * @title Interstitial
 * @desc Functions for loading and showing interstitial ads - full-screen ads shown at natural
 * transition points in your game. Handle-based: create as many concurrent interstitial ads as you
 * want, each with its own handle.
 *
 * @section_func
 * @ref levelplay_interstitial_create
 * @ref levelplay_interstitial_load
 * @ref levelplay_interstitial_set_callback
 * @ref levelplay_interstitial_is_ready
 * @ref levelplay_interstitial_is_placement_capped
 * @ref levelplay_interstitial_show
 * @ref levelplay_interstitial_destroy
 * @ref levelplay_interstitial_get_live_handles
 * @section_end
 *
 * @module_end
 */
