library(ggmap)
library(tidyverse)

# Bude road map
gc.bude <- geocode("Bude, UK") # geocode for Bude, UK

gc.beach1 <- geocode("Summerleaze Beach, UK") # geocode for Summerleaze Beach
gc.beach2 <- geocode("Crooklets Beach, UK") # geocode for Crooklets Beach

beach <- rbind(gc.beach1, gc.beach2) # combine geocodes for beaches together

gc.cricket <- geocode("Bude North Cornwall Cricket Club, UK") # geocode for cricket ground

gc.bar <- geocode("Belle Vue Ln, Bude EX23 8BR, UK")   # geocode for a nearby pub: Bar 35

label.beach <- c("Summerleaze Beach", "Crooklets Beach") # label for beaches
label.cricket <- c("Bude North Cornwall Cricket Club") # label for the cricket ground
label.bar <- c("Bar 35") # label for Bar 35

from <- "Bude North Cornwall Cricket Club, UK"
to <- "Belle Vue Ln, Bude EX23 8BR, UK"
route <- route(from, to, structure = "route") # define start and end of the route (from the cricket ground to Bar 35)

roadmap <- get_map(gc.cricket, maptype = "roadmap", zoom = 15) # get the roadmap

# Bude watercolor map
watercolor <- get_map(gc.cricket, maptype = "watercolor", zoom = 15) # get the watercolor map

# save the workspace
save.image(file = "Bude_map.RData")
