/**
 * @function levelplay_interstitial_create
 * @desc This function constructs an interstitial ad instance for the given ad unit and returns a
 * handle to it, attaching `callback` as its listener for the whole lifetime of that handle. The
 * handle can be reused across many load and show cycles, so you should only call
 * ${function.levelplay_interstitial_destroy} once you are truly done with it.
 * @param {String} ad_unit_id The interstitial ad unit ID, from the LevelPlay dashboard.
 * @param {Function} callback The function to call for every lifecycle event on this handle.
 * @event callback
 * @desc Called once per lifecycle event, which is one of Loaded, LoadFailed, Displayed,
 * DisplayFailed, Closed, Clicked or InfoChanged.
 * @member {Struct.LevelPlayResult} result The result of the event. `success` is only `false` for
 * LoadFailed and DisplayFailed.
 * @member {Enum.LevelPlayCallbackEvent} type Which lifecycle event this is.
 * @member {Struct.LevelPlayAdInfo} [ad_info] Information about the ad. This is only absent if the
 * SDK provided no ad info object at all for this event.
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
 * The code above creates an interstitial ad instance with a callback that shows the ad as soon as it
 * has loaded and that reloads it once the player has closed it, and then requests the first load.
 * @function_end
 */

/**
 * @function levelplay_interstitial_load
 * @desc This function requests a load, or a reload, of the interstitial ad for this handle, using
 * the callback that was given to ${function.levelplay_interstitial_create}, or the last one that was
 * set with ${function.levelplay_interstitial_set_callback}.
 * @param {Real} handle A handle from ${function.levelplay_interstitial_create}.
 * @returns {Enum.LevelPlayError} ${constant.LevelPlayError}.Ok if the request was accepted,
 * ${constant.LevelPlayError}.NotInitialized if ${function.levelplay_init} has not completed, or
 * ${constant.LevelPlayError}.InvalidHandle if `handle` is not a live handle from
 * ${function.levelplay_interstitial_create}, or has already been destroyed.
 * @function_end
 */

/**
 * @function levelplay_interstitial_set_callback
 * @desc This function replaces the active callback of this handle, which is the one that was
 * originally given to ${function.levelplay_interstitial_create}, without reloading the ad. You only
 * need it if you want a different callback than the one that the handle already has, which most
 * usage never does.
 * @param {Real} handle A handle from ${function.levelplay_interstitial_create}.
 * @param {Function} callback The function to use from now on for the lifecycle events of this
 * handle.
 * @returns {Enum.LevelPlayError} ${constant.LevelPlayError}.Ok if the callback was replaced, or
 * ${constant.LevelPlayError}.InvalidHandle if `handle` is not a live handle.
 * @function_end
 */

/**
 * @function levelplay_interstitial_is_ready
 * @desc This function returns whether the interstitial ad for this handle has finished loading and
 * is ready to be shown. It returns `false` for an invalid handle.
 * @param {Real} handle A handle from ${function.levelplay_interstitial_create}.
 * @returns {Bool}
 * @function_end
 */

/**
 * @function levelplay_interstitial_is_placement_capped
 * @desc This function returns whether the given placement has reached its daily cap. It returns
 * `false` for an empty or an invalid placement.
 * @param {String} placement_id The placement to check.
 * @returns {Bool}
 * @function_end
 */

/**
 * @function levelplay_interstitial_show
 * @desc This function shows the interstitial ad for this handle. The handle stays valid after the ad
 * has been shown, so you should call ${function.levelplay_interstitial_load} again to reload it for
 * another show.
 * @param {Real} handle A handle from ${function.levelplay_interstitial_create}.
 * @param {String} [placement_id] The placement to show the ad for. You should omit this argument if
 * you do not want a specific placement.
 * @returns {Enum.LevelPlayError} ${constant.LevelPlayError}.Ok if the show request was accepted, or
 * one of ${constant.LevelPlayError}.ActivityUnavailable, ${constant.LevelPlayError}.InvalidHandle,
 * ${constant.LevelPlayError}.AdNotReady or ${constant.LevelPlayError}.PlacementCapped otherwise.
 * @function_end
 */

/**
 * @function levelplay_interstitial_destroy
 * @desc This function releases the interstitial ad instance of this handle. It has no effect if the
 * handle is already invalid.
 * @param {Real} handle A handle from ${function.levelplay_interstitial_create}.
 * @function_end
 */

/**
 * @function levelplay_interstitial_get_live_handles
 * @desc This function returns every interstitial handle that is currently live, which means every
 * handle that was created with ${function.levelplay_interstitial_create} and that has not been
 * destroyed yet. It is intended for detecting leaks during development, for example by logging
 * `array_length(...)` periodically to catch handles that are never destroyed.
 * @returns {Array[Real]}
 * @function_end
 */

/**
 * @module interstitial
 * @title Interstitial
 * @desc Functions for loading and showing interstitial ads, which are full-screen ads that are shown
 * at natural transition points in your game. They are handle-based, so you can create as many
 * concurrent interstitial ads as you want, each with a handle of its own.
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
