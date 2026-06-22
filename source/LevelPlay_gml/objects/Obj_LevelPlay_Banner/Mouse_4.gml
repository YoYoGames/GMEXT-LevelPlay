
show_debug_message("[LEVELPLAY] banner pressed: " + string(step))

switch(step)
{
	case 0:
	
		levelplay_banner_create(_id,LEVELPLAY_AD_SIZE.BANNER,LEVELPLAY_BANNER_HALIGN.CENTER,LEVELPLAY_BANNER_VALIGN.BOTTOM)
		
		step = 1
	break
	
	case 1:
		levelplay_banner_move(LEVELPLAY_BANNER_HALIGN.CENTER,LEVELPLAY_BANNER_VALIGN.TOP)
		step = 2
	break
	
	case 2:
		levelplay_banner_move(LEVELPLAY_BANNER_HALIGN.CENTER,LEVELPLAY_BANNER_VALIGN.MIDDLE)
		step = 3
	break
	
	case 3:
		levelplay_banner_destroy()
		step = 0
	break
}


