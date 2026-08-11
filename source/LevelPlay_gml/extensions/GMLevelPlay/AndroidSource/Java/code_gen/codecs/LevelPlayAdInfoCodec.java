// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import ${YYAndroidPackageName}.records.*;

public final class LevelPlayAdInfoCodec {
    private LevelPlayAdInfoCodec()
    {
    }
    public static LevelPlayAdInfo read(ByteBuffer b)
    {
        int width = GMExtWire.readI32(b);

        int height = GMExtWire.readI32(b);

        java.util.Optional<String> format = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_format = GMExtWire.readString(b);
            format = java.util.Optional.of(__opt_format);
        }

        java.util.Optional<String> network = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_network = GMExtWire.readString(b);
            network = java.util.Optional.of(__opt_network);
        }

        java.util.Optional<String> unit_id = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_unit_id = GMExtWire.readString(b);
            unit_id = java.util.Optional.of(__opt_unit_id);
        }

        java.util.Optional<String> unit_name = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_unit_name = GMExtWire.readString(b);
            unit_name = java.util.Optional.of(__opt_unit_name);
        }

        java.util.Optional<String> placement_name = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_placement_name = GMExtWire.readString(b);
            placement_name = java.util.Optional.of(__opt_placement_name);
        }

        java.util.Optional<String> country = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_country = GMExtWire.readString(b);
            country = java.util.Optional.of(__opt_country);
        }

        java.util.Optional<String> precision = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_precision = GMExtWire.readString(b);
            precision = java.util.Optional.of(__opt_precision);
        }

        java.util.Optional<Double> revenue = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            double __opt_revenue = GMExtWire.readF64(b);
            revenue = java.util.Optional.of(__opt_revenue);
        }

        return new LevelPlayAdInfo(width, height, format, network, unit_id, unit_name, placement_name, country, precision, revenue);
    }

    public static void write(GMExtWire.IByteWriter b, LevelPlayAdInfo obj)
    {
        GMExtWire.writeI32(b, obj.width());

        GMExtWire.writeI32(b, obj.height());

        GMExtWire.writeBool(b, obj.format() != null && obj.format().isPresent());
        if (obj.format() != null && obj.format().isPresent())
        {
            GMExtWire.writeString(b, obj.format().get());
        }

        GMExtWire.writeBool(b, obj.network() != null && obj.network().isPresent());
        if (obj.network() != null && obj.network().isPresent())
        {
            GMExtWire.writeString(b, obj.network().get());
        }

        GMExtWire.writeBool(b, obj.unit_id() != null && obj.unit_id().isPresent());
        if (obj.unit_id() != null && obj.unit_id().isPresent())
        {
            GMExtWire.writeString(b, obj.unit_id().get());
        }

        GMExtWire.writeBool(b, obj.unit_name() != null && obj.unit_name().isPresent());
        if (obj.unit_name() != null && obj.unit_name().isPresent())
        {
            GMExtWire.writeString(b, obj.unit_name().get());
        }

        GMExtWire.writeBool(b, obj.placement_name() != null && obj.placement_name().isPresent());
        if (obj.placement_name() != null && obj.placement_name().isPresent())
        {
            GMExtWire.writeString(b, obj.placement_name().get());
        }

        GMExtWire.writeBool(b, obj.country() != null && obj.country().isPresent());
        if (obj.country() != null && obj.country().isPresent())
        {
            GMExtWire.writeString(b, obj.country().get());
        }

        GMExtWire.writeBool(b, obj.precision() != null && obj.precision().isPresent());
        if (obj.precision() != null && obj.precision().isPresent())
        {
            GMExtWire.writeString(b, obj.precision().get());
        }

        GMExtWire.writeBool(b, obj.revenue() != null && obj.revenue().isPresent());
        if (obj.revenue() != null && obj.revenue().isPresent())
        {
            GMExtWire.writeF64(b, obj.revenue().get());
        }

    }
}