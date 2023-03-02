library(mapview)
library(sf)

airports <- read.csv("airports.csv")
ptsAirports <- st_as_sf(airports, coords = c("lat", "long"), crs = 4326)

# mapview(airports, xcol = "lat", ycol = "long") error in loadNamespace(x) : there is no package called 'markdown'

# mapview(airports) + mapview(ptsAirports) Error:
# Oops! Arguments xcol and/or ycol are missing!
#You probably expected airports to be a spatial object.
#However it is a class data.frame.
#Either convert airports to a spatial object or provide xcol and ycol.

#Tried to address comment in prev line by adding xcol, ycol arguments in line 7, only to get error mentioned

# mapview(ptsAirports) doesn't plot in correct locations

redo_ptsAirports <- st_as_sf(airports, coords = c("long", "lat"), crs = 4326)
mapview(redo_ptsAirports)

ptsAirports_crs4269 <- st_as_sf(airports, coords = c("long", "lat"), crs = 4269)
mapview(ptsAirports_crs4269)

mapview(redo_ptsAirports, label = "code", layer.name = "Airports")

Sys.Date()
