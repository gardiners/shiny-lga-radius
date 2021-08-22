shinyUI(fillPage(
    leafletOutput("basemap", width = "100%", height = "100%"),
    
    absolutePanel(top = 10, right = 10, width = "25%",
                  sliderInput("radius_slider",
                              "Radius",
                              min = 1,
                              max = 10,
                              value = 5,
                              step = 1,
                              ticks = TRUE,
                              round = TRUE,
                              post = "km"
                              )
    )
))