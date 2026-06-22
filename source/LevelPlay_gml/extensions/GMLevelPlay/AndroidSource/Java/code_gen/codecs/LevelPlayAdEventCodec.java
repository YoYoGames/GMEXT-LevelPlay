// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import ${YYAndroidPackageName}.records.*;

public final class LevelPlayAdEventCodec {
    private LevelPlayAdEventCodec()
    {
    }
    public static LevelPlayAdEvent read(ByteBuffer b)
    {
        String type = GMExtWire.readString(b);

        java.util.Optional<String> message = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_message = GMExtWire.readString(b);
            message = java.util.Optional.of(__opt_message);
        }

        java.util.Optional<LevelPlayAdInfo> ad_info = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            LevelPlayAdInfo __opt_ad_info = LevelPlayAdInfoCodec.read(b);
            ad_info = java.util.Optional.of(__opt_ad_info);
        }

        java.util.Optional<LevelPlayAdError> error = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            LevelPlayAdError __opt_error = LevelPlayAdErrorCodec.read(b);
            error = java.util.Optional.of(__opt_error);
        }

        java.util.Optional<LevelPlayReward> reward = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            LevelPlayReward __opt_reward = LevelPlayRewardCodec.read(b);
            reward = java.util.Optional.of(__opt_reward);
        }

        return new LevelPlayAdEvent(type, message, ad_info, error, reward);
    }

    public static void write(ByteBuffer b, LevelPlayAdEvent obj)
    {
        GMExtWire.writeString(b, obj.type());

        GMExtWire.writeBool(b, obj.message() != null && obj.message().isPresent());
        if (obj.message() != null && obj.message().isPresent())
        {
            GMExtWire.writeString(b, obj.message().get());
        }

        GMExtWire.writeBool(b, obj.ad_info() != null && obj.ad_info().isPresent());
        if (obj.ad_info() != null && obj.ad_info().isPresent())
        {
            LevelPlayAdInfoCodec.write(b, obj.ad_info().get());
        }

        GMExtWire.writeBool(b, obj.error() != null && obj.error().isPresent());
        if (obj.error() != null && obj.error().isPresent())
        {
            LevelPlayAdErrorCodec.write(b, obj.error().get());
        }

        GMExtWire.writeBool(b, obj.reward() != null && obj.reward().isPresent());
        if (obj.reward() != null && obj.reward().isPresent())
        {
            LevelPlayRewardCodec.write(b, obj.reward().get());
        }

    }
}