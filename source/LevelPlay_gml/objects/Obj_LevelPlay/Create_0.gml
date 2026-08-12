
event_inherited();

var _init_error = levelplay_init(function(_result){
		if(_result.success)
		{
			instance_create_depth(room_width/2,300,0,Obj_LevelPlay_Banner)
			instance_create_depth(room_width/2,400,0,Obj_LevelPlay_Interstitial)
			instance_create_depth(room_width/2,500,0,Obj_LevelPlay_RewardedAd)
		}
		else
		{
			show_message_async("LevelPlay Initilization Failed")
		}
	})

if (_init_error != LevelPlayError.Ok)
{
	show_message_async($"LevelPlay Initilization Failed: {_init_error}")
}


levelplay_banner_callback_subscribe(function(_result,_type,_ad_info){

		show_debug_message($"Banner {_result} {_type} {_ad_info}")

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

			case LevelPlayCallbackEvent.Clicked:
			break

			case LevelPlayCallbackEvent.Expanded:
			break

			case LevelPlayCallbackEvent.Collapsed:
			break

			case LevelPlayCallbackEvent.LeftApplication:
			break

		}
	})

// Interstitial and rewarded video no longer subscribe here -- each is handle-based, and its
// callback is given directly to levelplay_interstitial_load/levelplay_rewarded_video_load in
// Obj_LevelPlay_Interstitial/Obj_LevelPlay_RewardedAd's own Create event.
