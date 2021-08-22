shinyServer(function(input, output) {
  # Load the basemap, fit to NSW
  output$basemap <- renderLeaflet({
    leaflet() %>%
      fitBounds(lat1 = nsw_bb[2], lat2 = nsw_bb[4],
                lng1 = nsw_bb[1], lng2 = nsw_bb[3]) %>%
      addProviderTiles("CartoDB.Positron")
  })
  
  # Convert slider input from km to metres
  radius <- reactive({input$radius_slider * 1000})
  radius_d <- radius |> debounce(millis = 500)
  
  # Update or add allowed zone
  observe({
    leafletProxy("basemap") %>%
      clearShapes()
    event <- input$basemap_click
    if (is.null(event)) return()
    
      show_zone(x = event$lng,
                y = event$lat,
                radius = (radius_d()))
  })
})