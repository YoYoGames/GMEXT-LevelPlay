/**
 * @struct LevelPlayResult
 * @desc The uniform success/failure envelope delivered to every async callback in this extension.
 * `error_message` and `sdk_error_code` are both absent on success. `sdk_error_code` carries the SDK's
 * own ad-error code verbatim when the failure came from a `LoadFailed`/`DisplayFailed` ad-lifecycle
 * event; it is absent for every other event and for ${function.levelplay_init}'s own failures.
 * @member {Bool} success Whether the operation succeeded.
 * @member {String} [error_message] The SDK's own error message. Only present on failure.
 * @member {Real} [sdk_error_code] The SDK's raw ad-error code. Only present on a `LoadFailed`/
 * `DisplayFailed` event that carried an SDK error object.
 * @struct_end
 */

/**
 * @struct LevelPlayAdInfo
 * @desc Metadata about a specific ad instance/impression, delivered alongside most
 * ${constant.LevelPlayCallbackEvent} events. Mirrors the LevelPlay SDK's own ad-info object; fields
 * the SDK didn't supply for a given event are absent (`width`/`height` are `0` instead, since the SDK
 * always reports a size). On a `LoadFailed` event the SDK provides only the ad unit ID (no full ad-info
 * object exists yet) - `unit_id` is populated from that fallback and every other field is absent.
 * @member {Real} width The ad's width, in pixels. `0` if unknown.
 * @member {Real} height The ad's height, in pixels. `0` if unknown.
 * @member {String} [format] The ad format, as reported by the SDK.
 * @member {String} [network] The mediated network that served the ad.
 * @member {String} [unit_id] The ad unit ID.
 * @member {String} [unit_name] The ad unit's display name, as configured on the dashboard.
 * @member {String} [placement_name] The placement name the ad was requested for.
 * @member {String} [country] The country the impression is attributed to.
 * @member {String} [precision] The revenue precision, as reported by the SDK.
 * @member {Real} [revenue] The estimated revenue for this impression.
 * @struct_end
 */

/**
 * @struct LevelPlayReward
 * @desc The reward earned from a rewarded video ad, delivered with the
 * ${constant.LevelPlayCallbackEvent}.Rewarded event. See ${page.getting_started}.
 * @member {String} name The reward's name, as configured for the ad unit on the dashboard.
 * @member {Real} amount The reward amount.
 * @struct_end
 */

/**
 * @function levelplay_init
 * @desc Initializes the LevelPlay SDK. Call this once, before any other LevelPlay function. Requires
 * the extension's `AndroidAppKey`/`iOSAppKey` option to be set for the current platform (see
 * ${page.extension_options}).
 * @param {Function} callback The function to call once initialization completes or fails.
 * @returns {Enum.LevelPlayError} ${constant.LevelPlayError}.Ok if the initialization request was
 * accepted, an error code if it was rejected outright (e.g. a missing app key) - in the rejected case
 * `callback` is never invoked.
 * @event callback
 * @desc Fires once, when the SDK finishes starting up (or fails to). Not fired if
 * ${function.levelplay_init} itself returned an error synchronously.
 * @member {Struct.LevelPlayResult} result The initialization outcome.
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
 * @desc Returns whether ${function.levelplay_init} has completed successfully.
 * @returns {Bool}
 * @function_end
 */

/**
 * @function levelplay_set_consent
 * @desc Sets whether the user provided consent, communicated to every mediated network that supports
 * it. See [Regulation Advanced Settings](https://developers.is.com/ironsource-mobile/android/regulation-advanced-settings/#step-4).
 * @param {Bool} enable Whether the user provided consent.
 * @function_end
 */

/**
 * @function levelplay_set_metadata
 * @desc Sets a metadata key-value pair, forwarded to mediated networks that support it. See
 * [Regulation Advanced Settings](https://developers.is.com/ironsource-mobile/android/regulation-advanced-settings/#step-4).
 * @param {String} key The metadata key to set.
 * @param {String} value The value to assign to the key.
 * @function_end
 */

/**
 * @function levelplay_set_dynamic_user_id
 * @desc Sets the Dynamic UserID, used by server-side reward callbacks to identify the user. See
 * [Dynamic UserID](https://developers.is.com/ironsource-mobile/android/rewarded-video-integration-android-2/#dynamic-userid).
 * @param {String} user_id The value to set the Dynamic UserID to.
 * @function_end
 */

/**
 * @function levelplay_launch_test_suite
 * @desc Launches the LevelPlay integration test suite, which lets you verify platform setup and
 * preview ads for your configured networks. Does nothing if the current activity/view controller is
 * unavailable. [[Important: Never ship a build with a call to this left in.]]
 * @function_end
 */

/**
 * @const LevelPlayError
 * @desc Synchronous error codes returned by most functions in this extension. These describe why a
 * call was rejected outright (e.g. before initialization, or with no ad loaded) - a failure reported
 * by the SDK itself after a call was accepted instead arrives asynchronously via
 * ${struct.LevelPlayResult}.
 * @member Ok The call was accepted.
 * @member NotInitialized ${function.levelplay_init} has not completed successfully yet.
 * @member AdNotInitialized The ad type's `_init` function has not been called yet, so no ad instance
 * exists.
 * @member AdNotReady The ad has not finished loading yet (or has already been shown).
 * @member PlacementCapped The given placement has reached its daily cap.
 * @member ActivityUnavailable The current Android activity / iOS view controller is not available.
 * @member RootViewUnavailable Banner only - the root view was unavailable when the banner tried to
 * attach itself. Discoverable only after ${function.levelplay_banner_create}'s synchronous return, so
 * it is reported through the banner callback instead - see ${function.levelplay_banner_callback_subscribe}.
 * @member MissingAppKey The extension's `AndroidAppKey`/`iOSAppKey` option is not set for the current
 * platform.
 * @const_end
 */

/**
 * @const LevelPlayCallbackEvent
 * @desc The lifecycle events an ad callback can fire with. Which subset of these a given ad type uses
 * is documented on that type's `_callback_subscribe` function.
 * @member Loaded The ad finished loading and is ready to show.
 * @member LoadFailed The ad failed to load. ${struct.LevelPlayResult}.success is `false` for this
 * event.
 * @member Displayed The ad was displayed. Equivalent to an impression.
 * @member DisplayFailed The ad failed to display. ${struct.LevelPlayResult}.success is `false` for
 * this event.
 * @member Closed The ad view was closed. Interstitial and rewarded video only.
 * @member Clicked The user clicked the ad.
 * @member InfoChanged The ad info was updated - available when another ad has loaded with a higher
 * CPM/rate. Interstitial and rewarded video only.
 * @member Rewarded The user completed watching a rewarded video and should be rewarded.
 * ${struct.LevelPlayReward} is populated for this event only. Rewarded video only.
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
 * @desc Initialization, privacy/regulation settings, and the shared result/data types every ad
 * module's callbacks use.
 *
 * @section_func
 * @desc Initialization and cross-ad-type functions.
 * @ref levelplay_init
 * @ref levelplay_is_initialized
 * @ref levelplay_set_consent
 * @ref levelplay_set_metadata
 * @ref levelplay_set_dynamic_user_id
 * @ref levelplay_launch_test_suite
 * @section_end
 *
 * @section_struct
 * @desc Shared data types used across every ad module.
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
