# Load LGA boundaries. Download if necessary.
load_lgas <- function(){
  storage_path <- "data/nsw_complex.rds"
  # ABS spatial services layer. 
  # See https://www.abs.gov.au/AUSSTATS/abs@.nsf/Lookup/1470.0Main+Features12015?OpenDocument
  lga_provider <- "https://geo.abs.gov.au/arcgis/rest/services/ASGS2020/LGA/MapServer/0"
  
  if (file.exists(storage_path)) {
    message("Loading stored LGA geometries")
    readRDS(storage_path)
  } else {
    message("Retrieving LGA geometries from ABS")
    nsw_complex <- get_spatial_layer(lga_provider,
                                     where = "STATE_CODE_2016 = '1'")
    saveRDS(nsw_complex, storage_path)
    nsw_complex
  }
}