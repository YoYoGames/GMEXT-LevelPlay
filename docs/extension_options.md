@title Extension Options

# Extension Options

You can access the Extension Options by navigating to the **GMLevelPlay** extension asset in the [Asset Browser](https://manual.gamemaker.io/monthly/en/Introduction/The_Asset_Browser.htm) and double-clicking it.

![LevelPlay Extension Options](assets/levelplay_ext_options.png)

## Options

### AndroidAppKey

| | |
|---|---|
| **Type** | String |
| **Required** | Yes, if targeting Android |
| **Platform** | Android only |

The App Key for your app, which is used to initialise the LevelPlay SDK on Android. You can find it on the Unity LevelPlay (ironSource) dashboard, under the Android platform settings of your app.

[[Important: Without a valid `AndroidAppKey`, ${function.levelplay_init} fails to initialise the SDK on Android.]]

### iOSAppKey

| | |
|---|---|
| **Type** | String |
| **Required** | Yes, if targeting iOS |
| **Platform** | iOS only |

The App Key for your app, which is used to initialise the LevelPlay SDK on iOS. You can find it on the Unity LevelPlay (ironSource) dashboard, under the iOS platform settings of your app.

[[Important: Without a valid `iOSAppKey`, ${function.levelplay_init} fails to initialise the SDK on iOS.]]

## Mediation network options

Most of the `LevelPlay_<Network>` mediation extensions have no configurable options at all, as
enabling the extension is enough. The Google mediation extension is the one exception, as it
requires an App ID of its own:

### LevelPlay_Google: Android_AppID

| | |
|---|---|
| **Type** | String |
| **Required** | Yes, if the `LevelPlay_Google` extension is enabled for Android |
| **Platform** | Android only |

Your AdMob Application ID for Android, in the form `ca-app-pub-XXXXXXXXXXXXXXXX~YYYYYYYYYY`. You can
find it on the AdMob dashboard, under **App settings**. It is injected into the
`com.google.android.gms.ads.APPLICATION_ID` meta-data entry of the Android manifest.

[[Important: The manifest merge of the Google mediation adapter fails at build time without a valid
`Android_AppID`, when `LevelPlay_Google` is enabled for Android.]]

### LevelPlay_Google: iOS_AppID

| | |
|---|---|
| **Type** | String |
| **Required** | Yes, if the `LevelPlay_Google` extension is enabled for iOS |
| **Platform** | iOS only |

Your AdMob Application ID for iOS, in the form `ca-app-pub-XXXXXXXXXXXXXXXX~YYYYYYYYYY`. You can find
it on the AdMob dashboard, under **App settings**. It is injected into the
`GADApplicationIdentifier` key of the compiled `Info.plist`.

[[Important: The Mobile Ads SDK from Google crashes on the first ad request without a valid
`iOS_AppID`, when `LevelPlay_Google` is enabled for iOS.]]
