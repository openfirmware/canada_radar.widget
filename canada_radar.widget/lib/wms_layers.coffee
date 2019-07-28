Layers = {

  # Weather Radar Source Service:
  # https://www.canada.ca/en/environment-climate-change/services/weather-general-tools-resources/weather-tools-specialized-data/geospatial-web-services.html
  # 
  # Other layers that might interest you:
  # * "RADAR_1KM_RRAI": Radar Precipitation Rate (Rain) (1 km) [mm/hr]
  # * "RADAR_1KM_RSNO": Radar Precipitation Rate (Snow) (1 km) [cm/hr]
  # * "RADAR_1KM_RDBR": Radar Reflectivity (Rain) (1 km) [dBZ]
  # * "CURRENT_CONDITIONS": Images for weather conditions and text for temperatures
  # 
  # Join multiple layers with commas into a single string to view 
  # multiple layers at the same time.
  # More layers can be found by parsing the WMS Capabilities document.
  "geomet": L.tileLayer.wms('http://geo.weather.gc.ca/geomet/', {
    layers: 'RADAR_1KM_RRAI',
    format: 'image/png',
    transparent: true,
    attribution: 'Environment and Climate Change Canada',
    uppercase: true,
    version: '1.3.0'
  })
}

module.exports = Layers