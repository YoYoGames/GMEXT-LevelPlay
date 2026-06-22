// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum LevelPlayBannerAlignH
{
    Left((int)0),
    Center((int)1),
    Right((int)2);

    private final int value;
    private LevelPlayBannerAlignH(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static LevelPlayBannerAlignH from(int v)
    {
        switch (v)
        {
            case 0:
                return LevelPlayBannerAlignH.Left;
            case 1:
                return LevelPlayBannerAlignH.Center;
            case 2:
                return LevelPlayBannerAlignH.Right;
            default:
                throw new IllegalArgumentException("Unknown LevelPlayBannerAlignH value: " + v);
        }
    }
}