// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum LevelPlayCallbackEvent
{
    Loaded((int)0),
    LoadFailed((int)1),
    Displayed((int)2),
    DisplayFailed((int)3),
    Closed((int)4),
    Clicked((int)5),
    InfoChanged((int)6),
    Rewarded((int)7),
    Expanded((int)8),
    Collapsed((int)9),
    LeftApplication((int)10);

    private final int value;
    private LevelPlayCallbackEvent(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static LevelPlayCallbackEvent from(int v)
    {
        switch (v)
        {
            case 0:
                return LevelPlayCallbackEvent.Loaded;
            case 1:
                return LevelPlayCallbackEvent.LoadFailed;
            case 2:
                return LevelPlayCallbackEvent.Displayed;
            case 3:
                return LevelPlayCallbackEvent.DisplayFailed;
            case 4:
                return LevelPlayCallbackEvent.Closed;
            case 5:
                return LevelPlayCallbackEvent.Clicked;
            case 6:
                return LevelPlayCallbackEvent.InfoChanged;
            case 7:
                return LevelPlayCallbackEvent.Rewarded;
            case 8:
                return LevelPlayCallbackEvent.Expanded;
            case 9:
                return LevelPlayCallbackEvent.Collapsed;
            case 10:
                return LevelPlayCallbackEvent.LeftApplication;
            default:
                throw new IllegalArgumentException("Unknown LevelPlayCallbackEvent value: " + v);
        }
    }
}