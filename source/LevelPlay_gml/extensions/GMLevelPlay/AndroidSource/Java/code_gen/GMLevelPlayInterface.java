// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.GMExtWire.GMFunction;
import ${YYAndroidPackageName}.GMExtWire.GMValue;
import ${YYAndroidPackageName}.enums.*;
import ${YYAndroidPackageName}.records.*;

import java.util.Optional;
import java.util.List;

public interface GMLevelPlayInterface {
    public LevelPlayError levelplay_init(GMFunction callback);
    public boolean levelplay_is_initialized();
    public void levelplay_set_consent(boolean enable);
    public void levelplay_set_metadata(String key, String value);
    public void levelplay_set_dynamic_user_id(String user_id);
    public void levelplay_launch_test_suite();
    public long levelplay_interstitial_create(String ad_unit_id, GMFunction callback);
    public LevelPlayError levelplay_interstitial_load(long handle);
    public LevelPlayError levelplay_interstitial_set_callback(long handle, GMFunction callback);
    public boolean levelplay_interstitial_is_ready(long handle);
    public boolean levelplay_interstitial_is_placement_capped(String placement_id);
    public LevelPlayError levelplay_interstitial_show(long handle, java.util.Optional<String> placement_id);
    public void levelplay_interstitial_destroy(long handle);
    public java.util.List<Long> levelplay_interstitial_get_live_handles();
    public long levelplay_rewarded_video_create(String ad_unit_id, GMFunction callback);
    public LevelPlayError levelplay_rewarded_video_load(long handle);
    public LevelPlayError levelplay_rewarded_video_set_callback(long handle, GMFunction callback);
    public boolean levelplay_rewarded_video_is_ready(long handle);
    public boolean levelplay_rewarded_video_is_placement_capped(String placement_id);
    public LevelPlayError levelplay_rewarded_video_show(long handle, java.util.Optional<String> placement_id);
    public void levelplay_rewarded_video_destroy(long handle);
    public java.util.List<Long> levelplay_rewarded_video_get_live_handles();
    public LevelPlayError levelplay_banner_create(String ad_unit_id, LevelPlayBannerSize size, LevelPlayBannerHAlign align_h, LevelPlayBannerVAlign align_v);
    public void levelplay_banner_move(LevelPlayBannerHAlign align_h, LevelPlayBannerVAlign align_v);
    public void levelplay_banner_destroy();
    public void levelplay_banner_callback_subscribe(GMFunction callback);
}