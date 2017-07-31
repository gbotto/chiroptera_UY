# Sintaxis para generar la figura S1 del trabajo:
# "Conservación de los murciélagos (Mammalia: Chiroptera) de Uruguay: 
# estado actual y perspectivas" 
# Germán Botto Nuñez, Enrique M. González & Ana Laura Rodales

library(maptools)
library(sp)
library(leaflet)
load("datos_mapa1.RData")
leaflet(width = "100%", height = 800, options = leafletOptions()) %>%
  addProviderTiles("Esri.WorldImagery", group = "Vista Satelital") %>%
  addProviderTiles(providers$CartoDB.Positron, group = "Mapa Base") %>%
  addGraticule(interval = 5, style = list(color = "White", weight = 1)) %>%
  addMiniMap(tiles = providers$Esri.WorldStreetMap, toggleDisplay = TRUE) %>%
  addPolygons(data = ury, color = "Black", weight = 1,
              opacity = 1.0, fillOpacity = 0) %>%
  addPolygons(data = epat, color = cols[1], weight = 1,
              opacity = 1.0, fillOpacity = 0.5, group = "Eumops patagonicus") %>%
  addPolygons(data = mtem, color = cols[2], weight = 1,
              opacity = 1.0, fillOpacity = 0.5, group = "Molossops temminckii") %>%
  addPolygons(data = mruf, color = cols[3], weight = 1,
              opacity = 1.0, fillOpacity = 0.5, group = "Molossus rufus") %>%
  addPolygons(data = edim, color = cols[4], weight = 1,
              opacity = 1.0, fillOpacity = 0.5, group = "Eptesicus diminutus") %>%
  addPolygons(data = hvel, color = cols[5], weight = 1,
              opacity = 1.0, fillOpacity = 0.5, group = "Histiotus velatus") %>%
  addPolygons(data = mrip, color = cols[6], weight = 1,
              opacity = 1.0, fillOpacity = 0.5, group = "Myotis riparius") %>%
  addPolygons(data = plin, color = cols[7], weight = 1,
              opacity = 1.0, fillOpacity = 0.5, group = "Platyrrhinus lineatus") %>%
  addPolygons(data = slil, color = cols[8], weight = 1,
              opacity = 1.0, fillOpacity = 0.5, group = "Sturnira lilium") %>%
  addLayersControl(baseGroups = c(" Vista Satelital", "Mapa Base"),
                   overlayGroups = c("Platyrrhinus lineatus", "Sturnira lilium", 
                                     "Eumops patagonicus", "Molossops temminckii", 
                                     "Molossus rufus","Eptesicus diminutus", 
                                     "Histiotus velatus", "Myotis riparius"), 
                   options = layersControlOptions(collapsed = FALSE, autoZIndex = TRUE)) %>%
  fitBounds(-59, -35.2, -53, -30.1)