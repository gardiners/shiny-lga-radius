library(leaflet)
library(shiny)
library(sf)
library(shinybusy)
library(arcpullr)
source("R/get_geometries.R")

# Things we don't want to recompute in every sessions:
lgas <- load_lgas()
nsw_bb <- unname(st_bbox(lgas))