// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum LevelPlayError
{
    Ok((int)0),
    NotInitialized((int)1),
    AdNotInitialized((int)2),
    AdNotReady((int)3),
    PlacementCapped((int)4),
    ActivityUnavailable((int)5),
    RootViewUnavailable((int)6),
    MissingAppKey((int)7);

    private final int value;
    private LevelPlayError(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static LevelPlayError from(int v)
    {
        switch (v)
        {
            case 0:
                return LevelPlayError.Ok;
            case 1:
                return LevelPlayError.NotInitialized;
            case 2:
                return LevelPlayError.AdNotInitialized;
            case 3:
                return LevelPlayError.AdNotReady;
            case 4:
                return LevelPlayError.PlacementCapped;
            case 5:
                return LevelPlayError.ActivityUnavailable;
            case 6:
                return LevelPlayError.RootViewUnavailable;
            case 7:
                return LevelPlayError.MissingAppKey;
            default:
                throw new IllegalArgumentException("Unknown LevelPlayError value: " + v);
        }
    }
}