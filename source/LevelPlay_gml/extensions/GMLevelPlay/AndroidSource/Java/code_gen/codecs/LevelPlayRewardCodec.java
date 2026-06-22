// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.records.*;

public final class LevelPlayRewardCodec {
    private LevelPlayRewardCodec()
    {
    }
    public static LevelPlayReward read(ByteBuffer b)
    {
        String name = GMExtWire.readString(b);

        int amount = GMExtWire.readI32(b);

        return new LevelPlayReward(name, amount);
    }

    public static void write(ByteBuffer b, LevelPlayReward obj)
    {
        GMExtWire.writeString(b, obj.name());

        GMExtWire.writeI32(b, obj.amount());

    }
}