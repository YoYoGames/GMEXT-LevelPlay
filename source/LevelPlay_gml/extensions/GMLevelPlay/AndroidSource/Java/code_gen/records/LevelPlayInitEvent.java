// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record LevelPlayInitEvent(String type, boolean success, java.util.Optional<String> message) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 0;
    @Override
    public void encode(ByteBuffer b)
    {
        LevelPlayInitEventCodec.write(b, this);
    }
}
