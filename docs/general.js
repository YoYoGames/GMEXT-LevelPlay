/**
 * @struct LevelPlayResult
 * @desc The uniform success or failure envelope that is given to every asynchronous callback in this
 * extension. Both `error_message` and `sdk_error_code` are absent when the operation succeeded. The
 * `sdk_error_code` member carries the ad error code of the SDK itself, and it is only present when
 * the failure came from a `LoadFailed` or a `DisplayFailed` ad lifecycle event, which means that it
 * is absent for every other event and for the failures of ${function.levelplay_init}.
 * @member {Bool} success Whether the operation succeeded.
 * @member {String} [error_message] The error message of the SDK itself. This is only present on a
 * failure.
 * @member {Real} [sdk_error_code] The raw ad error code of the SDK. This is only present on a
 * `LoadFailed` or a `DisplayFailed` event that carried an error object from the SDK.
 * @struct_end
 */

/**
 * @struct LevelPlayAdInfo
 * @desc Information about a specific ad instance or impression, which is given alongside most
 * ${constant.LevelPlayCallbackEvent} events. It mirrors the ad info object of the LevelPlay SDK
 * itself, and any field that the SDK did not supply for a given event is absent. The `width` and
 * `height` members are the exception, as they are `0` rather than absent whenever the SDK reported
 * no size for the ad.
 * [[Note: A `LoadFailed` event carries no ad info object from the SDK at all, and the two platforms
 * differ in what they pass in its place. On iOS the ad unit ID that the SDK reports separately is
 * carried through as a partial struct, so `unit_id` is present, `width` and `height` are `0` and
 * every other field is absent. On Android the whole `ad_info` argument is `undefined` for that
 * event, so you should test it with `is_undefined` before you read anything from it.]]
 * @member {Real} width The width of the ad, in pixels. This is `0` if the width is unknown.
 * @member {Real} height The height of the ad, in pixels. This is `0` if the height is unknown.
 * @member {String} [format] The ad format, as reported by the SDK.
 * @member {String} [network] The mediated network that served the ad.
 * @member {String} [unit_id] The ad unit ID.
 * @member {String} [unit_name] The display name of the ad unit, as it is configured on the
 * dashboard.
 * @member {String} [placement_name] The name of the placement that the ad was requested for.
 * @member {String} [country] The country that the impression is attributed to.
 * @member {String} [precision] The revenue precision, as reported by the SDK.
 * @member {Real} [revenue] The estimated revenue for this impression.
 * @struct_end
 */

/**
 * @struct LevelPlayReward
 * @desc The reward that was earned from a rewarded video ad, which is given with the
 * ${constant.LevelPlayCallbackEvent}.Rewarded event. See ${page.getting_started}.
 * @member {String} name The name of the reward, as it is configured for the ad unit on the
 * dashboard.
 * @member {Real} amount The amount of the reward.
 * @struct_end
 */

/**
 * @function levelplay_init
 * @desc This function initialises the LevelPlay SDK. You should call it once, before any other
 * LevelPlay function. It requires the `AndroidAppKey` or the `iOSAppKey` option of the extension to
 * be set for the current platform. See ${page.extension_options}.
 * @param {Function} callback The function to call once the initialisation completes or fails.
 * @returns {Enum.LevelPlayError} ${constant.LevelPlayError}.Ok if the initialisation request was
 * accepted, or an error code if it was rejected outright, for example because the app key is
 * missing. In that rejected case `callback` is never called.
 * @event callback
 * @desc Called once, when the SDK finishes starting up or fails to do so. It is not called if
 * ${function.levelplay_init} itself returned an error synchronously.
 * @member {Struct.LevelPlayResult} result The outcome of the initialisation.
 * @event_end
 * @example
 * ```gml
 * levelplay_init(function(_result)
 * {
 *     if (_result.success)
 *         show_debug_message("LevelPlay initialized");
 *     else
 *         show_debug_message($"LevelPlay failed to initialize: {_result.error_message}");
 * });
 * ```
 * @function_end
 */

/**
 * @function levelplay_is_initialized
 * @desc This function returns whether ${function.levelplay_init} has completed successfully.
 * @returns {Bool}
 * @function_end
 */

/**
 * @function levelplay_set_consent
 * @desc This function sets whether the user has provided consent, which is communicated to every
 * mediated network that supports it. See
 * [Regulation Advanced Settings](https://developers.is.com/ironsource-mobile/android/regulation-advanced-settings/#step-4).
 * @param {Bool} enable Whether the user has provided consent.
 * @function_end
 */

/**
 * @function levelplay_set_metadata
 * @desc This function sets a metadata key and value pair, which is forwarded to the mediated
 * networks that support it. See
 * [Regulation Advanced Settings](https://developers.is.com/ironsource-mobile/android/regulation-advanced-settings/#step-4).
 * @param {String} key The metadata key to set.
 * @param {String} value The value to assign to the key.
 * @function_end
 */

/**
 * @function levelplay_set_dynamic_user_id
 * @desc This function sets the Dynamic UserID, which is used by server-side reward callbacks to
 * identify the user. See
 * [Dynamic UserID](https://developers.is.com/ironsource-mobile/android/rewarded-video-integration-android-2/#dynamic-userid).
 * @param {String} user_id The value to set the Dynamic UserID to.
 * @function_end
 */

/**
 * @function levelplay_launch_test_suite
 * @desc This function launches the LevelPlay integration test suite, which lets you verify the setup
 * of your platform and preview ads for the networks that you have configured. It does nothing if the
 * current activity or view controller is unavailable. [[Important: You should never ship a build
 * that still contains a call to this function.]]
 * @function_end
 */

/**
 * @const LevelPlayError
 * @desc The synchronous error codes that are returned by most functions in this extension. They
 * describe why a call was rejected outright, for example because it was made before the
 * initialisation completed, or with no ad loaded. A failure that is reported by the SDK itself after
 * a call was accepted arrives asynchronously through a ${struct.LevelPlayResult} instead.
 * @member Ok The call was accepted.
 * @member NotInitialized ${function.levelplay_init} has not completed successfully yet.
 * @member AdNotReady The ad has not finished loading yet, or it has already been shown.
 * @member PlacementCapped The given placement has reached its daily cap.
 * @member ActivityUnavailable The current Android activity or iOS view controller is not available.
 * @member RootViewUnavailable Banner only. The root view was unavailable when the banner tried to
 * attach itself. No function ever returns this value, as the failure that it describes can only be
 * discovered after ${function.levelplay_banner_create} has already returned. It is reported as a
 * LoadFailed event through the banner callback instead, and the reason is given in
 * `result.error_message`. See ${function.levelplay_banner_callback_subscribe}.
 * @member MissingAppKey The `AndroidAppKey` or the `iOSAppKey` option of the extension is not set
 * for the current platform.
 * @member InvalidHandle Interstitial and rewarded video only. The `handle` is not a live handle from
 * the matching `_create` function, or it has already been destroyed.
 * @const_end
 */

/**
 * @const LevelPlayCallbackEvent
 * @desc The lifecycle events that an ad callback can be called with. Which subset of these a given
 * ad type uses is documented on the `_load` function of that type, or on `_callback_subscribe` for a
 * banner.
 * @member Loaded The ad finished loading and is ready to be shown.
 * @member LoadFailed The ad failed to load. ${struct.LevelPlayResult}.success is `false` for this
 * event.
 * @member Displayed The ad was displayed, which is the equivalent of an impression.
 * @member DisplayFailed The ad failed to display. ${struct.LevelPlayResult}.success is `false` for
 * this event.
 * @member Closed The ad view was closed. Interstitial and rewarded video only.
 * @member Clicked The user clicked the ad.
 * @member InfoChanged The ad info was updated, which happens when another ad has loaded with a
 * higher CPM or rate. Interstitial and rewarded video only.
 * @member Rewarded The user finished watching a rewarded video and should be rewarded.
 * ${struct.LevelPlayReward} is only populated for this event. Rewarded video only.
 * @member Expanded The banner was expanded to fullscreen. Banner only.
 * @member Collapsed The banner was restored from fullscreen. Banner only.
 * @member LeftApplication The user clicked the banner and was navigated out of the app. Banner only.
 * @const_end
 */

/**
 * @const macros
 * @const_end
 */

/**
 * @module general
 * @title General
 * @desc Initialisation, the privacy and regulation settings, and the shared result and data types
 * that the callbacks of every ad module use.
 *
 * @section_func
 * @desc Initialisation and the functions that are shared across the ad types.
 * @ref levelplay_init
 * @ref levelplay_is_initialized
 * @ref levelplay_set_consent
 * @ref levelplay_set_metadata
 * @ref levelplay_set_dynamic_user_id
 * @ref levelplay_launch_test_suite
 * @section_end
 *
 * @section_struct
 * @desc The shared data types that are used across every ad module.
 * @ref LevelPlayResult
 * @ref LevelPlayAdInfo
 * @ref LevelPlayReward
 * @section_end
 *
 * @section_const
 * @ref LevelPlayError
 * @ref LevelPlayCallbackEvent
 * @section_end
 *
 * @module_end
 */
