
event_inherited();

text = "Rewarded Ad"

// TODO: needs a real ad unit id registered to this app in the LevelPlay dashboard --
// there is no universal public test ad unit id for LevelPlay/ironSource (unlike AdMob).
_id = ""
if(os_type == os_android)
	_id = "avqlv6o8sh9"
else if(os_type == os_ios)
	_id = "a12lv6o8tt9"


on_rewarded_event = function(_result, _type, _ad_info, _reward)
{
	show_debug_message($"Rewarded {_result} {_type} {_ad_info} {_reward}")

	switch(_type)
	{
		case LevelPlayCallbackEvent.Loaded:
		break

		case LevelPlayCallbackEvent.LoadFailed:
		break

		case LevelPlayCallbackEvent.Displayed:
		break

		case LevelPlayCallbackEvent.DisplayFailed:
		break

		case LevelPlayCallbackEvent.Closed:
			var _reload_error = levelplay_rewarded_video_load(handle)
			show_debug_message($"Rewarded reload after Closed: {_reload_error}")
		break

		case LevelPlayCallbackEvent.Clicked:
		break

		case LevelPlayCallbackEvent.InfoChanged:
		break

		case LevelPlayCallbackEvent.Rewarded:
			show_message_async("Reward!")
		break
	}
}

handle = levelplay_rewarded_video_create(_id, on_rewarded_event)
var _load_error = levelplay_rewarded_video_load(handle)
show_debug_message($"Rewarded initial load: {_load_error}")
