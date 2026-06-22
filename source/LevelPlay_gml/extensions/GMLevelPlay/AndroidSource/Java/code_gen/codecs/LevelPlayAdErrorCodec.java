// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.records.*;

public final class LevelPlayAdErrorCodec {
    private LevelPlayAdErrorCodec()
    {
    }
    public static LevelPlayAdError read(ByteBuffer b)
    {
        String message = GMExtWire.readString(b);

        int error_code = GMExtWire.readI32(b);

        String error_message = GMExtWire.readString(b);

        return new LevelPlayAdError(message, error_code, error_message);
    }

    public static void write(ByteBuffer b, LevelPlayAdError obj)
    {
        GMExtWire.writeString(b, obj.message());

        GMExtWire.writeI32(b, obj.error_code());

        GMExtWire.writeString(b, obj.error_message());

    }
}