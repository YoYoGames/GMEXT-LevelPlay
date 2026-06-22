// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record LevelPlayAdEvent(String type, java.util.Optional<String> message, java.util.Optional<LevelPlayAdInfo> ad_info, java.util.Optional<LevelPlayAdError> error, java.util.Optional<LevelPlayReward> reward) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 4;
    @Override
    public void encode(ByteBuffer b)
    {
        LevelPlayAdEventCodec.write(b, this);
    }
}
