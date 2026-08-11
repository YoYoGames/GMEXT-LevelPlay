// ##### extgen :: Auto-generated file do not edit!! #####

#pragma once
#import <Foundation/Foundation.h>

#include <cstdint>
#include <string_view>
#include <vector>
#include <array>
#include <optional>
#include "core/GMExtWire.h"

namespace gm_consts
{
}


namespace gm_enums
{
    enum class LevelPlayBannerSize : std::uint32_t
    {
        Banner = 0,
        Large = 1,
        MediumRectangle = 2,
        Adaptive = 3
    };

    enum class LevelPlayBannerHAlign : std::uint32_t
    {
        Left = 0,
        Center = 1,
        Right = 2
    };

    enum class LevelPlayBannerVAlign : std::uint32_t
    {
        Top = 0,
        Center = 1,
        Bottom = 2
    };

    enum class LevelPlayCallbackEvent : std::uint32_t
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
    };

    enum class LevelPlayError : std::int32_t
    {
        Ok = 0,
        NotInitialized = 1,
        AdNotInitialized = 2,
        AdNotReady = 3,
        PlacementCapped = 4,
        ActivityUnavailable = 5,
        RootViewUnavailable = 6,
        MissingAppKey = 7
    };

}


namespace gm_structs
{
    struct LevelPlayResult;
    struct LevelPlayAdInfo;
    struct LevelPlayReward;

    struct LevelPlayResult
    {
        bool success;
        std::optional<std::string> error_message;
        std::optional<std::int32_t> sdk_error_code;
    };

    struct LevelPlayAdInfo
    {
        std::int32_t width;
        std::int32_t height;
        std::optional<std::string> format;
        std::optional<std::string> network;
        std::optional<std::string> unit_id;
        std::optional<std::string> unit_name;
        std::optional<std::string> placement_name;
        std::optional<std::string> country;
        std::optional<std::string> precision;
        std::optional<double> revenue;
    };

    struct LevelPlayReward
    {
        std::string name;
        std::int32_t amount;
    };

}

namespace gm::wire::codec
{
    template<>
    inline void writeValue<gm_structs::LevelPlayResult>(gm::byteio::IByteWriter& _buf, const gm_structs::LevelPlayResult& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.success);
        gm::wire::codec::writeValue(_buf, obj.error_message);
        gm::wire::codec::writeValue(_buf, obj.sdk_error_code);
    }

    template<>
    inline gm_structs::LevelPlayResult readValue<gm_structs::LevelPlayResult>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::LevelPlayResult obj;
        obj.success = gm::wire::codec::readValue<bool>(_buf);
        obj.error_message = gm::wire::codec::readOptional<std::string>(_buf);
        obj.sdk_error_code = gm::wire::codec::readOptional<std::int32_t>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::LevelPlayAdInfo>(gm::byteio::IByteWriter& _buf, const gm_structs::LevelPlayAdInfo& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.width);
        gm::wire::codec::writeValue(_buf, obj.height);
        gm::wire::codec::writeValue(_buf, obj.format);
        gm::wire::codec::writeValue(_buf, obj.network);
        gm::wire::codec::writeValue(_buf, obj.unit_id);
        gm::wire::codec::writeValue(_buf, obj.unit_name);
        gm::wire::codec::writeValue(_buf, obj.placement_name);
        gm::wire::codec::writeValue(_buf, obj.country);
        gm::wire::codec::writeValue(_buf, obj.precision);
        gm::wire::codec::writeValue(_buf, obj.revenue);
    }

    template<>
    inline gm_structs::LevelPlayAdInfo readValue<gm_structs::LevelPlayAdInfo>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::LevelPlayAdInfo obj;
        obj.width = gm::wire::codec::readValue<std::int32_t>(_buf);
        obj.height = gm::wire::codec::readValue<std::int32_t>(_buf);
        obj.format = gm::wire::codec::readOptional<std::string>(_buf);
        obj.network = gm::wire::codec::readOptional<std::string>(_buf);
        obj.unit_id = gm::wire::codec::readOptional<std::string>(_buf);
        obj.unit_name = gm::wire::codec::readOptional<std::string>(_buf);
        obj.placement_name = gm::wire::codec::readOptional<std::string>(_buf);
        obj.country = gm::wire::codec::readOptional<std::string>(_buf);
        obj.precision = gm::wire::codec::readOptional<std::string>(_buf);
        obj.revenue = gm::wire::codec::readOptional<double>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::LevelPlayReward>(gm::byteio::IByteWriter& _buf, const gm_structs::LevelPlayReward& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.name);
        gm::wire::codec::writeValue(_buf, obj.amount);
    }

    template<>
    inline gm_structs::LevelPlayReward readValue<gm_structs::LevelPlayReward>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::LevelPlayReward obj;
        obj.name = gm::wire::codec::readValue<std::string>(_buf);
        obj.amount = gm::wire::codec::readValue<std::int32_t>(_buf);
        return obj;
    }

}

namespace gm::wire::details
{
    template<>
    struct gm_struct_traits<gm_structs::LevelPlayResult>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 0;
    };

    template<>
    struct gm_struct_traits<gm_structs::LevelPlayAdInfo>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 1;
    };

    template<>
    struct gm_struct_traits<gm_structs::LevelPlayReward>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 2;
    };

}

@protocol GMLevelPlayInterface <NSObject>
- (gm_enums::LevelPlayError)levelplay_init:(gm::wire::GMFunction)callback;
- (bool)levelplay_is_initialized;
- (void)levelplay_set_consent:(bool)enable;
- (void)levelplay_set_metadata:(std::string_view)key value:(std::string_view)value;
- (void)levelplay_set_dynamic_user_id:(std::string_view)user_id;
- (void)levelplay_launch_test_suite;
- (void)levelplay_interstitial_init:(std::string_view)ad_unit_id;
- (gm_enums::LevelPlayError)levelplay_interstitial_load;
- (bool)levelplay_interstitial_is_ready;
- (bool)levelplay_interstitial_is_placement_capped:(std::string_view)placement_id;
- (gm_enums::LevelPlayError)levelplay_interstitial_show:(std::string_view)placement_id;
- (void)levelplay_interstitial_callback_subscribe:(gm::wire::GMFunction)callback;
- (void)levelplay_rewarded_video_init:(std::string_view)ad_unit_id;
- (gm_enums::LevelPlayError)levelplay_rewarded_video_load;
- (bool)levelplay_rewarded_video_is_ready;
- (bool)levelplay_rewarded_video_is_placement_capped:(std::string_view)placement_id;
- (gm_enums::LevelPlayError)levelplay_rewarded_video_show:(std::string_view)placement_id;
- (void)levelplay_rewarded_callback_subscribe:(gm::wire::GMFunction)callback;
- (gm_enums::LevelPlayError)levelplay_banner_create:(std::string_view)ad_unit_id size:(gm_enums::LevelPlayBannerSize)size align_h:(gm_enums::LevelPlayBannerHAlign)align_h align_v:(gm_enums::LevelPlayBannerVAlign)align_v;
- (void)levelplay_banner_move:(gm_enums::LevelPlayBannerHAlign)align_h align_v:(gm_enums::LevelPlayBannerVAlign)align_v;
- (void)levelplay_banner_destroy;
- (void)levelplay_banner_callback_subscribe:(gm::wire::GMFunction)callback;
@end


@interface GMLevelPlayInternal : NSObject
- (double)__EXT_NATIVE__levelplay_init:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__levelplay_is_initialized;
- (double)__EXT_NATIVE__levelplay_set_consent:(double)enable;
- (double)__EXT_NATIVE__levelplay_set_metadata:(char*)key arg1:(char*)value;
- (double)__EXT_NATIVE__levelplay_set_dynamic_user_id:(char*)user_id;
- (double)__EXT_NATIVE__levelplay_launch_test_suite;
- (double)__EXT_NATIVE__levelplay_interstitial_init:(char*)ad_unit_id;
- (double)__EXT_NATIVE__levelplay_interstitial_load:(char*)__ret_buffer arg1:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__levelplay_interstitial_is_ready;
- (double)__EXT_NATIVE__levelplay_interstitial_is_placement_capped:(char*)placement_id;
- (double)__EXT_NATIVE__levelplay_interstitial_show:(char*)placement_id arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__levelplay_interstitial_callback_subscribe:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__levelplay_rewarded_video_init:(char*)ad_unit_id;
- (double)__EXT_NATIVE__levelplay_rewarded_video_load:(char*)__ret_buffer arg1:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__levelplay_rewarded_video_is_ready;
- (double)__EXT_NATIVE__levelplay_rewarded_video_is_placement_capped:(char*)placement_id;
- (double)__EXT_NATIVE__levelplay_rewarded_video_show:(char*)placement_id arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__levelplay_rewarded_callback_subscribe:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__levelplay_banner_create:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__levelplay_banner_move:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__levelplay_banner_destroy;
- (double)__EXT_NATIVE__levelplay_banner_callback_subscribe:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__GMLevelPlay_invocation_handler:(char*)__ret_buffer arg1:(double)__ret_buffer_length;
@end


