// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record LevelPlayAdInfo(int width, int height, java.util.Optional<String> format, java.util.Optional<String> network, java.util.Optional<String> unit_id, java.util.Optional<String> unit_name, java.util.Optional<String> placement_name, java.util.Optional<String> country, java.util.Optional<String> precision, java.util.Optional<Double> revenue) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 1;
    @Override
    public void encode(GMExtWire.IByteWriter b)
    {
        LevelPlayAdInfoCodec.write(b, this);
    }
}
