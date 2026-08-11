
show_debug_message("[LEVELPLAY] banner pressed: " + string(step))

switch(step)
{
	case 0:
	
		levelplay_banner_create(_id,LevelPlayBannerSize.Banner,LevelPlayBannerHAlign.Center,LevelPlayBannerVAlign.Bottom)

		step = 1
	break

	case 1:
		levelplay_banner_move(LevelPlayBannerHAlign.Center,LevelPlayBannerVAlign.Top)
		step = 2
	break

	case 2:
		levelplay_banner_move(LevelPlayBannerHAlign.Center,LevelPlayBannerVAlign.Center)
		step = 3
	break
	
	case 3:
		levelplay_banner_destroy()
		step = 0
	break
}


