// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum LevelPlayError
{
    Ok((int)0),
    NotInitialized((int)1),
    AdNotReady((int)2),
    PlacementCapped((int)3),
    ActivityUnavailable((int)4),
    RootViewUnavailable((int)5),
    MissingAppKey((int)6),
    InvalidHandle((int)7);

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
                return LevelPlayError.AdNotReady;
            case 3:
                return LevelPlayError.PlacementCapped;
            case 4:
                return LevelPlayError.ActivityUnavailable;
            case 5:
                return LevelPlayError.RootViewUnavailable;
            case 6:
                return LevelPlayError.MissingAppKey;
            case 7:
                return LevelPlayError.InvalidHandle;
            default:
                throw new IllegalArgumentException("Unknown LevelPlayError value: " + v);
        }
    }
}