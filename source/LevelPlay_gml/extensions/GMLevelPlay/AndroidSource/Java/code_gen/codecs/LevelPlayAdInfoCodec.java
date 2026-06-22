// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.records.*;

public final class LevelPlayAdInfoCodec {
    private LevelPlayAdInfoCodec()
    {
    }
    public static LevelPlayAdInfo read(ByteBuffer b)
    {
        int width = GMExtWire.readI32(b);

        int height = GMExtWire.readI32(b);

        String format = GMExtWire.readString(b);

        String network = GMExtWire.readString(b);

        String unit_id = GMExtWire.readString(b);

        String unit_name = GMExtWire.readString(b);

        String placement_name = GMExtWire.readString(b);

        String country = GMExtWire.readString(b);

        String precision = GMExtWire.readString(b);

        double revenue = GMExtWire.readF64(b);

        return new LevelPlayAdInfo(width, height, format, network, unit_id, unit_name, placement_name, country, precision, revenue);
    }

    public static void write(ByteBuffer b, LevelPlayAdInfo obj)
    {
        GMExtWire.writeI32(b, obj.width());

        GMExtWire.writeI32(b, obj.height());

        GMExtWire.writeString(b, obj.format());

        GMExtWire.writeString(b, obj.network());

        GMExtWire.writeString(b, obj.unit_id());

        GMExtWire.writeString(b, obj.unit_name());

        GMExtWire.writeString(b, obj.placement_name());

        GMExtWire.writeString(b, obj.country());

        GMExtWire.writeString(b, obj.precision());

        GMExtWire.writeF64(b, obj.revenue());

    }
}