suppressMessages(library(ggmap))
suppressMessages(library(tidyverse))

load("Bude_map.RData")

# first plot the roadmap and watercolor map of Bude, not centered at the cricket ground

bude.roadmap <- ggmap(bude.road) +
  geom_point(
    aes(x = lon, y = lat),
    data =gc.bude, color = "green", size = 3
  ) +
  geom_text(data = gc.bude, aes(label = "Bude, UK"), hjust = 1.3)

bude.watercolormap <- ggmap(bude.watercolor) +
  geom_point(
    aes(x = lon, y = lat), 
    data = gc.bude, color = "green", size = 3
  ) +
  geom_text(data = gc.bude, aes(label = "Bude, UK"), hjust= 1.3)

# plot the roadmap with points marking beaches, the cricket ground and Bar 35
road <- ggmap(roadmap) +
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
  geom_text(data = gc.cricket, aes(label = label.cricket), hjust = 0.7, vjust = 2) +
  geom_text(data = gc.bar, aes(label = label.bar), hjust = 1.3) + # add labels to geom points
  # add points for the two hotels and label them
  geom_point(aes(x = lon, y = lat), data = hotel1, color = "orange", size = 3) +
  geom_point(aes(x = lon, y = lat), data = hotel2, color = "orange", size = 3) +
  geom_text(data = hotel1, aes(label = label.hotel1), hjust = 0.7, vjust = -1) +
  geom_text(data = hotel2, aes(label = label.hotel2), hjust = 1.1)


# plot the watercolor map with points marking beaches, the cricket ground and Bar 35
water <- ggmap(watercolor) +
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
  geom_text(data = gc.cricket, aes(label = label.cricket), hjust = 0.7, vjust = 2) +
  geom_text(data = gc.bar, aes(label = label.bar), hjust = 1.3) + # add labels to geom points
  # add points for the two hotels and label them
  geom_point(aes(x = lon, y = lat), data = hotel1, color = "orange", size = 3) +
  geom_point(aes(x = lon, y = lat), data = hotel2, color = "orange", size = 3) +
  geom_text(data = hotel1, aes(label = label.hotel1), hjust = 0.7, vjust = -1) +
  geom_text(data = hotel2, aes(label = label.hotel2), hjust = 1.1)

