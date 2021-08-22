# Compute allowed zone and add to Leaflet map
show_zone <- function(x, y, radius){
  show_modal_spinner("semipolar")
  poi <- coords_to_sf(x, y)
  zone <- find_zone(poi, lgas, radius)
  zone_bb <- unname(st_bbox(zone))
  
  leafletProxy("basemap")  |>
    addPolygons(data = zone, layerId = "zone", weight = 1) |>
    flyToBounds(lat1 = zone_bb[2], lat2 = zone_bb[4],
                lng1 = zone_bb[1], lng2 = zone_bb[3])
  
  remove_modal_spinner()
}

show_intro <- function(){
  showModal(
    modalDialog(
      title = "About this app",
      easyClose = TRUE,
      markdown("Find the overlapping area between a NSW LGA and the radius around a chosen location.
               
               * **Click** or **tap** to check a location.
               * **Drag** to pan the map.
               * **Scroll** or **pinch** to zoom
               * Change the radius with the slider.
               
               Always check official NSW Government sources for the [latest COVID-19 rules](https://www.nsw.gov.au/covid-19/rules).
               Do not rely on a shiny app you found online for public health information.
               
               [LGA boundary data](https://www.abs.gov.au/websitedbs/D3310114.nsf/home/Digital+Boundaries)
               is provided by the Australian Bureau of Statistics. The ABS 2020 LGA mesh block approximation is used."
      )
    )
  )
}