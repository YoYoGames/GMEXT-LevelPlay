@title Getting Started

## Getting Started

### Setting Up

Import the LevelPlay extension and the `LevelPlay_MACROS` script asset.

Also make sure that ExtensionCore exists in the project. This is required for the extension to work correctly.

If you want to use mediation, also import the extensions of the mediation networks you want to include.

In the extension options, enter the app key to use for Android and on iOS:

![LevelPlay Extension Options](assets/levelplay_ext_options.png)

### Initialisation and Updating

To initialise the LevelPlay extension in your game, call the ${function.levelplay_init} function and pass it a function to be called when initialisation is complete:

```gml
levelplay_init(function(_data)) {
    if (_data.success)
	{
	    // Initialisation succeeded
		
		// ...
	}
	else
	{
	    // Initialisation failed
		
		// ...
	}
}
```

### Callbacks

The LevelPlay extension makes use of callback functions, rather than async events, to communicate changes back to your game.

To register for callbacks you pass the function to be called as the callback parameter to the subscribe function of the ad type you want to receive callbacks from. For example, for ${function.levelplay_banner_callback_subscribe}:

```gml
identifier = levelplay_banner_callback_subscribe(function(_data) {
    switch(_data.type)
    {
        case "loaded":
            var _ad_info = _data.ad_info;
            break;
	    case "loaded_failed":
            var _ad_info = _data.ad_info;
            break;
		case "displayed":
            var _ad_info = _data.ad_info;
            break;
		case "displayed_failed":
            var _ad_info = _data.ad_info;
            break;
		
		// Etc.
    }
});
```

To unsubscribe from all callbacks for a given ad type pass the return value of the function to ${function.levelplay_callback_unsubscribe}:

```gml
levelplay_callback_unsubscribe(identifier);
```