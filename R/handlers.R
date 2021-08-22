# Compute allowed zone and add to Leaflet map
show_zone <- function(x, y, radius){
  show_modal_spinner("semipolar")
  poi <- coords_to_sf(x, y)
  zone <- find_zone(poi, lgas, radius)
  zone_bb <- unname(st_bbox(zone))
  
  leafletProxy("basemap")  |>
    addPolygons(data = zone, layerId = "zone") |>
    flyToBounds(lat1 = zone_bb[2], lat2 = zone_bb[4],
                lng1 = zone_bb[1], lng2 = zone_bb[3])
  
  remove_modal_spinner()
}
