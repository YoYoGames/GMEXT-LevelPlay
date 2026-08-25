{
  "$GMExtension": "",
  "%Name": "GMLevelPlay",
  "androidactivityinject": null,
  "androidclassname": "GMLevelPlay",
  "androidcodeinjection": "\u003CYYAndroidTopLevelGradleAllprojectsRepositories\u003E\r\n\r\n\u003C/YYAndroidTopLevelGradleAllprojectsRepositories\u003E\r\n\r\n\u003CYYAndroidGradleDependencies\u003E\r\n\r\n    implementation(platform(\u0022org.jetbrains.kotlin:kotlin-bom:2.0.0\u0022)) // Necessary or build will fail with duplicated symbols\r\n\r\n    implementation \u0027com.unity3d.ads-mediation:mediation-sdk:9.5.0\u0027\r\n    // implementation \u0027com.unity3d.ads-mediation:adquality-sdk:7.22.4\u0027\r\n\r\n    implementation fileTree(dir: \u0027libs\u0027, include: [\u0027*.jar\u0027])\r\n\r\n    implementation \u0027com.google.android.gms:play-services-ads-identifier:18.0.1\u0027\r\n    implementation \u0027com.google.android.gms:play-services-appset:16.0.2\u0027\r\n\r\n\u003C/YYAndroidGradleDependencies\u003E\r\n\r\n\u003CYYAndroidManifestApplicationInject\u003E\r\n\r\n\u003C/YYAndroidManifestApplicationInject\u003E\r\n\r\n\u003CYYAndroidProguard\u003E\r\n\r\n\u003C/YYAndroidProguard\u003E",
  "androidinject": null,
  "androidmanifestinject": null,
  "androidPermissions": [],
  "androidProps": true,
  "androidsourcedir": "",
  "author": "",
  "classname": "GMLevelPlay",
  "copyToTargets": 12,
  "description": "",
  "exportToGame": true,
  "extensionVersion": "1.0.1",
  "files": [
    {
      "$GMExtensionFile": "v1",
      "%Name": "",
      "constants": [],
      "copyToTargets": -1,
      "filename": "GMLevelPlay.ext",
      "final": "",
      "functions": [
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_init",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_init",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_init",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "levelplay_is_initialized",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_is_initialized",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "levelplay_is_initialized",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "levelplay_set_consent",
          "argCount": 1,
          "args": [
            2
          ],
          "documentation": "@param {Real} enable\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_set_consent",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "levelplay_set_consent",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "levelplay_set_metadata",
          "argCount": 2,
          "args": [
            1,
            1
          ],
          "documentation": "@param {String} key\r\n@param {String} value\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_set_metadata",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "levelplay_set_metadata",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "levelplay_set_dynamic_user_id",
          "argCount": 1,
          "args": [
            1
          ],
          "documentation": "@param {String} user_id\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_set_dynamic_user_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "levelplay_set_dynamic_user_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "levelplay_launch_test_suite",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_launch_test_suite",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "levelplay_launch_test_suite",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_interstitial_create",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_interstitial_create",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_interstitial_create",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_interstitial_load",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_interstitial_load",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_interstitial_load",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_interstitial_set_callback",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_interstitial_set_callback",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_interstitial_set_callback",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_interstitial_is_ready",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_interstitial_is_ready",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_interstitial_is_ready",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "levelplay_interstitial_is_placement_capped",
          "argCount": 1,
          "args": [
            1
          ],
          "documentation": "@param {String} placement_id\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_interstitial_is_placement_capped",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "levelplay_interstitial_is_placement_capped",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_interstitial_show",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_interstitial_show",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_interstitial_show",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_interstitial_destroy",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_interstitial_destroy",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_interstitial_destroy",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_interstitial_get_live_handles",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_interstitial_get_live_handles",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_interstitial_get_live_handles",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_rewarded_video_create",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_rewarded_video_create",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_rewarded_video_create",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_rewarded_video_load",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_rewarded_video_load",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_rewarded_video_load",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_rewarded_video_set_callback",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_rewarded_video_set_callback",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_rewarded_video_set_callback",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_rewarded_video_is_ready",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_rewarded_video_is_ready",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_rewarded_video_is_ready",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "levelplay_rewarded_video_is_placement_capped",
          "argCount": 1,
          "args": [
            1
          ],
          "documentation": "@param {String} placement_id\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_rewarded_video_is_placement_capped",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "levelplay_rewarded_video_is_placement_capped",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_rewarded_video_show",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_rewarded_video_show",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_rewarded_video_show",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_rewarded_video_destroy",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_rewarded_video_destroy",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_rewarded_video_destroy",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_rewarded_video_get_live_handles",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_rewarded_video_get_live_handles",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_rewarded_video_get_live_handles",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_banner_create",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_banner_create",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_banner_create",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_banner_move",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_banner_move",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_banner_move",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "levelplay_banner_destroy",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_banner_destroy",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "levelplay_banner_destroy",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__levelplay_banner_callback_subscribe",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__levelplay_banner_callback_subscribe",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__levelplay_banner_callback_subscribe",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__GMLevelPlay_invocation_handler",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _buffer_ptr\r\n@param {Real} _buffer_size",
          "externalName": "__EXT_NATIVE__GMLevelPlay_invocation_handler",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__GMLevelPlay_invocation_handler",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        }
      ],
      "init": "",
      "kind": 4,
      "name": "",
      "origname": "",
      "ProxyFiles": [],
      "resourceType": "GMExtensionFile",
      "resourceVersion": "2.0",
      "uncompress": false,
      "usesRunnerInterface": false
    }
  ],
  "gradleinject": null,
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "HTML5CodeInjection": "",
  "html5Props": false,
  "IncludedResources": [],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "",
  "ioscodeinjection": "\r\n\u003CYYIosCocoaPods\u003E\r\npod \u0027IronSourceSDK\u0027, \u00279.5.0\u0027\r\n\u003C/YYIosCocoaPods\u003E\r\n\r\n\r\n\u003CYYIosPlist\u003E\r\n\u003Ckey\u003ESKAdNetworkItems\u003C/key\u003E\r\n\u003Carray\u003E\r\n   \u003Cdict\u003E\r\n      \u003Ckey\u003ESKAdNetworkIdentifier\u003C/key\u003E\r\n      \u003Cstring\u003Esu67r6k2v3.skadnetwork\u003C/string\u003E\r\n   \u003C/dict\u003E\r\n\u003C/array\u003E\r\n\u003C/YYIosPlist\u003E",
  "iosdelegatename": "",
  "iosplistinject": null,
  "iosProps": true,
  "iosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [
    {
      "$GMExtensionFrameworkEntry": "",
      "%Name": "GMLevelPlay.xcframework",
      "embed": 0,
      "name": "GMLevelPlay.xcframework",
      "resourceType": "GMExtensionFrameworkEntry",
      "resourceVersion": "2.0",
      "weakReference": false
    }
  ],
  "license": "",
  "maccompilerflags": "",
  "maclinkerflags": "-ObjC",
  "macsourcedir": "",
  "name": "GMLevelPlay",
  "options": [
    {
      "$GMExtensionOption": "",
      "%Name": "AndroidAppKey",
      "defaultValue": "",
      "description": "The LevelPlay (ironSource) App Key for Android, from the LevelPlay dashboard.",
      "displayName": "Android App Key",
      "exportToINI": false,
      "extensionId": null,
      "guid": "2c065c87-16f0-4359-801a-dd0f8791369e",
      "hidden": false,
      "listItems": [],
      "name": "AndroidAppKey",
      "optType": 2,
      "resourceType": "GMExtensionOption",
      "resourceVersion": "2.0"
    },
    {
      "$GMExtensionOption": "",
      "%Name": "iOSAppKey",
      "defaultValue": "",
      "description": "The LevelPlay (ironSource) App Key for iOS, from the LevelPlay dashboard.",
      "displayName": "iOS App Key",
      "exportToINI": false,
      "extensionId": null,
      "guid": "35041389-533f-4ec4-9526-7421cbbd3240",
      "hidden": false,
      "listItems": [],
      "name": "iOSAppKey",
      "optType": 2,
      "resourceType": "GMExtensionOption",
      "resourceVersion": "2.0"
    }
  ],
  "optionsFile": "options.json",
  "packageId": "",
  "parent": {
    "name": "GMLevelPlay",
    "path": "folders/GMLevelPlay.yy"
  },
  "productId": "",
  "resourceType": "GMExtension",
  "resourceVersion": "2.0",
  "sourcedir": "",
  "supportedTargets": -1,
  "tvosclassname": null,
  "tvosCocoaPodDependencies": "",
  "tvosCocoaPods": "",
  "tvoscodeinjection": "",
  "tvosdelegatename": null,
  "tvosmaccompilerflags": "",
  "tvosmaclinkerflags": "",
  "tvosplistinject": null,
  "tvosProps": false,
  "tvosSystemFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": []
}