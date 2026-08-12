/**
 * @function levelplay_banner_create
 * @desc Creates and loads a banner ad. Only one banner exists at a time - calling this again destroys
 * and replaces the previous one.
 * @param {String} ad_unit_id The banner ad unit ID, from the LevelPlay dashboard.
 * @param {Enum.LevelPlayBannerSize} size The banner size to request.
 * @param {Enum.LevelPlayBannerHAlign} align_h The horizontal alignment of the banner.
 * @param {Enum.LevelPlayBannerVAlign} align_v The vertical alignment of the banner.
 * @returns {Enum.LevelPlayError} ${constant.LevelPlayError}.Ok if the request was accepted, or one of
 * ${constant.LevelPlayError}.NotInitialized/ActivityUnavailable otherwise. [[Note: The banner is
 * created asynchronously after this returns - a root-view-unavailable failure can only be discovered
 * at that point, and is reported through ${function.levelplay_banner_callback_subscribe}'s callback as
 * a LoadFailed event instead of a synchronous return value.]]
 * @function_end
 */

/**
 * @function levelplay_banner_move
 * @desc Repositions the current banner without recreating it. Does nothing if no banner exists.
 * @param {Enum.LevelPlayBannerHAlign} align_h The horizontal alignment of the banner.
 * @param {Enum.LevelPlayBannerVAlign} align_v The vertical alignment of the banner.
 * @function_end
 */

/**
 * @function levelplay_banner_destroy
 * @desc Destroys the current banner ad, if one exists. Call ${function.levelplay_banner_create} again
 * to create a new one.
 * @function_end
 */

/**
 * @function levelplay_banner_callback_subscribe
 * @desc Subscribes to lifecycle callbacks for the banner ad. There is only one subscription at a time
 * - calling this again replaces the previous callback. Unlike interstitial/rewarded video, this fires
 * repeatedly for as long as the banner exists, not just once per load/show pair.
 * @param {Function} callback The function to call for every banner lifecycle event.
 * @event callback
 * @desc Fires once per lifecycle event: Loaded, LoadFailed, Displayed, DisplayFailed, Clicked,
 * Expanded, Collapsed, or LeftApplication.
 * @member {Struct.LevelPlayResult} result The event's result. `success` is `false` only for
 * LoadFailed/DisplayFailed.
 * @member {Enum.LevelPlayCallbackEvent} type Which lifecycle event this is.
 * @member {Struct.LevelPlayAdInfo} [ad_info] Information about the ad. Absent only if the SDK provided
 * no ad-info object at all for this event.
 * @event_end
 * @example
 * ```gml
 * levelplay_banner_callback_subscribe(function(_result, _type, _ad_info)
 * {
 *     if (_type == LevelPlayCallbackEvent.LoadFailed)
 *         show_debug_message($"Banner failed to load: {_result.error_message}");
 * });
 *
 * levelplay_banner_create("your_ad_unit_id", LevelPlayBannerSize.Banner,
 *         LevelPlayBannerHAlign.Center, LevelPlayBannerVAlign.Bottom);
 * ```
 * @function_end
 */

/**
 * @const LevelPlayBannerSize
 * @desc The banner sizes ${function.levelplay_banner_create} can request.
 * @member Banner Standard banner, 320 x 50.
 * @member Large Large banner, 320 x 90.
 * @member MediumRectangle Medium rectangular banner (MREC), 300 x 250.
 * @member Adaptive Automatically adjusts size and orientation for the current device.
 * @const_end
 */

/**
 * @const LevelPlayBannerHAlign
 * @desc Horizontal alignment for a banner ad, used by ${function.levelplay_banner_create}/
 * ${function.levelplay_banner_move}.
 * @member Left Align to the left edge.
 * @member Center Align horizontally centered.
 * @member Right Align to the right edge.
 * @const_end
 */

/**
 * @const LevelPlayBannerVAlign
 * @desc Vertical alignment for a banner ad, used by ${function.levelplay_banner_create}/
 * ${function.levelplay_banner_move}.
 * @member Top Align to the top edge.
 * @member Center Align vertically centered.
 * @member Bottom Align to the bottom edge.
 * @const_end
 */

/**
 * @module banner
 * @title Banner
 * @desc Functions for creating and managing a banner ad - a small ad that stays anchored to an edge of
 * the screen.
 *
 * @section_func
 * @ref levelplay_banner_create
 * @ref levelplay_banner_move
 * @ref levelplay_banner_destroy
 * @ref levelplay_banner_callback_subscribe
 * @section_end
 *
 * @section_const
 * @ref LevelPlayBannerSize
 * @ref LevelPlayBannerHAlign
 * @ref LevelPlayBannerVAlign
 * @section_end
 *
 * @module_end
 */
