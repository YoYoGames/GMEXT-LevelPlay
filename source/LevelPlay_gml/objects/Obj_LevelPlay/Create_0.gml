
event_inherited();

levelplay_init(function(_success,_error_message){
		show_debug_message($"HERE!!! {{_success,_error_message}}")
		if(_success)
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


levelplay_banner_callback_subscribe(function(_data){
		
		show_debug_message($"Banner {_data}")
		
		switch(_data.type)
		{
			case "loaded":
				var ad_info = _data.ad_info
			break

			case "loaded_failed":
			break
			
			case "displayed":
				var ad_info = _data.ad_info
			break

			case "displayed_failed":
			break

			case "clicked":
				var ad_info = _data.ad_info
			break

			case "expanded":
				var ad_info = _data.ad_info
			break

			case "collapsed":
				var ad_info = _data.ad_info
			break

			case "left_application":
				var ad_info = _data.ad_info
			break

		}
	})

levelplay_interstitial_callback_subscribe(function(_data){
	
		show_debug_message($"Interstitial {_data}")
		
		switch(_data.type)
		{
			case "loaded":
				var ad_info = _data.ad_info
			break
			
			case "loaded_failed":
			break

			case "displayed":
				var ad_info = _data.ad_info
			break

			case "displayed_failed":
				var ad_info = _data.ad_info
			break

			case "closed":
				var ad_info = _data.ad_info
				show_debug_message(ad_info)
				levelplay_interstitial_load(Obj_LevelPlay_Interstitial._id)
			break

			case "clicked":
				var ad_info = _data.ad_info
			break

			case "info_changed":
				var ad_info = _data.ad_info
			break
		}
	})
	
levelplay_rewarded_callback_subscribe(function(_data){
		
		show_debug_message($"Rewarded {_data}")
	
		switch(_data.type)
		{
			case "loaded":
				var ad_info = _data.ad_info
			break

			case "loaded_failed":
				
			break
			
			case "displayed":
				var ad_info = _data.ad_info
			break
			
			case "displayed_failed":
				var ad_info = _data.ad_info
			break
			
			case "closed":
				var ad_info = _data.ad_info
				levelplay_rewarded_video_load(Obj_LevelPlay_RewardedAd._id)
			break
			
			case "clicked":
				var ad_info = _data.ad_info
			break
			
			case "info_changed":
				var ad_info = _data.ad_info
			break
			
			case "rewarded":
				var ad_info = _data.ad_info
				show_message_async("Reward!")
			break
		}
	})
