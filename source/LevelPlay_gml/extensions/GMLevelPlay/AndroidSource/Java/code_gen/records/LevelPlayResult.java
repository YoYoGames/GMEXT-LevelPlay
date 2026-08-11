// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record LevelPlayResult(boolean success, java.util.Optional<String> error_message, java.util.Optional<Integer> sdk_error_code) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 0;
    @Override
    public void encode(GMExtWire.IByteWriter b)
    {
        LevelPlayResultCodec.write(b, this);
    }
}
