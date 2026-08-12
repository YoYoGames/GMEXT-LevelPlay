/**
 * @function levelplay_rewarded_video_create
 * @desc Constructs a rewarded video ad instance for the given ad unit and returns a handle to it,
 * attaching `callback` as its listener for the handle's whole lifetime. The handle is reusable
 * across many load/show cycles - call ${function.levelplay_rewarded_video_destroy} when you're truly
 * done with it.
 * @param {String} ad_unit_id The rewarded video ad unit ID, from the LevelPlay dashboard.
 * @param {Function} callback The function to call for every lifecycle event on this handle.
 * @event callback
 * @desc Fires once per lifecycle event: Loaded, LoadFailed, Displayed, DisplayFailed, Closed, Clicked,
 * InfoChanged, or Rewarded.
 * @member {Struct.LevelPlayResult} result The event's result. `success` is `false` only for
 * LoadFailed/DisplayFailed.
 * @member {Enum.LevelPlayCallbackEvent} type Which lifecycle event this is.
 * @member {Struct.LevelPlayAdInfo} [ad_info] Information about the ad. Absent only if the SDK provided
 * no ad-info object at all for this event.
 * @member {Struct.LevelPlayReward} [reward] The earned reward. Present only when `type` is
 * ${constant.LevelPlayCallbackEvent}.Rewarded.
 * @event_end
 * @returns {Real} A handle for use with the other `levelplay_rewarded_video_*` functions.
 * @example
 * ```gml
 * on_rewarded_event = function(_result, _type, _ad_info, _reward)
 * {
 *     switch (_type)
 *     {
 *         case LevelPlayCallbackEvent.Loaded:
 *             levelplay_rewarded_video_show(handle);
 *             break;
 *         case LevelPlayCallbackEvent.Closed:
 *             levelplay_rewarded_video_load(handle); // reload for next time
 *             break;
 *         case LevelPlayCallbackEvent.Rewarded:
 *             show_debug_message($"Granting {_reward.amount} x {_reward.name}");
 *             break;
 *     }
 * };
 *
 * handle = levelplay_rewarded_video_create("your_ad_unit_id", on_rewarded_event);
 * levelplay_rewarded_video_load(handle);
 * ```
 * @function_end
 */

/**
 * @function levelplay_rewarded_video_load
 * @desc Requests a (re)load of the rewarded video ad for this handle, using the callback given to
 * ${function.levelplay_rewarded_video_create} (or the last one set via
 * ${function.levelplay_rewarded_video_set_callback}).
 * @param {Real} handle A handle from ${function.levelplay_rewarded_video_create}.
 * @returns {Enum.LevelPlayError} ${constant.LevelPlayError}.Ok if the request was accepted,
 * ${constant.LevelPlayError}.NotInitialized if ${function.levelplay_init} hasn't completed, or
 * ${constant.LevelPlayError}.InvalidHandle if `handle` isn't a live handle from
 * ${function.levelplay_rewarded_video_create} (or has already been destroyed).
 * @function_end
 */

/**
 * @function levelplay_rewarded_video_set_callback
 * @desc Replaces this handle's active callback - the one originally given to
 * ${function.levelplay_rewarded_video_create} - without reloading the ad. Only needed if you want a
 * different callback than the one the handle already has; most usage never needs this.
 * @param {Real} handle A handle from ${function.levelplay_rewarded_video_create}.
 * @param {Function} callback The function to use from now on for this handle's lifecycle events.
 * @returns {Enum.LevelPlayError} ${constant.LevelPlayError}.Ok if the callback was replaced, or
 * ${constant.LevelPlayError}.InvalidHandle if `handle` isn't a live handle.
 * @function_end
 */

/**
 * @function levelplay_rewarded_video_is_ready
 * @desc Returns whether the rewarded video ad for this handle has finished loading and is ready to
 * show. Returns `false` for an invalid handle.
 * @param {Real} handle A handle from ${function.levelplay_rewarded_video_create}.
 * @returns {Bool}
 * @function_end
 */

/**
 * @function levelplay_rewarded_video_is_placement_capped
 * @desc Returns whether the given placement has reached its daily cap. Returns `false` for an empty
 * or invalid placement.
 * @param {String} placement_id The placement to check.
 * @returns {Bool}
 * @function_end
 */

/**
 * @function levelplay_rewarded_video_show
 * @desc Shows the rewarded video ad for this handle. The handle stays valid after showing - call
 * ${function.levelplay_rewarded_video_load} again to reload it for another show.
 * @param {Real} handle A handle from ${function.levelplay_rewarded_video_create}.
 * @param {String} [placement_id] The placement to show the ad for. Omit for no specific placement.
 * @returns {Enum.LevelPlayError} ${constant.LevelPlayError}.Ok if the show request was accepted, or
 * one of ${constant.LevelPlayError}.ActivityUnavailable/InvalidHandle/AdNotReady/PlacementCapped
 * otherwise.
 * @function_end
 */

/**
 * @function levelplay_rewarded_video_destroy
 * @desc Releases this handle's rewarded video ad instance. No-op if the handle is already invalid.
 * @param {Real} handle A handle from ${function.levelplay_rewarded_video_create}.
 * @function_end
 */

/**
 * @function levelplay_rewarded_video_get_live_handles
 * @desc Returns every currently-live rewarded video handle (created via
 * ${function.levelplay_rewarded_video_create} but not yet destroyed). Intended for leak detection
 * during development - e.g. logging `array_length(...)` periodically to catch handles that are
 * never destroyed.
 * @returns {Array[Real]}
 * @function_end
 */

/**
 * @module rewarded_video
 * @title Rewarded Video
 * @desc Functions for loading and showing rewarded video ads - opt-in ads that grant the player a
 * reward for watching to completion. Handle-based: create as many concurrent rewarded ads as you
 * want, each with its own handle.
 *
 * @section_func
 * @ref levelplay_rewarded_video_create
 * @ref levelplay_rewarded_video_load
 * @ref levelplay_rewarded_video_set_callback
 * @ref levelplay_rewarded_video_is_ready
 * @ref levelplay_rewarded_video_is_placement_capped
 * @ref levelplay_rewarded_video_show
 * @ref levelplay_rewarded_video_destroy
 * @ref levelplay_rewarded_video_get_live_handles
 * @section_end
 *
 * @module_end
 */
