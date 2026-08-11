// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum LevelPlayBannerVAlign
{
    Top((int)0),
    Center((int)1),
    Bottom((int)2);

    private final int value;
    private LevelPlayBannerVAlign(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static LevelPlayBannerVAlign from(int v)
    {
        switch (v)
        {
            case 0:
                return LevelPlayBannerVAlign.Top;
            case 1:
                return LevelPlayBannerVAlign.Center;
            case 2:
                return LevelPlayBannerVAlign.Bottom;
            default:
                throw new IllegalArgumentException("Unknown LevelPlayBannerVAlign value: " + v);
        }
    }
}