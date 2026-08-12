/**
 * @function_partial levelplay_init
 * @param {Function} callback
 * @returns {Enum.LevelPlayError}
 * @function_end
 */

/**
 * @function_partial levelplay_is_initialized
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial levelplay_set_consent
 * @param {Bool} enable
 * @function_end
 */

/**
 * @function_partial levelplay_set_metadata
 * @param {String} key
 * @param {String} value
 * @function_end
 */

/**
 * @function_partial levelplay_set_dynamic_user_id
 * @param {String} user_id
 * @function_end
 */

/**
 * @function_partial levelplay_launch_test_suite
 * @function_end
 */

/**
 * @function_partial levelplay_interstitial_create
 * @param {String} ad_unit_id
 * @param {Function} callback
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial levelplay_interstitial_load
 * @param {Real} handle
 * @returns {Enum.LevelPlayError}
 * @function_end
 */

/**
 * @function_partial levelplay_interstitial_set_callback
 * @param {Real} handle
 * @param {Function} callback
 * @returns {Enum.LevelPlayError}
 * @function_end
 */

/**
 * @function_partial levelplay_interstitial_is_ready
 * @param {Real} handle
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial levelplay_interstitial_is_placement_capped
 * @param {String} placement_id
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial levelplay_interstitial_show
 * @param {Real} handle
 * @param {String} [placement_id]
 * @returns {Enum.LevelPlayError}
 * @function_end
 */

/**
 * @function_partial levelplay_interstitial_destroy
 * @param {Real} handle
 * @function_end
 */

/**
 * @function_partial levelplay_interstitial_get_live_handles
 * @returns {Array[Real]}
 * @function_end
 */

/**
 * @function_partial levelplay_rewarded_video_create
 * @param {String} ad_unit_id
 * @param {Function} callback
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial levelplay_rewarded_video_load
 * @param {Real} handle
 * @returns {Enum.LevelPlayError}
 * @function_end
 */

/**
 * @function_partial levelplay_rewarded_video_set_callback
 * @param {Real} handle
 * @param {Function} callback
 * @returns {Enum.LevelPlayError}
 * @function_end
 */

/**
 * @function_partial levelplay_rewarded_video_is_ready
 * @param {Real} handle
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial levelplay_rewarded_video_is_placement_capped
 * @param {String} placement_id
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial levelplay_rewarded_video_show
 * @param {Real} handle
 * @param {String} [placement_id]
 * @returns {Enum.LevelPlayError}
 * @function_end
 */

/**
 * @function_partial levelplay_rewarded_video_destroy
 * @param {Real} handle
 * @function_end
 */

/**
 * @function_partial levelplay_rewarded_video_get_live_handles
 * @returns {Array[Real]}
 * @function_end
 */

/**
 * @function_partial levelplay_banner_create
 * @param {String} ad_unit_id
 * @param {Enum.LevelPlayBannerSize} size
 * @param {Enum.LevelPlayBannerHAlign} align_h
 * @param {Enum.LevelPlayBannerVAlign} align_v
 * @returns {Enum.LevelPlayError}
 * @function_end
 */

/**
 * @function_partial levelplay_banner_move
 * @param {Enum.LevelPlayBannerHAlign} align_h
 * @param {Enum.LevelPlayBannerVAlign} align_v
 * @function_end
 */

/**
 * @function_partial levelplay_banner_destroy
 * @function_end
 */

/**
 * @function_partial levelplay_banner_callback_subscribe
 * @param {Function} callback
 * @function_end
 */

/**
 * @struct_partial LevelPlayResult
 * @member {Bool} success
 * @member {String} [error_message]
 * @member {Real} [sdk_error_code]
 * @struct_end
 */

/**
 * @struct_partial LevelPlayAdInfo
 * @member {Real} width
 * @member {Real} height
 * @member {String} [format]
 * @member {String} [network]
 * @member {String} [unit_id]
 * @member {String} [unit_name]
 * @member {String} [placement_name]
 * @member {String} [country]
 * @member {String} [precision]
 * @member {Real} [revenue]
 * @struct_end
 */

/**
 * @struct_partial LevelPlayReward
 * @member {String} name
 * @member {Real} amount
 * @struct_end
 */

/**
 * @enum_partial LevelPlayBannerSize
 * @member Banner
 * @member Large
 * @member MediumRectangle
 * @member Adaptive
 * @enum_end
 */

/**
 * @enum_partial LevelPlayBannerHAlign
 * @member Left
 * @member Center
 * @member Right
 * @enum_end
 */

/**
 * @enum_partial LevelPlayBannerVAlign
 * @member Top
 * @member Center
 * @member Bottom
 * @enum_end
 */

/**
 * @enum_partial LevelPlayCallbackEvent
 * @member Loaded
 * @member LoadFailed
 * @member Displayed
 * @member DisplayFailed
 * @member Closed
 * @member Clicked
 * @member InfoChanged
 * @member Rewarded
 * @member Expanded
 * @member Collapsed
 * @member LeftApplication
 * @enum_end
 */

/**
 * @enum_partial LevelPlayError
 * @member Ok
 * @member NotInitialized
 * @member AdNotReady
 * @member PlacementCapped
 * @member ActivityUnavailable
 * @member RootViewUnavailable
 * @member MissingAppKey
 * @member InvalidHandle
 * @enum_end
 */

/**
 * @const_partial macros
 * @const_end
 */

