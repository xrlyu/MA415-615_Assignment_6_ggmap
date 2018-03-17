library(ggmap)
library(tidyverse)

# Bude road map

gc.bude <- geocode("Bude, UK")

gc.beach1 <- geocode("Summerleaze Beach, UK")
gc.beach2 <- geocode("Crooklets Beach, UK")

gc.cricket <- geocode("Bude North Cornwall Cricket Club, UK")

gc.bar <- geocode("Belle Vue Ln, Bude EX23 8BR, UK")   #Bar 35

beach <- rbind(gc.beach1, gc.beach2)

roadmap <- get_map(gc.cricket, maptype = "roadmap", zoom = 15)

label.beach <- c("Summerleaze Beach", "Crooklets Beach")
label.cricket <- c("Bude North Cornwall Cricket Club")
label.bar <- c("Bar 35")

from <- "Bude North Cornwall Cricket Club, UK"
to <- "Belle Vue Ln, Bude EX23 8BR, UK"
route <- route(from, to, structure = "route")

ggmap(roadmap) +
  geom_point(
    aes(x = lon, y = lat),
    data = beach, color = "blue", size = 3
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = gc.cricket, color = "green", size = 3
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = gc.bar, color = "red", size = 3
  ) +
  geom_path(
    aes(x = lon, y = lat), lineend = "round",
    data = route, color = "yellow", size = 1.5
  ) +
  geom_text(data = beach, aes(label = label.beach), hjust = 1.1, vjust = 2) +
  geom_text(data = gc.cricket, aes(label = label.cricket), hjust = 0.7, vjust = 2) +
  geom_text(data = gc.bar, aes(label = label.bar), hjust = 1.3)


# Bude watercolor map

watercolor <- get_map(gc.cricket, maptype = "watercolor", zoom = 15)

ggmap(watercolor) +
  geom_point(
    aes(x = lon, y = lat),
    data = beach, color = "blue", size = 3
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = gc.cricket, color = "green", size = 3
  ) +
  geom_point(
    aes(x = lon, y = lat),
    data = gc.bar, color = "red", size = 3
  ) +
  geom_path(
    aes(x = lon, y = lat), lineend = "round",
    data = route, color = "yellow", size = 1.5
  ) +
  geom_text(data = beach, aes(label = label.beach), hjust = 1.1) +
  geom_text(data = gc.cricket, aes(label = label.cricket), hjust = 0.7, vjust = 1.5) +
  geom_text(data = gc.bar, aes(label = label.bar), hjust = 1.3)

