
event_inherited();

text = "Interstitial"

_id = ""
if(os_type == os_android)
	_id = "aeyqi3vqlv6o8sh9"
else if(os_type == os_ios)
	_id = "wmgt0712uuux8ju4"


on_interstitial_event = function(_result, _type, _ad_info)
{
	show_debug_message($"Interstitial {_result} {_type} {_ad_info}")

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
			var _reload_error = levelplay_interstitial_load(handle)
			show_debug_message($"Interstitial reload after Closed: {_reload_error}")
		break

		case LevelPlayCallbackEvent.Clicked:
		break

		case LevelPlayCallbackEvent.InfoChanged:
		break
	}
}

handle = levelplay_interstitial_create(_id, on_interstitial_event)
var _load_error = levelplay_interstitial_load(handle)
show_debug_message($"Interstitial initial load: {_load_error}")
