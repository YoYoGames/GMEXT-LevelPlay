// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum LevelPlayBannerAlignV
{
    Top((int)0),
    Center((int)1),
    Bottom((int)2);

    private final int value;
    private LevelPlayBannerAlignV(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static LevelPlayBannerAlignV from(int v)
    {
        switch (v)
        {
            case 0:
                return LevelPlayBannerAlignV.Top;
            case 1:
                return LevelPlayBannerAlignV.Center;
            case 2:
                return LevelPlayBannerAlignV.Bottom;
            default:
                throw new IllegalArgumentException("Unknown LevelPlayBannerAlignV value: " + v);
        }
    }
}