// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName};

import java.nio.ByteBuffer;
import java.util.*;
import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.GMExtWire.GMFunction;
import ${YYAndroidPackageName}.GMExtWire.GMValue;
import ${YYAndroidPackageName}.records.*;
import ${YYAndroidPackageName}.codecs.*;
import ${YYAndroidPackageName}.enums.*;

public abstract class GMLevelPlayInternal extends RunnerSocial implements GMLevelPlayInterface {

    private final GMExtWire.DispatchQueue __dispatch_queue = new GMExtWire.DispatchQueue();
    public double __EXT_NATIVE__GMLevelPlay_invocation_handler(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __dispatch_queue.fetch(__ret_buffer);
    }

    public double __EXT_NATIVE__levelplay_init(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        LevelPlayError __result = levelplay_init(callback);

        GMExtWire.order(__ret_buffer);
        GMExtWire.IByteWriter __ret_buffer_writer = new GMExtWire.GMBufferWriter(__ret_buffer);
        // return: __result, type: enum LevelPlayError
        GMExtWire.writeI32(__ret_buffer_writer, __result.value());

        return 0;
    }

    public double __EXT_NATIVE__levelplay_is_initialized()
    {
        boolean __result = levelplay_is_initialized();
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__levelplay_set_consent(double enable)
    {
        levelplay_set_consent(enable != 0);
        return 0;
    }

    public double __EXT_NATIVE__levelplay_set_metadata(String key, String value)
    {
        levelplay_set_metadata(key, value);
        return 0;
    }

    public double __EXT_NATIVE__levelplay_set_dynamic_user_id(String user_id)
    {
        levelplay_set_dynamic_user_id(user_id);
        return 0;
    }

    public double __EXT_NATIVE__levelplay_launch_test_suite()
    {
        levelplay_launch_test_suite();
        return 0;
    }

    public double __EXT_NATIVE__levelplay_interstitial_create(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: ad_unit_id, type: String
        String ad_unit_id = GMExtWire.readString(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        long __result = levelplay_interstitial_create(ad_unit_id, callback);

        GMExtWire.order(__ret_buffer);
        GMExtWire.IByteWriter __ret_buffer_writer = new GMExtWire.GMBufferWriter(__ret_buffer);
        // return: __result, type: UInt64
        GMExtWire.writeI64(__ret_buffer_writer, __result);

        return (double)__result;
    }

    public double __EXT_NATIVE__levelplay_interstitial_load(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: handle, type: UInt64
        long handle = GMExtWire.readI64(__arg_buffer);

        LevelPlayError __result = levelplay_interstitial_load(handle);

        GMExtWire.order(__ret_buffer);
        GMExtWire.IByteWriter __ret_buffer_writer = new GMExtWire.GMBufferWriter(__ret_buffer);
        // return: __result, type: enum LevelPlayError
        GMExtWire.writeI32(__ret_buffer_writer, __result.value());

        return 0;
    }

    public double __EXT_NATIVE__levelplay_interstitial_set_callback(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: handle, type: UInt64
        long handle = GMExtWire.readI64(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        LevelPlayError __result = levelplay_interstitial_set_callback(handle, callback);

        GMExtWire.order(__ret_buffer);
        GMExtWire.IByteWriter __ret_buffer_writer = new GMExtWire.GMBufferWriter(__ret_buffer);
        // return: __result, type: enum LevelPlayError
        GMExtWire.writeI32(__ret_buffer_writer, __result.value());

        return 0;
    }

    public double __EXT_NATIVE__levelplay_interstitial_is_ready(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: handle, type: UInt64
        long handle = GMExtWire.readI64(__arg_buffer);

        boolean __result = levelplay_interstitial_is_ready(handle);
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__levelplay_interstitial_is_placement_capped(String placement_id)
    {
        boolean __result = levelplay_interstitial_is_placement_capped(placement_id);
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__levelplay_interstitial_show(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: handle, type: UInt64
        long handle = GMExtWire.readI64(__arg_buffer);

        // field: placement_id, type: optional<String>
        java.util.Optional<String> placement_id = java.util.Optional.empty();
        if (GMExtWire.readBool(__arg_buffer))
        {
            String __opt_placement_id = GMExtWire.readString(__arg_buffer);
            placement_id = java.util.Optional.of(__opt_placement_id);
        }

        LevelPlayError __result = levelplay_interstitial_show(handle, placement_id);

        GMExtWire.order(__ret_buffer);
        GMExtWire.IByteWriter __ret_buffer_writer = new GMExtWire.GMBufferWriter(__ret_buffer);
        // return: __result, type: enum LevelPlayError
        GMExtWire.writeI32(__ret_buffer_writer, __result.value());

        return 0;
    }

    public double __EXT_NATIVE__levelplay_interstitial_destroy(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: handle, type: UInt64
        long handle = GMExtWire.readI64(__arg_buffer);

        levelplay_interstitial_destroy(handle);
        return 0;
    }

    public double __EXT_NATIVE__levelplay_interstitial_get_live_handles(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        java.util.List<Long> __result = levelplay_interstitial_get_live_handles();

        GMExtWire.order(__ret_buffer);
        GMExtWire.IByteWriter __ret_buffer_writer = new GMExtWire.GMBufferWriter(__ret_buffer);
        // return: __result, type: UInt64[]
        GMExtWire.writeList(__ret_buffer_writer, __result, (bb, x) -> GMExtWire.writeI64(bb, x));

        return 0;
    }

    public double __EXT_NATIVE__levelplay_rewarded_video_create(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: ad_unit_id, type: String
        String ad_unit_id = GMExtWire.readString(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        long __result = levelplay_rewarded_video_create(ad_unit_id, callback);

        GMExtWire.order(__ret_buffer);
        GMExtWire.IByteWriter __ret_buffer_writer = new GMExtWire.GMBufferWriter(__ret_buffer);
        // return: __result, type: UInt64
        GMExtWire.writeI64(__ret_buffer_writer, __result);

        return (double)__result;
    }

    public double __EXT_NATIVE__levelplay_rewarded_video_load(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: handle, type: UInt64
        long handle = GMExtWire.readI64(__arg_buffer);

        LevelPlayError __result = levelplay_rewarded_video_load(handle);

        GMExtWire.order(__ret_buffer);
        GMExtWire.IByteWriter __ret_buffer_writer = new GMExtWire.GMBufferWriter(__ret_buffer);
        // return: __result, type: enum LevelPlayError
        GMExtWire.writeI32(__ret_buffer_writer, __result.value());

        return 0;
    }

    public double __EXT_NATIVE__levelplay_rewarded_video_set_callback(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: handle, type: UInt64
        long handle = GMExtWire.readI64(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        LevelPlayError __result = levelplay_rewarded_video_set_callback(handle, callback);

        GMExtWire.order(__ret_buffer);
        GMExtWire.IByteWriter __ret_buffer_writer = new GMExtWire.GMBufferWriter(__ret_buffer);
        // return: __result, type: enum LevelPlayError
        GMExtWire.writeI32(__ret_buffer_writer, __result.value());

        return 0;
    }

    public double __EXT_NATIVE__levelplay_rewarded_video_is_ready(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: handle, type: UInt64
        long handle = GMExtWire.readI64(__arg_buffer);

        boolean __result = levelplay_rewarded_video_is_ready(handle);
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__levelplay_rewarded_video_is_placement_capped(String placement_id)
    {
        boolean __result = levelplay_rewarded_video_is_placement_capped(placement_id);
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__levelplay_rewarded_video_show(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: handle, type: UInt64
        long handle = GMExtWire.readI64(__arg_buffer);

        // field: placement_id, type: optional<String>
        java.util.Optional<String> placement_id = java.util.Optional.empty();
        if (GMExtWire.readBool(__arg_buffer))
        {
            String __opt_placement_id = GMExtWire.readString(__arg_buffer);
            placement_id = java.util.Optional.of(__opt_placement_id);
        }

        LevelPlayError __result = levelplay_rewarded_video_show(handle, placement_id);

        GMExtWire.order(__ret_buffer);
        GMExtWire.IByteWriter __ret_buffer_writer = new GMExtWire.GMBufferWriter(__ret_buffer);
        // return: __result, type: enum LevelPlayError
        GMExtWire.writeI32(__ret_buffer_writer, __result.value());

        return 0;
    }

    public double __EXT_NATIVE__levelplay_rewarded_video_destroy(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: handle, type: UInt64
        long handle = GMExtWire.readI64(__arg_buffer);

        levelplay_rewarded_video_destroy(handle);
        return 0;
    }

    public double __EXT_NATIVE__levelplay_rewarded_video_get_live_handles(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        java.util.List<Long> __result = levelplay_rewarded_video_get_live_handles();

        GMExtWire.order(__ret_buffer);
        GMExtWire.IByteWriter __ret_buffer_writer = new GMExtWire.GMBufferWriter(__ret_buffer);
        // return: __result, type: UInt64[]
        GMExtWire.writeList(__ret_buffer_writer, __result, (bb, x) -> GMExtWire.writeI64(bb, x));

        return 0;
    }

    public double __EXT_NATIVE__levelplay_banner_create(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: ad_unit_id, type: String
        String ad_unit_id = GMExtWire.readString(__arg_buffer);

        // field: size, type: enum LevelPlayBannerSize
        LevelPlayBannerSize size = LevelPlayBannerSize.from(GMExtWire.readI32(__arg_buffer));

        // field: align_h, type: enum LevelPlayBannerHAlign
        LevelPlayBannerHAlign align_h = LevelPlayBannerHAlign.from(GMExtWire.readI32(__arg_buffer));

        // field: align_v, type: enum LevelPlayBannerVAlign
        LevelPlayBannerVAlign align_v = LevelPlayBannerVAlign.from(GMExtWire.readI32(__arg_buffer));

        LevelPlayError __result = levelplay_banner_create(ad_unit_id, size, align_h, align_v);

        GMExtWire.order(__ret_buffer);
        GMExtWire.IByteWriter __ret_buffer_writer = new GMExtWire.GMBufferWriter(__ret_buffer);
        // return: __result, type: enum LevelPlayError
        GMExtWire.writeI32(__ret_buffer_writer, __result.value());

        return 0;
    }

    public double __EXT_NATIVE__levelplay_banner_move(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: align_h, type: enum LevelPlayBannerHAlign
        LevelPlayBannerHAlign align_h = LevelPlayBannerHAlign.from(GMExtWire.readI32(__arg_buffer));

        // field: align_v, type: enum LevelPlayBannerVAlign
        LevelPlayBannerVAlign align_v = LevelPlayBannerVAlign.from(GMExtWire.readI32(__arg_buffer));

        levelplay_banner_move(align_h, align_v);
        return 0;
    }

    public double __EXT_NATIVE__levelplay_banner_destroy()
    {
        levelplay_banner_destroy();
        return 0;
    }

    public double __EXT_NATIVE__levelplay_banner_callback_subscribe(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        levelplay_banner_callback_subscribe(callback);
        return 0;
    }

}