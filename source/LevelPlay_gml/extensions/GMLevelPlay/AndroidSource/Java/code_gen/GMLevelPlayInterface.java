// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.GMExtWire.GMFunction;
import ${YYAndroidPackageName}.GMExtWire.GMValue;
import ${YYAndroidPackageName}.enums.*;
import ${YYAndroidPackageName}.records.*;

import java.util.Optional;

public interface GMLevelPlayInterface {
    public LevelPlayError levelplay_init(GMFunction callback);
    public boolean levelplay_is_initialized();
    public void levelplay_set_consent(boolean enable);
    public void levelplay_set_metadata(String key, String value);
    public void levelplay_set_dynamic_user_id(String user_id);
    public void levelplay_launch_test_suite();
    public void levelplay_interstitial_init(String ad_unit_id);
    public LevelPlayError levelplay_interstitial_load();
    public boolean levelplay_interstitial_is_ready();
    public boolean levelplay_interstitial_is_placement_capped(String placement_id);
    public LevelPlayError levelplay_interstitial_show(String placement_id);
    public void levelplay_interstitial_callback_subscribe(GMFunction callback);
    public void levelplay_rewarded_video_init(String ad_unit_id);
    public LevelPlayError levelplay_rewarded_video_load();
    public boolean levelplay_rewarded_video_is_ready();
    public boolean levelplay_rewarded_video_is_placement_capped(String placement_id);
    public LevelPlayError levelplay_rewarded_video_show(String placement_id);
    public void levelplay_rewarded_callback_subscribe(GMFunction callback);
    public LevelPlayError levelplay_banner_create(String ad_unit_id, LevelPlayBannerSize size, LevelPlayBannerHAlign align_h, LevelPlayBannerVAlign align_v);
    public void levelplay_banner_move(LevelPlayBannerHAlign align_h, LevelPlayBannerVAlign align_v);
    public void levelplay_banner_destroy();
    public void levelplay_banner_callback_subscribe(GMFunction callback);
}