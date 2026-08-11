
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

levelplay_interstitial_callback_subscribe(function(_result,_type,_ad_info){

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
				show_debug_message(_ad_info)
				levelplay_interstitial_load()
			break

			case LevelPlayCallbackEvent.Clicked:
			break

			case LevelPlayCallbackEvent.InfoChanged:
			break
		}
	})

levelplay_rewarded_callback_subscribe(function(_result,_type,_ad_info,_reward){

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
				levelplay_rewarded_video_load()
			break

			case LevelPlayCallbackEvent.Clicked:
			break

			case LevelPlayCallbackEvent.InfoChanged:
			break

			case LevelPlayCallbackEvent.Rewarded:
				show_message_async("Reward!")
			break
		}
	})
