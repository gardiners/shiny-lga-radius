library(leaflet)
library(shiny)
library(sf)
library(shinybusy)
library(arcpullr)
source("R/get_geometries.R")

# Things we don't want to recompute in every session:
lgas <- load_lgas()