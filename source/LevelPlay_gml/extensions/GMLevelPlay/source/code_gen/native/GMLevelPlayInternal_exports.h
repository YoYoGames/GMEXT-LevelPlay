// ##### extgen :: Auto-generated file do not edit!! #####

#pragma once
#include "core/GMExtUtils.h"

// Internal function used for fetching dispatched function calls to GML
GMEXPORT double __EXT_NATIVE__GMLevelPlay_invocation_handler(char* __ret_buffer, double __ret_buffer_length);

GMEXPORT double __EXT_NATIVE__levelplay_init(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_is_initialized();
GMEXPORT double __EXT_NATIVE__levelplay_set_consent(double enable);
GMEXPORT double __EXT_NATIVE__levelplay_set_metadata(char* key, char* value);
GMEXPORT double __EXT_NATIVE__levelplay_set_dynamic_user_id(char* user_id);
GMEXPORT double __EXT_NATIVE__levelplay_launch_test_suite();
GMEXPORT double __EXT_NATIVE__levelplay_interstitial_create(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_interstitial_load(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_interstitial_set_callback(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_interstitial_is_ready(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_interstitial_is_placement_capped(char* placement_id);
GMEXPORT double __EXT_NATIVE__levelplay_interstitial_show(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_interstitial_destroy(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_interstitial_get_live_handles(char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_create(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_load(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_set_callback(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_is_ready(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_is_placement_capped(char* placement_id);
GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_show(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_destroy(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_rewarded_video_get_live_handles(char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_banner_create(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_banner_move(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__levelplay_banner_destroy();
GMEXPORT double __EXT_NATIVE__levelplay_banner_callback_subscribe(char* __arg_buffer, double __arg_buffer_length);

