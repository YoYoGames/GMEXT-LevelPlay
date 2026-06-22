// ##### extgen :: Auto-generated file do not edit!! #####

// #####################################################################
// # Macros
// #####################################################################

// #####################################################################
// # Enums
// #####################################################################

enum LevelPlayBannerSize
{
    Banner = 0,
    Large = 1,
    MediumRectangle = 2,
    Adaptive = 3
}

enum LevelPlayBannerAlignH
{
    Left = 0,
    Center = 1,
    Right = 2
}

enum LevelPlayBannerAlignV
{
    Top = 0,
    Center = 1,
    Bottom = 2
}

enum LevelPlayCallbackEvent
{
    Loaded = 0,
    LoadFailed = 1,
    Displayed = 2,
    DisplayFailed = 3,
    Closed = 4,
    Clicked = 5,
    InfoChanged = 6,
    Rewarded = 7,
    Expanded = 8,
    Collapsed = 9,
    LeftApplication = 10
}

// #####################################################################
// # Constructors
// #####################################################################

/**
 * @returns {Struct.LevelPlayInitEvent} 
 */
function LevelPlayInitEvent() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore 
     */
    static __uid = 3293566143;

    self.type = undefined;
    self.success = undefined;
    self.message = undefined;

}

/**
 * @returns {Struct.LevelPlayAdError} 
 */
function LevelPlayAdError() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore 
     */
    static __uid = 3921955944;

    self.message = undefined;
    self.error_code = undefined;
    self.error_message = undefined;

}

/**
 * @returns {Struct.LevelPlayAdInfo} 
 */
function LevelPlayAdInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore 
     */
    static __uid = 2306334846;

    self.width = undefined;
    self.height = undefined;
    self.format = undefined;
    self.network = undefined;
    self.unit_id = undefined;
    self.unit_name = undefined;
    self.placement_name = undefined;
    self.country = undefined;
    self.precision = undefined;
    self.revenue = undefined;

}

/**
 * @returns {Struct.LevelPlayReward} 
 */
function LevelPlayReward() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore 
     */
    static __uid = 2643065324;

    self.name = undefined;
    self.amount = undefined;

}

/**
 * @returns {Struct.LevelPlayAdEvent} 
 */
function LevelPlayAdEvent() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore 
     */
    static __uid = 2209725994;

    self.type = undefined;
    self.message = undefined;
    self.ad_info = undefined;
    self.error = undefined;
    self.reward = undefined;

}

// #####################################################################
// # Codecs
// #####################################################################

/**
 * @func __LevelPlayInitEvent_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.LevelPlayInitEvent} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore 
 */
function __LevelPlayInitEvent_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: type, type: String
        if (!is_string(self.type)) show_error($"{_where} :: self.type expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.type));
        buffer_write(_buffer, buffer_string, self.type);

        // field: success, type: Bool
        if (!is_bool(self.success)) show_error($"{_where} :: self.success expected bool", true);
        buffer_write(_buffer, buffer_bool, self.success);

        // field: message, type: optional<String>
        if (is_undefined(self.message))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.message)) show_error($"{_where} :: self.message expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.message));
            buffer_write(_buffer, buffer_string, self.message);
        }

    }
}

/**
 * @func __LevelPlayInitEvent_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.LevelPlayInitEvent} 
 * @ignore 
 */
function __LevelPlayInitEvent_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new LevelPlayInitEvent();
    with (_inst)
    {
        // field: type, type: String
        buffer_read(_buffer, buffer_u32);
        self.type = buffer_read(_buffer, buffer_string);

        // field: success, type: Bool
        self.success = buffer_read(_buffer, buffer_bool);

        // field: message, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.message = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.message = undefined;
        }

    }

    return _inst;
}

/**
 * @func __LevelPlayAdError_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.LevelPlayAdError} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore 
 */
function __LevelPlayAdError_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: message, type: String
        if (!is_string(self.message)) show_error($"{_where} :: self.message expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.message));
        buffer_write(_buffer, buffer_string, self.message);

        // field: error_code, type: Int32
        if (!is_numeric(self.error_code)) show_error($"{_where} :: self.error_code expected number", true);
        buffer_write(_buffer, buffer_s32, self.error_code);

        // field: error_message, type: String
        if (!is_string(self.error_message)) show_error($"{_where} :: self.error_message expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.error_message));
        buffer_write(_buffer, buffer_string, self.error_message);

    }
}

/**
 * @func __LevelPlayAdError_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.LevelPlayAdError} 
 * @ignore 
 */
function __LevelPlayAdError_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new LevelPlayAdError();
    with (_inst)
    {
        // field: message, type: String
        buffer_read(_buffer, buffer_u32);
        self.message = buffer_read(_buffer, buffer_string);

        // field: error_code, type: Int32
        self.error_code = buffer_read(_buffer, buffer_s32);

        // field: error_message, type: String
        buffer_read(_buffer, buffer_u32);
        self.error_message = buffer_read(_buffer, buffer_string);

    }

    return _inst;
}

/**
 * @func __LevelPlayAdInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.LevelPlayAdInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore 
 */
function __LevelPlayAdInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: width, type: Int32
        if (!is_numeric(self.width)) show_error($"{_where} :: self.width expected number", true);
        buffer_write(_buffer, buffer_s32, self.width);

        // field: height, type: Int32
        if (!is_numeric(self.height)) show_error($"{_where} :: self.height expected number", true);
        buffer_write(_buffer, buffer_s32, self.height);

        // field: format, type: String
        if (!is_string(self.format)) show_error($"{_where} :: self.format expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.format));
        buffer_write(_buffer, buffer_string, self.format);

        // field: network, type: String
        if (!is_string(self.network)) show_error($"{_where} :: self.network expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.network));
        buffer_write(_buffer, buffer_string, self.network);

        // field: unit_id, type: String
        if (!is_string(self.unit_id)) show_error($"{_where} :: self.unit_id expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.unit_id));
        buffer_write(_buffer, buffer_string, self.unit_id);

        // field: unit_name, type: String
        if (!is_string(self.unit_name)) show_error($"{_where} :: self.unit_name expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.unit_name));
        buffer_write(_buffer, buffer_string, self.unit_name);

        // field: placement_name, type: String
        if (!is_string(self.placement_name)) show_error($"{_where} :: self.placement_name expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.placement_name));
        buffer_write(_buffer, buffer_string, self.placement_name);

        // field: country, type: String
        if (!is_string(self.country)) show_error($"{_where} :: self.country expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.country));
        buffer_write(_buffer, buffer_string, self.country);

        // field: precision, type: String
        if (!is_string(self.precision)) show_error($"{_where} :: self.precision expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.precision));
        buffer_write(_buffer, buffer_string, self.precision);

        // field: revenue, type: Float64
        if (!is_numeric(self.revenue)) show_error($"{_where} :: self.revenue expected number", true);
        buffer_write(_buffer, buffer_f64, self.revenue);

    }
}

/**
 * @func __LevelPlayAdInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.LevelPlayAdInfo} 
 * @ignore 
 */
function __LevelPlayAdInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new LevelPlayAdInfo();
    with (_inst)
    {
        // field: width, type: Int32
        self.width = buffer_read(_buffer, buffer_s32);

        // field: height, type: Int32
        self.height = buffer_read(_buffer, buffer_s32);

        // field: format, type: String
        buffer_read(_buffer, buffer_u32);
        self.format = buffer_read(_buffer, buffer_string);

        // field: network, type: String
        buffer_read(_buffer, buffer_u32);
        self.network = buffer_read(_buffer, buffer_string);

        // field: unit_id, type: String
        buffer_read(_buffer, buffer_u32);
        self.unit_id = buffer_read(_buffer, buffer_string);

        // field: unit_name, type: String
        buffer_read(_buffer, buffer_u32);
        self.unit_name = buffer_read(_buffer, buffer_string);

        // field: placement_name, type: String
        buffer_read(_buffer, buffer_u32);
        self.placement_name = buffer_read(_buffer, buffer_string);

        // field: country, type: String
        buffer_read(_buffer, buffer_u32);
        self.country = buffer_read(_buffer, buffer_string);

        // field: precision, type: String
        buffer_read(_buffer, buffer_u32);
        self.precision = buffer_read(_buffer, buffer_string);

        // field: revenue, type: Float64
        self.revenue = buffer_read(_buffer, buffer_f64);

    }

    return _inst;
}

/**
 * @func __LevelPlayReward_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.LevelPlayReward} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore 
 */
function __LevelPlayReward_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: name, type: String
        if (!is_string(self.name)) show_error($"{_where} :: self.name expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.name));
        buffer_write(_buffer, buffer_string, self.name);

        // field: amount, type: Int32
        if (!is_numeric(self.amount)) show_error($"{_where} :: self.amount expected number", true);
        buffer_write(_buffer, buffer_s32, self.amount);

    }
}

/**
 * @func __LevelPlayReward_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.LevelPlayReward} 
 * @ignore 
 */
function __LevelPlayReward_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new LevelPlayReward();
    with (_inst)
    {
        // field: name, type: String
        buffer_read(_buffer, buffer_u32);
        self.name = buffer_read(_buffer, buffer_string);

        // field: amount, type: Int32
        self.amount = buffer_read(_buffer, buffer_s32);

    }

    return _inst;
}

/**
 * @func __LevelPlayAdEvent_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.LevelPlayAdEvent} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore 
 */
function __LevelPlayAdEvent_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: type, type: String
        if (!is_string(self.type)) show_error($"{_where} :: self.type expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.type));
        buffer_write(_buffer, buffer_string, self.type);

        // field: message, type: optional<String>
        if (is_undefined(self.message))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.message)) show_error($"{_where} :: self.message expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.message));
            buffer_write(_buffer, buffer_string, self.message);
        }

        // field: ad_info, type: optional<struct LevelPlayAdInfo>
        if (is_undefined(self.ad_info))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (self.ad_info.__uid != 2306334846) show_error($"{_where} :: self.ad_info expected LevelPlayAdInfo", true);
            __LevelPlayAdInfo_encode(self.ad_info, _buffer, buffer_tell(_buffer), _where);
        }

        // field: error, type: optional<struct LevelPlayAdError>
        if (is_undefined(self.error))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (self.error.__uid != 3921955944) show_error($"{_where} :: self.error expected LevelPlayAdError", true);
            __LevelPlayAdError_encode(self.error, _buffer, buffer_tell(_buffer), _where);
        }

        // field: reward, type: optional<struct LevelPlayReward>
        if (is_undefined(self.reward))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (self.reward.__uid != 2643065324) show_error($"{_where} :: self.reward expected LevelPlayReward", true);
            __LevelPlayReward_encode(self.reward, _buffer, buffer_tell(_buffer), _where);
        }

    }
}

/**
 * @func __LevelPlayAdEvent_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.LevelPlayAdEvent} 
 * @ignore 
 */
function __LevelPlayAdEvent_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new LevelPlayAdEvent();
    with (_inst)
    {
        // field: type, type: String
        buffer_read(_buffer, buffer_u32);
        self.type = buffer_read(_buffer, buffer_string);

        // field: message, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.message = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.message = undefined;
        }

        // field: ad_info, type: optional<struct LevelPlayAdInfo>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.ad_info = __LevelPlayAdInfo_decode(_buffer, buffer_tell(_buffer));
        }
        else
        {
            self.ad_info = undefined;
        }

        // field: error, type: optional<struct LevelPlayAdError>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.error = __LevelPlayAdError_decode(_buffer, buffer_tell(_buffer));
        }
        else
        {
            self.error = undefined;
        }

        // field: reward, type: optional<struct LevelPlayReward>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.reward = __LevelPlayReward_decode(_buffer, buffer_tell(_buffer));
        }
        else
        {
            self.reward = undefined;
        }

    }

    return _inst;
}

// #####################################################################
// # Functions
// #####################################################################

/**
 * @param {Function} _callback
 */
function levelplay_init(_callback)
{
    static __dispatcher = __GMLevelPlay_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __levelplay_init(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

// Skipping function levelplay_is_initialized (no wrapper is required)


// Skipping function levelplay_set_consent (no wrapper is required)


// Skipping function levelplay_set_metadata (no wrapper is required)


// Skipping function levelplay_set_dynamic_user_id (no wrapper is required)


// Skipping function levelplay_launch_test_suite (no wrapper is required)


// Skipping function levelplay_interstitial_init (no wrapper is required)


// Skipping function levelplay_interstitial_load (no wrapper is required)


// Skipping function levelplay_interstitial_is_ready (no wrapper is required)


// Skipping function levelplay_interstitial_is_placement_capped (no wrapper is required)


// Skipping function levelplay_interstitial_show (no wrapper is required)


/**
 * @param {Function} _callback
 */
function levelplay_interstitial_callback_subscribe(_callback)
{
    static __dispatcher = __GMLevelPlay_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __levelplay_interstitial_callback_subscribe(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

// Skipping function levelplay_rewarded_video_init (no wrapper is required)


// Skipping function levelplay_rewarded_video_load (no wrapper is required)


// Skipping function levelplay_rewarded_video_is_ready (no wrapper is required)


// Skipping function levelplay_rewarded_video_is_placement_capped (no wrapper is required)


// Skipping function levelplay_rewarded_video_show (no wrapper is required)


/**
 * @param {Function} _callback
 */
function levelplay_rewarded_callback_subscribe(_callback)
{
    static __dispatcher = __GMLevelPlay_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __levelplay_rewarded_callback_subscribe(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {String} _ad_unit_id
 * @param {Enum.LevelPlayBannerSize} _size
 * @param {Enum.LevelPlayBannerAlignH} _align_h
 * @param {Enum.LevelPlayBannerAlignV} _align_v
 */
function levelplay_banner_create(_ad_unit_id, _size, _align_h, _align_v)
{
    var __args_buffer = __ext_core_get_args_buffer();

    // param: _ad_unit_id, type: String
    if (!is_string(_ad_unit_id)) show_error($"{_GMFUNCTION_} :: _ad_unit_id expected string", true);
    buffer_write(__args_buffer, buffer_u32, string_byte_length(_ad_unit_id));
    buffer_write(__args_buffer, buffer_string, _ad_unit_id);

    // param: _size, type: enum LevelPlayBannerSize

    if (!is_numeric(_size)) show_error($"{_GMFUNCTION_} :: _size expected number", true);
    buffer_write(__args_buffer, buffer_u32, _size);

    // param: _align_h, type: enum LevelPlayBannerAlignH

    if (!is_numeric(_align_h)) show_error($"{_GMFUNCTION_} :: _align_h expected number", true);
    buffer_write(__args_buffer, buffer_u32, _align_h);

    // param: _align_v, type: enum LevelPlayBannerAlignV

    if (!is_numeric(_align_v)) show_error($"{_GMFUNCTION_} :: _align_v expected number", true);
    buffer_write(__args_buffer, buffer_u32, _align_v);

    var _return_value = __levelplay_banner_create(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Enum.LevelPlayBannerAlignH} _align_h
 * @param {Enum.LevelPlayBannerAlignV} _align_v
 */
function levelplay_banner_move(_align_h, _align_v)
{
    var __args_buffer = __ext_core_get_args_buffer();

    // param: _align_h, type: enum LevelPlayBannerAlignH

    if (!is_numeric(_align_h)) show_error($"{_GMFUNCTION_} :: _align_h expected number", true);
    buffer_write(__args_buffer, buffer_u32, _align_h);

    // param: _align_v, type: enum LevelPlayBannerAlignV

    if (!is_numeric(_align_v)) show_error($"{_GMFUNCTION_} :: _align_v expected number", true);
    buffer_write(__args_buffer, buffer_u32, _align_v);

    var _return_value = __levelplay_banner_move(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

// Skipping function levelplay_banner_destroy (no wrapper is required)


/**
 * @param {Function} _callback
 */
function levelplay_banner_callback_subscribe(_callback)
{
    static __dispatcher = __GMLevelPlay_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __levelplay_banner_callback_subscribe(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/// @ignore
function __GMLevelPlay_get_decoders()
{
    static __decoders = [
        __LevelPlayInitEvent_decode,
        __LevelPlayAdError_decode,
        __LevelPlayAdInfo_decode,
        __LevelPlayReward_decode,
        __LevelPlayAdEvent_decode
    ];
    return __decoders;
}
/// @ignore
function __GMLevelPlay_get_dispatcher()
{
    static __dispatcher = new __GMNativeFunctionDispatcher(__GMLevelPlay_invocation_handler, __GMLevelPlay_get_decoders());
    return __dispatcher;
}
