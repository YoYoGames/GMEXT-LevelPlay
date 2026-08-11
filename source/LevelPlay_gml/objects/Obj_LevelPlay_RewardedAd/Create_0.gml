
event_inherited();

text = "Rewarded Ad"

// TODO: needs a real ad unit id registered to this app in the LevelPlay dashboard --
// there is no universal public test ad unit id for LevelPlay/ironSource (unlike AdMob).
_id = ""
if(os_type == os_android)
	_id = ""
else if(os_type == os_ios)
	_id = ""


levelplay_rewarded_video_init(_id)
levelplay_rewarded_video_load()

