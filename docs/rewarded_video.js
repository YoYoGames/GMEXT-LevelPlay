/**
 * @function levelplay_rewarded_video_init
 * @desc Creates the rewarded video ad instance for the given ad unit, replacing any existing one. Must
 * be called before ${function.levelplay_rewarded_video_load}.
 * @param {String} ad_unit_id The rewarded video ad unit ID, from the LevelPlay dashboard.
 * @function_end
 */

/**
 * @function levelplay_rewarded_video_load
 * @desc Requests a load of the previously initialized rewarded video ad. The outcome arrives
 * asynchronously through ${function.levelplay_rewarded_callback_subscribe}'s callback as a
 * ${constant.LevelPlayCallbackEvent}.Loaded/LoadFailed event.
 * @returns {Enum.LevelPlayError} ${constant.LevelPlayError}.Ok if the request was accepted,
 * ${constant.LevelPlayError}.NotInitialized if ${function.levelplay_init} hasn't completed, or
 * ${constant.LevelPlayError}.AdNotInitialized if ${function.levelplay_rewarded_video_init} hasn't been
 * called yet.
 * @function_end
 */

/**
 * @function levelplay_rewarded_video_is_ready
 * @desc Returns whether the rewarded video ad has finished loading and is ready to show.
 * @returns {Bool}
 * @function_end
 */

/**
 * @function levelplay_rewarded_video_is_placement_capped
 * @desc Returns whether the given placement has reached its daily cap. Returns `false` for an empty
 * or invalid placement, or if no rewarded video ad has been initialized.
 * @param {String} placement_id The placement to check.
 * @returns {Bool}
 * @function_end
 */

/**
 * @function levelplay_rewarded_video_show
 * @desc Shows the rewarded video ad for the given placement.
 * @param {String} placement_id The placement to show the ad for, or `""` for no placement.
 * @returns {Enum.LevelPlayError} ${constant.LevelPlayError}.Ok if the show request was accepted,
 * or one of ${constant.LevelPlayError}.ActivityUnavailable/AdNotInitialized/AdNotReady/PlacementCapped
 * otherwise.
 * @function_end
 */

/**
 * @function levelplay_rewarded_callback_subscribe
 * @desc Subscribes to lifecycle callbacks for rewarded video ads. There is only one subscription at a
 * time - calling this again replaces the previous callback.
 * @param {Function} callback The function to call for every rewarded video lifecycle event.
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
 * @example
 * ```gml
 * levelplay_rewarded_callback_subscribe(function(_result, _type, _ad_info, _reward)
 * {
 *     switch (_type)
 *     {
 *         case LevelPlayCallbackEvent.Loaded:
 *             levelplay_rewarded_video_show("");
 *             break;
 *         case LevelPlayCallbackEvent.Rewarded:
 *             show_debug_message($"Granting {_reward.amount} x {_reward.name}");
 *             break;
 *     }
 * });
 *
 * levelplay_rewarded_video_init("your_ad_unit_id");
 * levelplay_rewarded_video_load();
 * ```
 * @function_end
 */

/**
 * @module rewarded_video
 * @title Rewarded Video
 * @desc Functions for loading and showing rewarded video ads - opt-in ads that grant the player a
 * reward for watching to completion.
 *
 * @section_func
 * @ref levelplay_rewarded_video_init
 * @ref levelplay_rewarded_video_load
 * @ref levelplay_rewarded_video_is_ready
 * @ref levelplay_rewarded_video_is_placement_capped
 * @ref levelplay_rewarded_video_show
 * @ref levelplay_rewarded_callback_subscribe
 * @section_end
 *
 * @module_end
 */
