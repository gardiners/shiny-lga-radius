show_zone <- function(x, y){
  poi <- coords_to_sf(x, y)
  zone <- find_zone(poi, lgas)
  zone_bb <- unname(st_bbox(zone))
  
  leafletProxy("basemap") %>% 
    addPolygons(data = zone, layerId = "zone") %>%
    flyToBounds(lat1 = zone_bb[2], lat2 = zone_bb[4],
                lng1 = zone_bb[1], lng2 = zone_bb[3])
}
