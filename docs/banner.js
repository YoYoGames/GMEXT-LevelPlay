/**
 * @function levelplay_banner_create
 * @desc This function creates and loads a banner ad. Only one banner exists at a time, so calling
 * this function again destroys the previous banner and replaces it.
 * @param {String} ad_unit_id The banner ad unit ID, from the LevelPlay dashboard.
 * @param {Enum.LevelPlayBannerSize} size The banner size to request.
 * @param {Enum.LevelPlayBannerHAlign} align_h The horizontal alignment of the banner.
 * @param {Enum.LevelPlayBannerVAlign} align_v The vertical alignment of the banner.
 * @returns {Enum.LevelPlayError} ${constant.LevelPlayError}.Ok if the request was accepted, or one of
 * ${constant.LevelPlayError}.NotInitialized or ${constant.LevelPlayError}.ActivityUnavailable
 * otherwise. [[Note: The banner is created asynchronously after this function returns, so a failure
 * that is caused by an unavailable root view can only be discovered at that point. Such a failure is
 * reported as a LoadFailed event through the callback of
 * ${function.levelplay_banner_callback_subscribe}, instead of through a synchronous return value.]]
 * @function_end
 */

/**
 * @function levelplay_banner_move
 * @desc This function repositions the current banner without recreating it. It does nothing if no
 * banner exists.
 * @param {Enum.LevelPlayBannerHAlign} align_h The horizontal alignment of the banner.
 * @param {Enum.LevelPlayBannerVAlign} align_v The vertical alignment of the banner.
 * @function_end
 */

/**
 * @function levelplay_banner_destroy
 * @desc This function destroys the current banner ad, if one exists. You should call
 * ${function.levelplay_banner_create} again to create a new one.
 * @function_end
 */

/**
 * @function levelplay_banner_callback_subscribe
 * @desc This function subscribes to the lifecycle callbacks of the banner ad. Only one subscription
 * exists at a time, so calling this function again replaces the previous callback. Unlike the
 * callbacks of interstitial and rewarded video ads, this one is called repeatedly for as long as the
 * banner exists, and not just once per load and show pair.
 * @param {Function} callback The function to call for every banner lifecycle event.
 * @event callback
 * @desc Called once per lifecycle event, which is one of Loaded, LoadFailed, Displayed,
 * DisplayFailed, Clicked, Expanded, Collapsed or LeftApplication.
 * @member {Struct.LevelPlayResult} result The result of the event. `success` is only `false` for
 * LoadFailed and DisplayFailed.
 * @member {Enum.LevelPlayCallbackEvent} type Which lifecycle event this is.
 * @member {Struct.LevelPlayAdInfo} [ad_info] Information about the ad. This is only absent if the
 * SDK provided no ad info object at all for this event.
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
 * The code above subscribes to the banner lifecycle events, logging any failure to load, and then
 * creates a standard banner along the bottom edge of the screen.
 * @function_end
 */

/**
 * @const LevelPlayBannerSize
 * @desc The banner sizes that ${function.levelplay_banner_create} can request.
 * @member Banner A standard banner, 320 x 50.
 * @member Large A large banner, 320 x 90.
 * @member MediumRectangle A medium rectangular banner (MREC), 300 x 250.
 * @member Adaptive A banner that automatically adjusts its size and its orientation to the current
 * device.
 * @const_end
 */

/**
 * @const LevelPlayBannerHAlign
 * @desc The horizontal alignment of a banner ad, used by ${function.levelplay_banner_create} and
 * ${function.levelplay_banner_move}.
 * @member Left Align to the left edge.
 * @member Center Align to the centre horizontally.
 * @member Right Align to the right edge.
 * @const_end
 */

/**
 * @const LevelPlayBannerVAlign
 * @desc The vertical alignment of a banner ad, used by ${function.levelplay_banner_create} and
 * ${function.levelplay_banner_move}.
 * @member Top Align to the top edge.
 * @member Center Align to the centre vertically.
 * @member Bottom Align to the bottom edge.
 * @const_end
 */

/**
 * @module banner
 * @title Banner
 * @desc Functions for creating and managing a banner ad, which is a small ad that stays anchored to
 * an edge of the screen.
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
