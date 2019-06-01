# Hexagon sticker

## clear space
rm(list=ls())

## load libraries
library(hrbrthemes)
library(hexSticker)
library(viridis)
library(scales)
library(tidyverse)


# maoist propaganda
mao = png::readPNG('/Users/juanftellez/TEMP/image.png')

mao = grid::rasterGrob(mao, interpolate = TRUE)

# gg <- ggplot() +
#   annotation_custom(mao) +
#   #annotation_custom(dna) +
#   ## annotation_custom(dom) +
#   theme_void()
# gg
# 

# sticker(gg, package="POLI-416",h_fill = '#f99a9a',h_color = '#73000a',
#         p_size=8, s_x=1, s_y=.75, s_width=1.3, s_height=1, white_around_sticker = F,
#         p_family = "Helvetica", p_color = 'black', 
#         filename = 'static/images/POLI416.png')


l <- 1
hex <- data_frame(
  x = 1.35 * l * c(-sqrt(3) / 2, 0, rep(sqrt(3) / 2, 2), 0, rep(-sqrt(3) / 2, 2)),
  y = 1.35 * l * c(0.5, 1, 0.5, -0.5, -1, -0.5, 0.5)
)

theme_hex <- theme_void() + theme_transparent() +
  theme(axis.ticks.length = unit(0, "mm"))


# Create empty hexagon
logo <- ggplot() +
  geom_polygon(data = hex, aes(x, y), color = "#73000a", fill = "#DFE4DE",
               size = 2) +
  annotate(geom = "text", label = "POLI-416", 
           x = 0, y = -.7, 
           color = "#73000a", fontface = "bold", size = 8, 
           family = 'Roboto Condensed') +
  annotation_custom(mao, xmin = -Inf, xmax = Inf, ymin = -0.5, ymax = 0.9) +
  coord_equal(xlim = range(hex$x), ylim = range(hex$y)) +
  scale_x_continuous(expand = c(0.04, 0)) +
  scale_y_continuous(expand = c(0.04, 0)) +
  theme_hex
logo

png("static/images/POLI416.png", width = 181, height = 210, bg = "transparent")
print(logo)
dev.off()

# logo_large <- ggplot() +
#   geom_polygon(data = hex, aes(x, y), color = "#0051BA", fill = "white",
#                size = 10) +
#   annotate(geom = "text", label = "jayhawkdown", x = 0, y = -0.55,
#            family = "Trajan Pro", color = "#0051BA", fontface = "bold", size = 30) +
#   annotation_custom(mao, xmin = -1.1, xmax = 1.1, ymin = -0.5, ymax = 0.9) +
#   coord_equal(xlim = range(hex$x), ylim = range(hex$y)) +
#   scale_x_continuous(expand = c(0.04, 0)) +
#   scale_y_continuous(expand = c(0.04, 0)) +
#   theme_hex
# logo_large


png("static/images/POLI416-large.png", width = 905, height = 1050, bg = "transparent")
print(logo)
dev.off()
