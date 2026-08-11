// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum LevelPlayBannerHAlign
{
    Left((int)0),
    Center((int)1),
    Right((int)2);

    private final int value;
    private LevelPlayBannerHAlign(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static LevelPlayBannerHAlign from(int v)
    {
        switch (v)
        {
            case 0:
                return LevelPlayBannerHAlign.Left;
            case 1:
                return LevelPlayBannerHAlign.Center;
            case 2:
                return LevelPlayBannerHAlign.Right;
            default:
                throw new IllegalArgumentException("Unknown LevelPlayBannerHAlign value: " + v);
        }
    }
}