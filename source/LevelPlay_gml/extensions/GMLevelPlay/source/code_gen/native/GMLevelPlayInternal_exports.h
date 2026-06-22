// ##### extgen :: Auto-generated file do not edit!! #####

#pragma once
#include "core/GMExtUtils.h"

// Internal function used for fetching dispatched function calls to GML
GMEXPORT double __EXT_NATIVE__GMLevelPlay_invocation_handler(char* __ret_buffer, double __ret_buffer_length);

GMEXPORT double __EXT_NATIVE__levelplay_init(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_is_initialized();
GMEXPORT double __EXT_NATIVE__levelplay_set_consent(double enable);
GMEXPORT double __EXT_NATIVE__levelplay_set_metadata(char* key, char* value);
GMEXPORT double __EXT_NATIVE__levelplay_set_dynamic_user_id(char* user_id);
GMEXPORT double __EXT_NATIVE__levelplay_launch_test_suite();
GMEXPORT double __EXT_NATIVE__levelplay_interstitial_init(char* ad_unit_id);
GMEXPORT double __EXT_NATIVE__levelplay_interstitial_load();
GMEXPORT double __EXT_NATIVE__levelplay_interstitial_is_ready();
GMEXPORT double __EXT_NATIVE__levelplay_interstitial_is_placement_capped(char* placement_id);
GMEXPORT double __EXT_NATIVE__levelplay_interstitial_show(char* placement_id);
GMEXPORT double __EXT_NATIVE__levelplay_interstitial_callback_subscribe(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_init(char* ad_unit_id);
GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_load();
GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_is_ready();
GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_is_placement_capped(char* placement_id);
GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_show(char* placement_id);
GMEXPORT double __EXT_NATIVE__levelplay_rewarded_callback_subscribe(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_banner_create(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_banner_move(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_banner_destroy();
GMEXPORT double __EXT_NATIVE__levelplay_banner_callback_subscribe(char* __arg_buffer, double __arg_buffer_length);

