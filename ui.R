shinyUI(fillPage(
  # GitHub buttons
  tags$head(tags$script(src ="https://buttons.github.io/buttons.js", async = NA, defer = NA)),
  
  # Leaflet map
  leafletOutput("basemap", width = "100%", height = "100%"),
  
  # Controls
  absolutePanel(top = 10, right = 10, width = "25%",
                sliderInput("radius_slider",
                            "Radius",
                            min = 1, max = 10, value = 5, step = 1,
                            ticks = TRUE,
                            round = TRUE,
                            post = "km"
                )
  ),
  
  # Links
  absolutePanel(bottom = 0, left = 5,
                HTML(r'(<a class="github-button" href="https://github.com/gardiners" data-show-count="true" aria-label="Follow @gardiners on GitHub">Follow @gardiners</a>
                     <a class="github-button" href="https://github.com/gardiners/shiny-lga-radius/fork" data-show-count="true" aria-label="Fork gardiners/shiny-lga-radius on GitHub">Fork</a>)')
  )
)
)