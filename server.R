shinyServer(function(input, output) {
  # Load the basemap, fit to NSW
  output$basemap <- renderLeaflet({
    leaflet() |>
      fitBounds(lat1 = -37, lat2 = -28.3,
                lng1 = 141, lng2 = 154) |>
      addProviderTiles("CartoDB.Positron")
  })
 
  # "Getting started" modal
  show_intro()
  
  # Convert slider input from km to metres
  radius <- reactive({input$radius_slider * 1000})
  radius_d <- radius |> debounce(millis = 500)
  
  # Update or add allowed zone
  observe({
    leafletProxy("basemap") |>
      clearShapes()
    event <- input$basemap_click
    if (is.null(event)) return()
    
    show_zone(x = event$lng,
              y = event$lat,
              radius = (radius_d()))
  })
})