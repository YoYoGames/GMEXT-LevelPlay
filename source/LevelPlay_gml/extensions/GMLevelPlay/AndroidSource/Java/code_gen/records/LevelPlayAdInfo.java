// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;

public record LevelPlayAdInfo(int width, int height, String format, String network, String unit_id, String unit_name, String placement_name, String country, String precision, double revenue) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 2;
    @Override
    public void encode(ByteBuffer b)
    {
        LevelPlayAdInfoCodec.write(b, this);
    }
}
