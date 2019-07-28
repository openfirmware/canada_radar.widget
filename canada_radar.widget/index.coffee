# Canada Weather Radar Map widget for ubersicht
# Uses Meteorological Service of Canada (MSC) OGC Web Services as a data
# source, including coverage for the United States for some layers.
L          = require "./lib/leaflet.js"
TileLayers = require "./lib/tile_layers.coffee"
WMSLayers  = require "./lib/wms_layers.coffee"

# CUSTOMIZE THESE FOR YOUR LOCATION
latitude  = 51
longitude = -114
zoomLevel = 8

# CUSTOMIZE THE BASEMAP
# 
# openstreetmap-carto: https://www.openstreetmap.org/#map=12/37.7993/-122.3856
# openstreetmap-hot:   https://www.openstreetmap.org/#map=12/37.7992/-122.3855&layers=H
# opentopomap:         http://leaflet-extras.github.io/leaflet-providers/preview/index.html
# stamen-terrain:      http://maps.stamen.com/terrain/#12/37.7706/-122.3782
# stamen-toner:        http://maps.stamen.com/toner/#12/37.7706/-122.3782
basemap = TileLayers["openstreetmap-hot"]

# CUSTOMIZE THE RADAR SOURCE
# 
# geomet: Canada
# See "wms_layers.coffee" for more details on customizing the radar layer
radar = WMSLayers["geomet"]

# The refresh frequency in milliseconds. Radar updates every 10 minutes,
# so update map every 10 minutes too.
refreshFrequency: 10 * 60 * 1000

# No local command necessary
command: ""

# Change container size to change the size of the map
render: (domEl) -> """
<link rel="stylesheet" href="canada_radar.widget/lib/leaflet.css" />
<div id="map">Loading...</div>
<div id="last-update"></div>
"""

afterRender: (domEl) ->
  # Create the Leaflet Map.
  # See docs for more customization:
  # https://leafletjs.com/reference-1.5.0.html
  map = L.map('map', {
    zoomControl: false
  }).setView([latitude, longitude], zoomLevel)

  # Base map layer
  basemap.addTo(map)

  @layer = radar.addTo(map)

update:(output,domEl) ->
  @layer.redraw()
  $("#last-update").text(@timestampString(new Date()))

# Customize this for converting the Date object into a string for
# rendering over the map.
timestampString: (timestamp) ->
  timestamp.toTimeString()

# Edit these to change the position/size of the widget
style: """
  top: 1%
  left: 1%

  #map
    border: 1px solid white
    width: 600px
    height: 400px

  #last-update
    position: absolute
    left: 0.1em
    top: 0
    z-index: 1000
    background-color: rgba(255,255,255,0.7)
    font-family: "Helvetica Neue", sans-serif
    font-size: 10pt
"""
