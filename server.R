shinyServer(function(input, output) {
  output$basemap <- renderLeaflet({
    leaflet() %>%
      fitBounds(lat1 = nsw_bb[2], lat2 = nsw_bb[4],
                lng1 = nsw_bb[1], lng2 = nsw_bb[3]) %>%
      addProviderTiles("CartoDB.Positron")
  })
  
  observe({
    leafletProxy("basemap") %>%
      clearShapes()
    event <- input$basemap_click
    if (is.null(event)) return()
    
    isolate({
      show_modal_spinner("semipolar")
      show_zone(event$lng, event$lat)
      remove_modal_spinner()
    })
  })
})