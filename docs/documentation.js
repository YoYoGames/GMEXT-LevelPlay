// Functions

/**
 * @func levelplay_init(callback)
 * @desc This function initialises the LevelPlay extension.
 * 
 * @param {function} callback The callback function to use
 * 
 * @event callback
 * @desc This callback is called when LevelPlay has initialised.
 * @member {bool} success Whether LevelPlay could successfully be initialised
 * @event_end
 * 
 * @func_end
 */

/**
 * @func levelplay_callback_unsubscribe(identifier)
 * @desc This function unsubscribes from callbacks of the given identifier, returning whether this succeeded or not.
 * 
 * @param {int64} identifier The identifier of a callback previously subscribed to
 * 
 * @returns {bool}
 * 
 * @func_end
 */

/**
 * @func levelplay_set_consent(enable)
 * @desc This function sets whether the user provided consent.
 * 
 * LevelPlay's mediation platform supports publisher communication of a user's consent choice to mediated networks (for supported networks).
 * 
 * See the documentation on [Regulation Advanced Settings](https://developers.is.com/ironsource-mobile/ios/regulation-advanced-settings/#step-1).
 * 
 * @param {bool} enable Whether the user provided consent
 * 
 * @func_end
 */

/**
 * @func levelplay_set_metadata(key, value)
 * @desc This function sets metadata to the given key-value pair.
 * 
 * See the documentation on [Regulation Advanced Settings](https://developers.is.com/ironsource-mobile/ios/regulation-advanced-settings/#step-2).
 * 
 * @param {string} key The key to set
 * @param {string} value The value to assign to the key
 * 
 * @func_end
 */

/**
 * @func levelplay_launch_test_suite()
 * @desc This function launches the LevelPlay test suite.
 * 
 * The LevelPlay integration test suite enables you to quickly and easily test your app's integration, verify platform setup, and review ads related to your configured networks.
 * 
 * @func_end
 */

/**
 * @func levelplay_set_dynamic_user_id(user_id)
 * @desc This function sets the Dynamic UserID to the given ID.
 * 
 * See the documentation on [Dynamic UserID](https://developers.is.com/ironsource-mobile/android/rewarded-video-integration-android-2/#dynamic-userid).
 * 
 * @param {string} user_id The value to set the Dynamic UserID to
 * 
 * @func_end
 */

/**
 * @func levelplay_interstitial_init(id)
 * @desc This function initialises the interstitial ad with the given ID.
 * 
 * @param {string} id The unit ID of the ad
 * 
 * @func_end
 */

/**
 * @func levelplay_interstitial_load(id)
 * @desc This function makes a request to load the interstitial ad with the given ID.
 
 * @param {string} id The unit ID of the ad
 * 
 * @func_end
 */

/**
 * @func levelplay_interstitial_is_ready()
 * @desc This function returns `true` if the ad was loaded successfully and the ad unit is not capped, or `false` otherwise.
 * 
 * @returns {bool}
 * 
 * @func_end
 */

/**
 * @func levelplay_interstitial_is_placement_capped(id)
 * @desc This function returns `true` when a valid placement is capped. If the placement is not valid, or not capped, the function will return `false`.
 * 
 * @param {string} id The unit ID of the ad
 * 
 * @returns {bool}
 * 
 * @func_end
 */

/**
 * @func levelplay_interstitial_show(id)
 * @desc This function shows the interstitial ad with the given ID without placement.
 * 
 * @param {string} id The unit ID of the ad
 * 
 * @func_end
 */

/**
 * @func levelplay_interstitial_callback_subscribe(callback)
 * @desc This function subscribes to callbacks for interstitial ads.
 * 
 * The function returns an identifier that can be passed to ${function.levelplay_callback_unsubscribe} to unsubscribe from callbacks for this type of ad.
 * 
 * @param {function} callback The function to use as the callback function
 * 
 * @returns {int64}
 * 
 * @event callback
 * @desc This is triggered when the ad has finished loading.
 * @member {string} type The value `"loaded"`
 * @member {struct.AD_INFO} ad_info Information about the changed ad
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the ad failed to load.
 * @member {string} type The value `"loaded_failed"`
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the ad is displayed. This is equivalent to an impression.
 * @member {string} type The value `"displayed"`
 * @member {struct.AD_INFO} ad_info Information about the ad
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the ad failed to display.
 * @member {string} type The value `"displayed_failed"`
 * @member {struct.AD_INFO} ad_info Information about the ad
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the ad is closed.
 * @member {string} type The value `"closed"`
 * @member {struct.AD_INFO} ad_info Information about the ad
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the ad is clicked.
 * @member {string} type The value `"clicked"`
 * @member {struct.AD_INFO} ad_info Information about the ad
 * @event_end
 * 
 * @event callback
 * @desc Provided when the ad info is updated. Available when another ad has loaded, and includes a higher CPM/Rate.
 * @member {string} type The value `"info_changed"`
 * @member {struct.AD_INFO} ad_info Information about the changed ad
 * @event_end
 * 
 * @func_end
 */

/**
 * @func levelplay_rewarded_video_init(id)
 * @desc This function initialises the rewarded video with the given ad unit ID.
 * 
 * @param {string} id The ad unit ID of the rewarded video ad
 * 
 * @event social
 * @desc This is triggered to indicate if an ad is available.
 * @member {string} type The string `"levelplay_rewarded_on_available"`
 * @member {boolean} success `true` if a rewarded video ad is available, `false` if unavailable
 * @event_end
 * 
 * @func_end
 */

/**
 * @func levelplay_rewarded_video_load(id)
 * @desc This function requests the load of the previously initialised rewarded video ad.
 * 
 * @param {string} id The ID of the rewarded video ad
 * 
 * @func_end
 */

/**
 * @func levelplay_rewarded_video_is_ready()
 * @desc This function returns `true` if the ad was loaded successfully and the ad unit is not capped, or `false` otherwise.
 * 
 * @returns {bool}
 * 
 * @func_end
 */

/**
 * @func levelplay_rewarded_video_is_placement_capped(id)
 * @desc This function returns `true` if the ad was loaded successfully and the ad unit is not capped, or `false` otherwise.
 * 
 * @param {string} id The ID of the rewarded video ad
 * 
 * @returns {bool}
 * 
 * @func_end
 */

/**
 * @func levelplay_rewarded_video_show(id)
 * @desc This function shows the rewarded video ad with the given ID.
 * 
 * The function returns `true` when a valid placement is capped. If the placement is not valid, or not capped, it will return `false`.
 * 
 * @param {string} id The ID of the rewarded video ad
 * 
 * @returns {bool}
 * 
 * @func_end
 */

/**
 * @func levelplay_rewarded_callback_subscribe
 * @desc This function subscribes to callbacks for rewarded video ads.
 * 
 * The function returns an identifier that can be passed to ${function.levelplay_callback_unsubscribe} to unsubscribe from callbacks for this type of ad.
 * 
 * @param {function} callback The function to use as the callback function
 * 
 * @returns {int64}
 * 
 * @event callback
 * @desc This is triggered when the ad is successfully loaded. Ad Unit information is included.
 * @member {string} type The value `"loaded"`
 * @member {struct.AD_INFO} ad_info Information about the ad
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the ad failed to load.
 * @member {string} type The value `"loaded_failed"`
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the Rewarded Video ad is displayed. This is equivalent to an impression.
 * @member {string} type The value `"displayed"`
 * @member {struct.AD_INFO} ad_info Information about the ad
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the Rewarded Video ad failed to display.
 * @member {string} type The value `"displayed_failed"`
 * @member {struct.AD_INFO} ad_info Information about the ad
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the Rewarded Video ad view is about to be closed.
 * @member {string} type The value `"closed"`
 * @member {struct.AD_INFO} ad_info Information about the ad
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the rewarded video ad was clicked.
 * @member {string} type The value `"clicked"`
 * @member {struct.AD_INFO} ad_info Information about the ad
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the ad info is updated. Available when another ad has loaded, and includes a higher CPM/Rate.
 * @member {string} type The value `"info_changed"`
 * @member {struct.AD_INFO} ad_info Information about the ad
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the user completed watching the video, and should be rewarded. Ad Unit info and the reward info are included.
 * @member {string} type The value `"rewarded"`
 * @member {struct.AD_INFO} ad_info Information about the ad
 * @member {struct} reward A struct containing information about the reward; its `name` (${type.string}) and the `amount` (${type.real})
 * @event_end
 * 
 * @func_end
 */

/**
 * @func levelplay_banner_create(id, size, align_h, align_v)
 * @desc This function creates the banner view and sets the ad unit ID.
 * 
 * @param {string} id The ID of the banner ad to create
 * @param {constant.LEVELPLAY_AD_SIZE} size The size of the banner ad
 * @param {constant.LEVELPLAY_BANNER_HALIGN} align_h The horizontal alignment of the banner ad
 * @param {constant.LEVELPLAY_BANNER_VALIGN} align_v The vertical alignment of the banner ad
 * 
 * @func_end
 */

/**
 * @func levelplay_banner_move(align_h, align_v)
 * @desc This function moves the current banner view.
 * 
 * @param {constant.LEVELPLAY_BANNER_HALIGN} align_h The horizontal alignment of the banner ad
 * @param {constant.LEVELPLAY_BANNER_VALIGN} align_v The vertical alignment of the banner ad
 * 
 * @func_end
 */

/**
 * @func levelplay_banner_destroy()
 * @desc This function destroys the current banner ad.
 * 
 * @func_end
 */

/**
 * @func levelplay_banner_callback_subscribe(callback)
 * @desc This function subscribes to callbacks for banner ads.
 * 
 * The function returns an identifier that can be passed to ${function.levelplay_callback_unsubscribe} to unsubscribe from callbacks for this type of ad.
 * 
 * @param {function} callback The function to use as the callback function
 * 
 * @returns {int64}
 * 
 * @event callback
 * @desc This is triggered when the ad is successfully loaded.
 * @member {string} type The string `"loaded"`
 * @member {struct.AD_INFO} [ad_info] Information about the ad
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the ad failed to load.
 * @member {string} type The string `"loaded_failed"`
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the ad is displayed. This is equivalent to an impression.
 * @member {string} type The string `"displayed"`
 * @member {struct.AD_INFO} ad_info Information about the ad
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the ad failed to display.
 * @member {string} type The string `"displayed_failed"`
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the ad is clicked.
 * @member {string} type The string `"clicked"`
 * @member {struct.AD_INFO} ad_info Information about the ad
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the ad is expanded (i.e. opened in fullscreen).
 * @member {string} type The string `"expanded"`
 * @member {struct.AD_INFO} ad_info Information about the ad
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when the ad is collapsed (i.e. restored to its original size).
 * @member {string} type The string `"collapsed"`
 * @member {struct.AD_INFO} ad_info Information about the ad
 * @event_end
 * 
 * @event callback
 * @desc This is triggered when a banner ad has left the application (i.e. the user pressed the ad and was navigated out of the app).
 * @member {string} type The string `"left_application"`
 * @member {struct.AD_INFO} ad_info Information about the ad
 * @event_end
 * 
 * @func_end
 */

// Constants & Enums

/**
 * @const LEVELPLAY_AD_SIZE
 * @desc This enum holds the possible ad sizes.
 * 
 * @member BANNER Standard banner, 320 x 50
 * @member LARGE Large banner, 320 x 90
 * @member MEDIUM_RECTANGLE Medium rectangular banner (MREC), 300 x 250
 * @member ADAPTIVE Automatically renders ads to adjust size and orientation for mobile & tablets
 * 
 * @const_end
 */

/**
 * @const LEVELPLAY_BANNER_HALIGN
 * @desc This enum holds the possible values for a banner ad's horizontal alignment.
 * 
 * @member LEFT Align left
 * @member CENTER Align center
 * @member RIGHT Align right
 * 
 * @const_end
 */

/**
 * @const LEVELPLAY_BANNER_VALIGN
 * @desc This enum holds the possible values for a banner ad's vertical alignment.
 * 
 * @member TOP Align top
 * @member MIDDLE Align middle
 * @member BOTTOM Align bottom
 * 
 * @const_end
 */

// Structs

/**
 * @struct AD_INFO
 * @desc This struct holds information about an ad.
 * 
 * @member {real} width The width of the ad
 * @member {real} height The height of the ad
 * @member {string} format The format of the ad
 * @member {string} network The network from which the ad originates
 * @member {string} unit_id The unique ID of the ad
 * @member {string} unit_name The name of the ad
 * @member {string} placement_name The placement name of the ad
 * @member {string} country The country
 * @member {string} precision The precision
 * @member {real} revenue The revenue
 * 
 * @struct_end
 */

// Modules

/**
 * @module home
 * @title LevelPlay
 * @desc This is the LevelPlay extension, which allows you to add Unity LevelPlay functionality to your GameMaker game.
 * 
 * @section_func Functions
 * @desc These are the functions in the LevelPlay extension:
 * @ref levelplay_init
 * @ref levelplay_callback_unsubscribe
 * @ref levelplay_set_consent
 * @ref levelplay_set_metadata
 * @ref levelplay_launch_test_suite
 * @ref levelplay_set_dynamic_user_id
 * @ref levelplay_interstitial_init
 * @ref levelplay_interstitial_load
 * @ref levelplay_interstitial_is_ready
 * @ref levelplay_interstitial_is_placement_capped
 * @ref levelplay_interstitial_show
 * @ref levelplay_interstitial_callback_subscribe
 * @ref levelplay_rewarded_video_init
 * @ref levelplay_rewarded_video_load
 * @ref levelplay_rewarded_video_is_ready
 * @ref levelplay_rewarded_video_is_placement_capped
 * @ref levelplay_rewarded_video_show
 * @ref levelplay_rewarded_callback_subscribe
 * @ref levelplay_banner_create
 * @ref levelplay_banner_move
 * @ref levelplay_banner_destroy
 * @ref levelplay_banner_callback_subscribe
 * @section_end
 * 
 * @section_const Constants
 * @desc These are the constants in the LevelPlay extension:
 * @ref LEVELPLAY_AD_SIZE
 * @ref LEVELPLAY_BANNER_HALIGN
 * @ref LEVELPLAY_BANNER_VALIGN
 * @section_end
 * 
 * @section_struct Structs
 * @desc These are the structs in the LevelPlay extension:
 * @ref AD_INFO
 * @section_end
 * 
 * @module_end
 */
