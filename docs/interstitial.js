/**
 * @function levelplay_interstitial_init
 * @desc Creates the interstitial ad instance for the given ad unit, replacing any existing one. Must
 * be called before ${function.levelplay_interstitial_load}.
 * @param {String} ad_unit_id The interstitial ad unit ID, from the LevelPlay dashboard.
 * @function_end
 */

/**
 * @function levelplay_interstitial_load
 * @desc Requests a load of the previously initialized interstitial ad. The outcome arrives
 * asynchronously through ${function.levelplay_interstitial_callback_subscribe}'s callback as a
 * ${constant.LevelPlayCallbackEvent}.Loaded/LoadFailed event.
 * @returns {Enum.LevelPlayError} ${constant.LevelPlayError}.Ok if the request was accepted,
 * ${constant.LevelPlayError}.NotInitialized if ${function.levelplay_init} hasn't completed, or
 * ${constant.LevelPlayError}.AdNotInitialized if ${function.levelplay_interstitial_init} hasn't been
 * called yet.
 * @function_end
 */

/**
 * @function levelplay_interstitial_is_ready
 * @desc Returns whether the interstitial ad has finished loading and is ready to show.
 * @returns {Bool}
 * @function_end
 */

/**
 * @function levelplay_interstitial_is_placement_capped
 * @desc Returns whether the given placement has reached its daily cap. Returns `false` for an empty
 * or invalid placement, or if no interstitial ad has been initialized.
 * @param {String} placement_id The placement to check.
 * @returns {Bool}
 * @function_end
 */

/**
 * @function levelplay_interstitial_show
 * @desc Shows the interstitial ad for the given placement.
 * @param {String} placement_id The placement to show the ad for, or `""` for no placement.
 * @returns {Enum.LevelPlayError} ${constant.LevelPlayError}.Ok if the show request was accepted,
 * or one of ${constant.LevelPlayError}.ActivityUnavailable/AdNotInitialized/AdNotReady/PlacementCapped
 * otherwise.
 * @function_end
 */

/**
 * @function levelplay_interstitial_callback_subscribe
 * @desc Subscribes to lifecycle callbacks for interstitial ads. There is only one subscription at a
 * time - calling this again replaces the previous callback.
 * @param {Function} callback The function to call for every interstitial lifecycle event.
 * @event callback
 * @desc Fires once per lifecycle event: Loaded, LoadFailed, Displayed, DisplayFailed, Closed, Clicked,
 * or InfoChanged.
 * @member {Struct.LevelPlayResult} result The event's result. `success` is `false` only for
 * LoadFailed/DisplayFailed.
 * @member {Enum.LevelPlayCallbackEvent} type Which lifecycle event this is.
 * @member {Struct.LevelPlayAdInfo} [ad_info] Information about the ad. Absent only if the SDK provided
 * no ad-info object at all for this event.
 * @event_end
 * @example
 * ```gml
 * levelplay_interstitial_callback_subscribe(function(_result, _type, _ad_info)
 * {
 *     switch (_type)
 *     {
 *         case LevelPlayCallbackEvent.Loaded:
 *             levelplay_interstitial_show("");
 *             break;
 *         case LevelPlayCallbackEvent.LoadFailed:
 *             show_debug_message($"Interstitial failed to load: {_result.error_message}");
 *             break;
 *     }
 * });
 *
 * levelplay_interstitial_init("your_ad_unit_id");
 * levelplay_interstitial_load();
 * ```
 * @function_end
 */

/**
 * @module interstitial
 * @title Interstitial
 * @desc Functions for loading and showing interstitial ads - full-screen ads shown at natural
 * transition points in your game.
 *
 * @section_func
 * @ref levelplay_interstitial_init
 * @ref levelplay_interstitial_load
 * @ref levelplay_interstitial_is_ready
 * @ref levelplay_interstitial_is_placement_capped
 * @ref levelplay_interstitial_show
 * @ref levelplay_interstitial_callback_subscribe
 * @section_end
 *
 * @module_end
 */
