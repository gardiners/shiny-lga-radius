# shiny-lga-radius

<!-- badges: start -->

<!-- badges: end -->

[Current NSW COVID-19 lockdown orders](https://www.nsw.gov.au/covid-19/rules) (at 22 August 2021) allow travel for essential shopping within your own Local Government Area or up to 5km from your home. This R/Shiny app displays the union of your 5km radius and the extent of your own LGA.

A deployed example of this app is running at <https://gardiners.shinyapps.io/shiny-lga-radius/>.

-   **Click** or **tap** to check a location.
-   **Drag** to pan the map.
-   **Scroll** or **pinch** to zoom
-   Change the radius with the slider.

If self-hosting, the app will fetch NSW LGA boundaries from the ABS, which may take several minutes depending on the speed of your connection. On future runs, stored boundaries will be used. If you want to use LGAs for other states, tweak the function [`load_lgas()`](blob/master/R/get_geometries.R).

Always check official NSW Government sources for the [latest COVID-19 rules](https://www.nsw.gov.au/covid-19/rules). Do not rely on a shiny app you found online for public health information.

[LGA boundary data](https://www.abs.gov.au/websitedbs/D3310114.nsf/home/Digital+Boundaries) is provided by the Australian Bureau of Statistics. The ABS 2020 LGA mesh block approximation is used.
