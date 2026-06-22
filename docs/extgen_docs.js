/**
 * @function_partial levelplay_init
 * @param {Function} callback
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
 * @function_partial levelplay_interstitial_init
 * @param {String} ad_unit_id
 * @function_end 
 */

/**
 * @function_partial levelplay_interstitial_load
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial levelplay_interstitial_is_ready
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
 * @param {String} placement_id
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial levelplay_interstitial_callback_subscribe
 * @param {Function} callback
 * @function_end 
 */

/**
 * @function_partial levelplay_rewarded_video_init
 * @param {String} ad_unit_id
 * @function_end 
 */

/**
 * @function_partial levelplay_rewarded_video_load
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial levelplay_rewarded_video_is_ready
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
 * @param {String} placement_id
 * @returns {Bool} 
 * @function_end 
 */

/**
 * @function_partial levelplay_rewarded_callback_subscribe
 * @param {Function} callback
 * @function_end 
 */

/**
 * @function_partial levelplay_banner_create
 * @param {String} ad_unit_id
 * @param {Enum.LevelPlayBannerSize} size
 * @param {Enum.LevelPlayBannerAlignH} align_h
 * @param {Enum.LevelPlayBannerAlignV} align_v
 * @function_end 
 */

/**
 * @function_partial levelplay_banner_move
 * @param {Enum.LevelPlayBannerAlignH} align_h
 * @param {Enum.LevelPlayBannerAlignV} align_v
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
 * @struct_partial LevelPlayInitEvent
 * @member {String} type
 * @member {Bool} success
 * @member {String} [message]
 * @struct_end 
 */

/**
 * @struct_partial LevelPlayAdError
 * @member {String} message
 * @member {Real} error_code
 * @member {String} error_message
 * @struct_end 
 */

/**
 * @struct_partial LevelPlayAdInfo
 * @member {Real} width
 * @member {Real} height
 * @member {String} format
 * @member {String} network
 * @member {String} unit_id
 * @member {String} unit_name
 * @member {String} placement_name
 * @member {String} country
 * @member {String} precision
 * @member {Real} revenue
 * @struct_end 
 */

/**
 * @struct_partial LevelPlayReward
 * @member {String} name
 * @member {Real} amount
 * @struct_end 
 */

/**
 * @struct_partial LevelPlayAdEvent
 * @member {String} type
 * @member {String} [message]
 * @member {Struct.LevelPlayAdInfo} [ad_info]
 * @member {Struct.LevelPlayAdError} [error]
 * @member {Struct.LevelPlayReward} [reward]
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
 * @enum_partial LevelPlayBannerAlignH
 * @member Left
 * @member Center
 * @member Right
 * @enum_end 
 */

/**
 * @enum_partial LevelPlayBannerAlignV
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
 * @const_partial macros
 * @const_end 
 */

