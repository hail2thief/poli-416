# Hexagon sticker

## clear space
rm(list=ls())

## load libraries
library(hrbrthemes)
library(hexSticker)
library(viridis)
library(scales)
library(tidyverse)


## conflict class
peitler_2 = png::readPNG("bomb.png")

peitler_2 <- grid::rasterGrob(peitler_2, width = .7, x = .6, y = 0.5,
                              interpolate = TRUE)


gg <- ggplot() +
  annotation_custom(peitler_2) +
  #annotation_custom(dna) + 
  ## annotation_custom(dom) +
  theme_void()
gg

sticker(gg, package="POLI-416",h_fill = '#D3D3D3',h_color = '#73000a',
        p_size=8, s_x=1, s_y=.75, s_width=1.3, s_height=1,
        p_family = "Aller_Lt", p_color = '#73000a', 
        filename = 'static/images/POLI416.png')
