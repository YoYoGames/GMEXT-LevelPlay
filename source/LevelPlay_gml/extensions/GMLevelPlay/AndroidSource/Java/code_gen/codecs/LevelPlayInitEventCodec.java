// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import ${YYAndroidPackageName}.records.*;

public final class LevelPlayInitEventCodec {
    private LevelPlayInitEventCodec()
    {
    }
    public static LevelPlayInitEvent read(ByteBuffer b)
    {
        String type = GMExtWire.readString(b);

        boolean success = GMExtWire.readBool(b);

        java.util.Optional<String> message = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_message = GMExtWire.readString(b);
            message = java.util.Optional.of(__opt_message);
        }

        return new LevelPlayInitEvent(type, success, message);
    }

    public static void write(ByteBuffer b, LevelPlayInitEvent obj)
    {
        GMExtWire.writeString(b, obj.type());

        GMExtWire.writeBool(b, obj.success());

        GMExtWire.writeBool(b, obj.message() != null && obj.message().isPresent());
        if (obj.message() != null && obj.message().isPresent())
        {
            GMExtWire.writeString(b, obj.message().get());
        }

    }
}