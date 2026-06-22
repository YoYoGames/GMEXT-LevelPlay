// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum LevelPlayBannerSize
{
    Banner((int)0),
    Large((int)1),
    MediumRectangle((int)2),
    Adaptive((int)3);

    private final int value;
    private LevelPlayBannerSize(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static LevelPlayBannerSize from(int v)
    {
        switch (v)
        {
            case 0:
                return LevelPlayBannerSize.Banner;
            case 1:
                return LevelPlayBannerSize.Large;
            case 2:
                return LevelPlayBannerSize.MediumRectangle;
            case 3:
                return LevelPlayBannerSize.Adaptive;
            default:
                throw new IllegalArgumentException("Unknown LevelPlayBannerSize value: " + v);
        }
    }
}