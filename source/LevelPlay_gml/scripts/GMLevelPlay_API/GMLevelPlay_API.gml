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

enum LevelPlayBannerHAlign
{
    Left = 0,
    Center = 1,
    Right = 2
}

enum LevelPlayBannerVAlign
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

enum LevelPlayError
{
    Ok = 0,
    NotInitialized = 1,
    AdNotReady = 2,
    PlacementCapped = 3,
    ActivityUnavailable = 4,
    RootViewUnavailable = 5,
    MissingAppKey = 6,
    InvalidHandle = 7
}

// #####################################################################
// # Constructors
// #####################################################################

/**
 * @returns {Struct.LevelPlayResult}
 */
function LevelPlayResult() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1550743218;

    self.success = undefined;
    self.error_message = undefined;
    self.sdk_error_code = undefined;

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

// #####################################################################
// # Codecs
// #####################################################################

/**
 * @func __LevelPlayResult_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.LevelPlayResult} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __LevelPlayResult_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: success, type: Bool
        if (!is_bool(self.success)) show_error($"{_where} :: self.success expected bool", true);
        buffer_write(_buffer, buffer_bool, self.success);

        // field: error_message, type: optional<String>
        if (is_undefined(self.error_message))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.error_message)) show_error($"{_where} :: self.error_message expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.error_message));
            buffer_write(_buffer, buffer_string, self.error_message);
        }

        // field: sdk_error_code, type: optional<Int32>
        if (is_undefined(self.sdk_error_code))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_numeric(self.sdk_error_code)) show_error($"{_where} :: self.sdk_error_code expected number", true);
            buffer_write(_buffer, buffer_s32, self.sdk_error_code);
        }

    }
}

/**
 * @func __LevelPlayResult_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.LevelPlayResult}
 * @ignore
 */
function __LevelPlayResult_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new LevelPlayResult();
    with (_inst)
    {
        // field: success, type: Bool
        self.success = buffer_read(_buffer, buffer_bool);

        // field: error_message, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.error_message = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.error_message = undefined;
        }

        // field: sdk_error_code, type: optional<Int32>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.sdk_error_code = buffer_read(_buffer, buffer_s32);
        }
        else
        {
            self.sdk_error_code = undefined;
        }

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

        // field: format, type: optional<String>
        if (is_undefined(self.format))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.format)) show_error($"{_where} :: self.format expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.format));
            buffer_write(_buffer, buffer_string, self.format);
        }

        // field: network, type: optional<String>
        if (is_undefined(self.network))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.network)) show_error($"{_where} :: self.network expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.network));
            buffer_write(_buffer, buffer_string, self.network);
        }

        // field: unit_id, type: optional<String>
        if (is_undefined(self.unit_id))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.unit_id)) show_error($"{_where} :: self.unit_id expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.unit_id));
            buffer_write(_buffer, buffer_string, self.unit_id);
        }

        // field: unit_name, type: optional<String>
        if (is_undefined(self.unit_name))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.unit_name)) show_error($"{_where} :: self.unit_name expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.unit_name));
            buffer_write(_buffer, buffer_string, self.unit_name);
        }

        // field: placement_name, type: optional<String>
        if (is_undefined(self.placement_name))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.placement_name)) show_error($"{_where} :: self.placement_name expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.placement_name));
            buffer_write(_buffer, buffer_string, self.placement_name);
        }

        // field: country, type: optional<String>
        if (is_undefined(self.country))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.country)) show_error($"{_where} :: self.country expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.country));
            buffer_write(_buffer, buffer_string, self.country);
        }

        // field: precision, type: optional<String>
        if (is_undefined(self.precision))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.precision)) show_error($"{_where} :: self.precision expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.precision));
            buffer_write(_buffer, buffer_string, self.precision);
        }

        // field: revenue, type: optional<Float64>
        if (is_undefined(self.revenue))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_numeric(self.revenue)) show_error($"{_where} :: self.revenue expected number", true);
            buffer_write(_buffer, buffer_f64, self.revenue);
        }

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

        // field: format, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.format = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.format = undefined;
        }

        // field: network, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.network = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.network = undefined;
        }

        // field: unit_id, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.unit_id = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.unit_id = undefined;
        }

        // field: unit_name, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.unit_name = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.unit_name = undefined;
        }

        // field: placement_name, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.placement_name = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.placement_name = undefined;
        }

        // field: country, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.country = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.country = undefined;
        }

        // field: precision, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.precision = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.precision = undefined;
        }

        // field: revenue, type: optional<Float64>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.revenue = buffer_read(_buffer, buffer_f64);
        }
        else
        {
            self.revenue = undefined;
        }

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

// #####################################################################
// # Functions
// #####################################################################

/**
 * @param {Function} _callback
 * @returns {Enum.LevelPlayError}
 */
function levelplay_init(_callback)
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMLevelPlay_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var __ret_buffer = __ext_core_get_ret_buffer();

    var __return_value__ = __levelplay_init(buffer_get_address(__args_buffer), buffer_tell(__args_buffer), buffer_get_address(__ret_buffer), buffer_get_size(__ret_buffer));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer, buffer_s32);
    return __result__;
}

// Skipping function levelplay_is_initialized (no wrapper is required)


// Skipping function levelplay_set_consent (no wrapper is required)


// Skipping function levelplay_set_metadata (no wrapper is required)


// Skipping function levelplay_set_dynamic_user_id (no wrapper is required)


// Skipping function levelplay_launch_test_suite (no wrapper is required)


/**
 * @param {String} _ad_unit_id
 * @param {Function} _callback
 * @returns {Real}
 */
function levelplay_interstitial_create(_ad_unit_id, _callback)
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMLevelPlay_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _ad_unit_id, type: String
    if (!is_string(_ad_unit_id)) show_error($"{_GMFUNCTION_} :: _ad_unit_id expected string", true);
    buffer_write(__args_buffer, buffer_u32, string_byte_length(_ad_unit_id));
    buffer_write(__args_buffer, buffer_string, _ad_unit_id);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var __ret_buffer = __ext_core_get_ret_buffer();

    var __return_value__ = __levelplay_interstitial_create(buffer_get_address(__args_buffer), buffer_tell(__args_buffer), buffer_get_address(__ret_buffer), buffer_get_size(__ret_buffer));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _handle
 * @returns {Enum.LevelPlayError}
 */
function levelplay_interstitial_load(_handle)
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _handle, type: UInt64
    if (!is_numeric(_handle)) show_error($"{_GMFUNCTION_} :: _handle expected number", true);
    buffer_write(__args_buffer, buffer_u64, _handle);

    var __ret_buffer = __ext_core_get_ret_buffer();

    var __return_value__ = __levelplay_interstitial_load(buffer_get_address(__args_buffer), buffer_tell(__args_buffer), buffer_get_address(__ret_buffer), buffer_get_size(__ret_buffer));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer, buffer_s32);
    return __result__;
}

/**
 * @param {Real} _handle
 * @param {Function} _callback
 * @returns {Enum.LevelPlayError}
 */
function levelplay_interstitial_set_callback(_handle, _callback)
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMLevelPlay_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _handle, type: UInt64
    if (!is_numeric(_handle)) show_error($"{_GMFUNCTION_} :: _handle expected number", true);
    buffer_write(__args_buffer, buffer_u64, _handle);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var __ret_buffer = __ext_core_get_ret_buffer();

    var __return_value__ = __levelplay_interstitial_set_callback(buffer_get_address(__args_buffer), buffer_tell(__args_buffer), buffer_get_address(__ret_buffer), buffer_get_size(__ret_buffer));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer, buffer_s32);
    return __result__;
}

/**
 * @param {Real} _handle
 * @returns {Bool}
 */
function levelplay_interstitial_is_ready(_handle)
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _handle, type: UInt64
    if (!is_numeric(_handle)) show_error($"{_GMFUNCTION_} :: _handle expected number", true);
    buffer_write(__args_buffer, buffer_u64, _handle);

    var __return_value__ = __levelplay_interstitial_is_ready(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return __return_value__;
}

// Skipping function levelplay_interstitial_is_placement_capped (no wrapper is required)


/**
 * @param {Real} _handle
 * @param {String} _placement_id
 * @returns {Enum.LevelPlayError}
 */
function levelplay_interstitial_show(_handle, _placement_id)
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _handle, type: UInt64
    if (!is_numeric(_handle)) show_error($"{_GMFUNCTION_} :: _handle expected number", true);
    buffer_write(__args_buffer, buffer_u64, _handle);

    // param: _placement_id, type: optional<String>
    if (is_undefined(_placement_id))
    {
        buffer_write(__args_buffer, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer, buffer_bool, true);
        if (!is_string(_placement_id)) show_error($"{_GMFUNCTION_} :: _placement_id expected string", true);
        buffer_write(__args_buffer, buffer_u32, string_byte_length(_placement_id));
        buffer_write(__args_buffer, buffer_string, _placement_id);
    }

    var __ret_buffer = __ext_core_get_ret_buffer();

    var __return_value__ = __levelplay_interstitial_show(buffer_get_address(__args_buffer), buffer_tell(__args_buffer), buffer_get_address(__ret_buffer), buffer_get_size(__ret_buffer));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer, buffer_s32);
    return __result__;
}

/**
 * @param {Real} _handle
 */
function levelplay_interstitial_destroy(_handle)
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _handle, type: UInt64
    if (!is_numeric(_handle)) show_error($"{_GMFUNCTION_} :: _handle expected number", true);
    buffer_write(__args_buffer, buffer_u64, _handle);

    var __return_value__ = __levelplay_interstitial_destroy(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return __return_value__;
}

/**
 * @returns {Array[Real]}
 */
function levelplay_interstitial_get_live_handles()
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __ret_buffer = __ext_core_get_ret_buffer();

    var __return_value__ = __levelplay_interstitial_get_live_handles(buffer_get_address(__ret_buffer), buffer_get_size(__ret_buffer));

    var __result__ = undefined;
    var __length__ = buffer_read(__ret_buffer, buffer_u32);
    __result__ = array_create(__length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        __result__[_i] = buffer_read(__ret_buffer, buffer_u64);
    }
    return __result__;
}

/**
 * @param {String} _ad_unit_id
 * @param {Function} _callback
 * @returns {Real}
 */
function levelplay_rewarded_video_create(_ad_unit_id, _callback)
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMLevelPlay_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _ad_unit_id, type: String
    if (!is_string(_ad_unit_id)) show_error($"{_GMFUNCTION_} :: _ad_unit_id expected string", true);
    buffer_write(__args_buffer, buffer_u32, string_byte_length(_ad_unit_id));
    buffer_write(__args_buffer, buffer_string, _ad_unit_id);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var __ret_buffer = __ext_core_get_ret_buffer();

    var __return_value__ = __levelplay_rewarded_video_create(buffer_get_address(__args_buffer), buffer_tell(__args_buffer), buffer_get_address(__ret_buffer), buffer_get_size(__ret_buffer));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _handle
 * @returns {Enum.LevelPlayError}
 */
function levelplay_rewarded_video_load(_handle)
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _handle, type: UInt64
    if (!is_numeric(_handle)) show_error($"{_GMFUNCTION_} :: _handle expected number", true);
    buffer_write(__args_buffer, buffer_u64, _handle);

    var __ret_buffer = __ext_core_get_ret_buffer();

    var __return_value__ = __levelplay_rewarded_video_load(buffer_get_address(__args_buffer), buffer_tell(__args_buffer), buffer_get_address(__ret_buffer), buffer_get_size(__ret_buffer));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer, buffer_s32);
    return __result__;
}

/**
 * @param {Real} _handle
 * @param {Function} _callback
 * @returns {Enum.LevelPlayError}
 */
function levelplay_rewarded_video_set_callback(_handle, _callback)
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMLevelPlay_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _handle, type: UInt64
    if (!is_numeric(_handle)) show_error($"{_GMFUNCTION_} :: _handle expected number", true);
    buffer_write(__args_buffer, buffer_u64, _handle);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var __ret_buffer = __ext_core_get_ret_buffer();

    var __return_value__ = __levelplay_rewarded_video_set_callback(buffer_get_address(__args_buffer), buffer_tell(__args_buffer), buffer_get_address(__ret_buffer), buffer_get_size(__ret_buffer));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer, buffer_s32);
    return __result__;
}

/**
 * @param {Real} _handle
 * @returns {Bool}
 */
function levelplay_rewarded_video_is_ready(_handle)
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _handle, type: UInt64
    if (!is_numeric(_handle)) show_error($"{_GMFUNCTION_} :: _handle expected number", true);
    buffer_write(__args_buffer, buffer_u64, _handle);

    var __return_value__ = __levelplay_rewarded_video_is_ready(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return __return_value__;
}

// Skipping function levelplay_rewarded_video_is_placement_capped (no wrapper is required)


/**
 * @param {Real} _handle
 * @param {String} _placement_id
 * @returns {Enum.LevelPlayError}
 */
function levelplay_rewarded_video_show(_handle, _placement_id)
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _handle, type: UInt64
    if (!is_numeric(_handle)) show_error($"{_GMFUNCTION_} :: _handle expected number", true);
    buffer_write(__args_buffer, buffer_u64, _handle);

    // param: _placement_id, type: optional<String>
    if (is_undefined(_placement_id))
    {
        buffer_write(__args_buffer, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer, buffer_bool, true);
        if (!is_string(_placement_id)) show_error($"{_GMFUNCTION_} :: _placement_id expected string", true);
        buffer_write(__args_buffer, buffer_u32, string_byte_length(_placement_id));
        buffer_write(__args_buffer, buffer_string, _placement_id);
    }

    var __ret_buffer = __ext_core_get_ret_buffer();

    var __return_value__ = __levelplay_rewarded_video_show(buffer_get_address(__args_buffer), buffer_tell(__args_buffer), buffer_get_address(__ret_buffer), buffer_get_size(__ret_buffer));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer, buffer_s32);
    return __result__;
}

/**
 * @param {Real} _handle
 */
function levelplay_rewarded_video_destroy(_handle)
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _handle, type: UInt64
    if (!is_numeric(_handle)) show_error($"{_GMFUNCTION_} :: _handle expected number", true);
    buffer_write(__args_buffer, buffer_u64, _handle);

    var __return_value__ = __levelplay_rewarded_video_destroy(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return __return_value__;
}

/**
 * @returns {Array[Real]}
 */
function levelplay_rewarded_video_get_live_handles()
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __ret_buffer = __ext_core_get_ret_buffer();

    var __return_value__ = __levelplay_rewarded_video_get_live_handles(buffer_get_address(__ret_buffer), buffer_get_size(__ret_buffer));

    var __result__ = undefined;
    var __length__ = buffer_read(__ret_buffer, buffer_u32);
    __result__ = array_create(__length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        __result__[_i] = buffer_read(__ret_buffer, buffer_u64);
    }
    return __result__;
}

/**
 * @param {String} _ad_unit_id
 * @param {Enum.LevelPlayBannerSize} _size
 * @param {Enum.LevelPlayBannerHAlign} _align_h
 * @param {Enum.LevelPlayBannerVAlign} _align_v
 * @returns {Enum.LevelPlayError}
 */
function levelplay_banner_create(_ad_unit_id, _size, _align_h, _align_v)
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _ad_unit_id, type: String
    if (!is_string(_ad_unit_id)) show_error($"{_GMFUNCTION_} :: _ad_unit_id expected string", true);
    buffer_write(__args_buffer, buffer_u32, string_byte_length(_ad_unit_id));
    buffer_write(__args_buffer, buffer_string, _ad_unit_id);

    // param: _size, type: enum LevelPlayBannerSize

    if (!is_numeric(_size)) show_error($"{_GMFUNCTION_} :: _size expected number", true);
    buffer_write(__args_buffer, buffer_u32, _size);

    // param: _align_h, type: enum LevelPlayBannerHAlign

    if (!is_numeric(_align_h)) show_error($"{_GMFUNCTION_} :: _align_h expected number", true);
    buffer_write(__args_buffer, buffer_u32, _align_h);

    // param: _align_v, type: enum LevelPlayBannerVAlign

    if (!is_numeric(_align_v)) show_error($"{_GMFUNCTION_} :: _align_v expected number", true);
    buffer_write(__args_buffer, buffer_u32, _align_v);

    var __ret_buffer = __ext_core_get_ret_buffer();

    var __return_value__ = __levelplay_banner_create(buffer_get_address(__args_buffer), buffer_tell(__args_buffer), buffer_get_address(__ret_buffer), buffer_get_size(__ret_buffer));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer, buffer_s32);
    return __result__;
}

/**
 * @param {Enum.LevelPlayBannerHAlign} _align_h
 * @param {Enum.LevelPlayBannerVAlign} _align_v
 */
function levelplay_banner_move(_align_h, _align_v)
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _align_h, type: enum LevelPlayBannerHAlign

    if (!is_numeric(_align_h)) show_error($"{_GMFUNCTION_} :: _align_h expected number", true);
    buffer_write(__args_buffer, buffer_u32, _align_h);

    // param: _align_v, type: enum LevelPlayBannerVAlign

    if (!is_numeric(_align_v)) show_error($"{_GMFUNCTION_} :: _align_v expected number", true);
    buffer_write(__args_buffer, buffer_u32, _align_v);

    var __return_value__ = __levelplay_banner_move(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return __return_value__;
}

// Skipping function levelplay_banner_destroy (no wrapper is required)


/**
 * @param {Function} _callback
 */
function levelplay_banner_callback_subscribe(_callback)
{
    var __available__ = __GMLevelPlay_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMLevelPlay_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var __return_value__ = __levelplay_banner_callback_subscribe(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return __return_value__;
}

/// @ignore
function __GMLevelPlay_get_decoders()
{
    static __decoders__ = [
        __LevelPlayResult_decode,
        __LevelPlayAdInfo_decode,
        __LevelPlayReward_decode
    ];
    return __decoders__;
}
/// @ignore
function __GMLevelPlay_get_dispatcher()
{
    static __dispatcher__ = new __GMNativeFunctionDispatcher(__GMLevelPlay_invocation_handler, __GMLevelPlay_get_decoders());
    return __dispatcher__;
}
/// @ignore
function __GMLevelPlay_is_available()
{
    static __available__ = extension_exists("GMLevelPlay");
    return __available__;
}
