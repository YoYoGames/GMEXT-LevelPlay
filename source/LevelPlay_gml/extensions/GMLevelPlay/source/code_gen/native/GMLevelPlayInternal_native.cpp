// ##### extgen :: Auto-generated file do not edit!! #####

#include "GMLevelPlayInternal_native.h"
#include "GMLevelPlayInternal_exports.h"

using namespace gm_structs;
using namespace gm::wire::codec;

static gm::runtime::DispatchQueue __dispatch_queue;

// Internal function used for fetching dispatched function calls to GML
GMEXPORT double __EXT_NATIVE__GMLevelPlay_invocation_handler(char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferWriter __bw{ __ret_buffer, static_cast<size_t>(__ret_buffer_length) };
    return __dispatch_queue.fetch(__bw);
}

GMEXPORT double __EXT_NATIVE__levelplay_init(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    auto&& __result = levelplay_init(callback);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: enum LevelPlayError
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_is_initialized()
{
    auto&& __result = levelplay_is_initialized();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__levelplay_set_consent(double enable)
{
    levelplay_set_consent(static_cast<bool>(enable));
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_set_metadata(char* key, char* value)
{
    levelplay_set_metadata(key, value);
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_set_dynamic_user_id(char* user_id)
{
    levelplay_set_dynamic_user_id(user_id);
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_launch_test_suite()
{
    levelplay_launch_test_suite();
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_interstitial_create(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ad_unit_id, type: String
    std::string_view ad_unit_id = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    auto&& __result = levelplay_interstitial_create(ad_unit_id, callback);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_interstitial_load(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: handle, type: UInt64
    std::uint64_t handle = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = levelplay_interstitial_load(handle);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: enum LevelPlayError
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_interstitial_set_callback(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: handle, type: UInt64
    std::uint64_t handle = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    auto&& __result = levelplay_interstitial_set_callback(handle, callback);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: enum LevelPlayError
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_interstitial_is_ready(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: handle, type: UInt64
    std::uint64_t handle = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = levelplay_interstitial_is_ready(handle);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__levelplay_interstitial_is_placement_capped(char* placement_id)
{
    auto&& __result = levelplay_interstitial_is_placement_capped(placement_id);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__levelplay_interstitial_show(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: handle, type: UInt64
    std::uint64_t handle = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: placement_id, type: optional<String>
    std::optional<std::string_view> placement_id = gm::wire::codec::readOptional<std::string_view>(__br);

    auto&& __result = levelplay_interstitial_show(handle, placement_id);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: enum LevelPlayError
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_interstitial_destroy(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: handle, type: UInt64
    std::uint64_t handle = gm::wire::codec::readValue<std::uint64_t>(__br);

    levelplay_interstitial_destroy(handle);
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_interstitial_get_live_handles(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = levelplay_interstitial_get_live_handles();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64[]
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_create(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ad_unit_id, type: String
    std::string_view ad_unit_id = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    auto&& __result = levelplay_rewarded_video_create(ad_unit_id, callback);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_load(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: handle, type: UInt64
    std::uint64_t handle = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = levelplay_rewarded_video_load(handle);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: enum LevelPlayError
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_set_callback(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: handle, type: UInt64
    std::uint64_t handle = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    auto&& __result = levelplay_rewarded_video_set_callback(handle, callback);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: enum LevelPlayError
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_is_ready(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: handle, type: UInt64
    std::uint64_t handle = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = levelplay_rewarded_video_is_ready(handle);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_is_placement_capped(char* placement_id)
{
    auto&& __result = levelplay_rewarded_video_is_placement_capped(placement_id);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_show(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: handle, type: UInt64
    std::uint64_t handle = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: placement_id, type: optional<String>
    std::optional<std::string_view> placement_id = gm::wire::codec::readOptional<std::string_view>(__br);

    auto&& __result = levelplay_rewarded_video_show(handle, placement_id);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: enum LevelPlayError
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_destroy(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: handle, type: UInt64
    std::uint64_t handle = gm::wire::codec::readValue<std::uint64_t>(__br);

    levelplay_rewarded_video_destroy(handle);
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_get_live_handles(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = levelplay_rewarded_video_get_live_handles();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64[]
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_banner_create(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ad_unit_id, type: String
    std::string_view ad_unit_id = gm::wire::codec::readValue<std::string_view>(__br);

    // field: size, type: enum LevelPlayBannerSize
    gm_enums::LevelPlayBannerSize size = gm::wire::codec::readValue<gm_enums::LevelPlayBannerSize>(__br);

    // field: align_h, type: enum LevelPlayBannerHAlign
    gm_enums::LevelPlayBannerHAlign align_h = gm::wire::codec::readValue<gm_enums::LevelPlayBannerHAlign>(__br);

    // field: align_v, type: enum LevelPlayBannerVAlign
    gm_enums::LevelPlayBannerVAlign align_v = gm::wire::codec::readValue<gm_enums::LevelPlayBannerVAlign>(__br);

    auto&& __result = levelplay_banner_create(ad_unit_id, size, align_h, align_v);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: enum LevelPlayError
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_banner_move(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: align_h, type: enum LevelPlayBannerHAlign
    gm_enums::LevelPlayBannerHAlign align_h = gm::wire::codec::readValue<gm_enums::LevelPlayBannerHAlign>(__br);

    // field: align_v, type: enum LevelPlayBannerVAlign
    gm_enums::LevelPlayBannerVAlign align_v = gm::wire::codec::readValue<gm_enums::LevelPlayBannerVAlign>(__br);

    levelplay_banner_move(align_h, align_v);
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_banner_destroy()
{
    levelplay_banner_destroy();
    return 0;
}

GMEXPORT double __EXT_NATIVE__levelplay_banner_callback_subscribe(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    levelplay_banner_callback_subscribe(callback);
    return 0;
}

