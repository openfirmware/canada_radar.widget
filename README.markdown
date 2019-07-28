# Canada Radar Widget for Übersicht

A desktop widget to display automatically updating weather radar.

(screenshot)

This widget is focused on Canada; if you fork the repo and add support for other countries, let me know and I can link to you from here.

## Installation

Download and install [Übersicht][] first. From the Übersicht menu item, open your widgets folder.

Download the ZIP file for this widget, and extract the `canada_radar.widget` folder into your Übersicht widgets folder. See the next section for customization of your location.

## Customization

Once installed, you can edit the widget with a text editor for your location and map style preference. Some examples of the map styles can be seen in [screenshots/overview.markdown](screenshots/overview.markdown) (TODO).

### Edit Your Location

In the `index.coffee` file, change the `latitude` and `longitude` to your location. You can use [OpenStreetMap Nominatim][Nominatim] to find the coordinates for your city; click through the results to find the Centre Point (latitude first, longitude second).

When you update the location and save the `index.coffee` file, Übersicht should automatically refresh the map to your location. Adjust the `zoomLevel` to your liking to give a buffer of the surrounding area.

### Edit Your Base Map

The underlying map defaults to using the [Humanitarian OpenStreetMap Team][HOT] map style (`openstreetmap-hot`). See [screenshots/overview.markdown](screenshots/overview.markdown) for other styles you can use instead.

### Edit the Radar Source

Currently only [GeoMET][] from the Government of Canada is supported.

### Edit the Widget Position and Size

At the bottom of the `index.coffee` file, the CSS is used to position and change the size of the widget. By default it sits in the top-left corner of the screen.

## License

MIT License

## Authors

James Badger (@openfirmware)

[GeoMET]: https://www.canada.ca/en/environment-climate-change/services/weather-general-tools-resources/weather-tools-specialized-data/geospatial-web-services.html
[HOT]: https://www.hotosm.org
[Nominatim]: https://nominatim.openstreetmap.org
[Übersicht]: http://tracesof.net/uebersicht/
