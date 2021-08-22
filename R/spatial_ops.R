# Transform click coordinates into sf object with CRS
coords_to_sf <- function(x, y, crs = 4326) {
  st_sf(geoms = st_sfc(st_point(c(x, y))),
        crs = st_crs(crs))
}

# Which LGA does the click fall within?
find_lga <- function(point, lgas){
  st_filter(lgas, point, .predicate = st_intersects)
}

# Generate a locally-projected buffer around the click coordinates
find_circle <- function(point, radius, local_crs) {
  point_proj <- st_transform(point, crs = local_crs)
  st_transform(st_buffer(point_proj,
                         dist = radius),
               crs = st_crs(point))
}

# Find the union of the buffer and the LGA
find_zone <- function(point, lgas, radius = 5000, local_crs = 8058) {
  circle <- find_circle(point, radius = radius, local_crs = local_crs)
  lga <- find_lga(point, lgas)
  
  if (nrow(lga) == 0) {
    circle
  } else {
    st_union(lga, circle)
  }
}
