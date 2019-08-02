## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6,
  fig.height = 4)


## ----setup, include = FALSE----------------------------------------------
library(topoDistance)
library(gdistance)
library(RColorBrewer)
library(scales)

## ------------------------------------------------------------------------
plot(Yosemite$DEM, col = terrain.colors(99))

## ------------------------------------------------------------------------
xy <- matrix(ncol = 2, byrow = TRUE,
             c(-119.5566, 37.72474,
               -119.5157, 37.76688,
               -119.4718, 37.76078))
colnames(xy) <- c("longitude", "latitude")
xy

## ------------------------------------------------------------------------
tdist <- topoDist(Yosemite$DEM, xy, paths = TRUE)
tdist

## ------------------------------------------------------------------------
topoPathMap(Yosemite$DEM, xy, topoPaths = tdist, type = "hillshade",
            pathWidth = 4, cex = 2, bg = "blue")

## ------------------------------------------------------------------------
sdmColors <- colorRampPalette(c("blue", "green", "yellow", "orange", "red"), space = "rgb", interpolate = "linear")
plot(Yosemite$SDM, col = sdmColors(99))

## ------------------------------------------------------------------------
tLCP <- topoLCP(Yosemite$DEM, costSurface = Yosemite$SDM, pts = xy, paths = TRUE)
tLCP

## ------------------------------------------------------------------------
topoPathMap(Yosemite$DEM, xy, topoPaths = tLCP, type = "hillshade",
            costSurface = Yosemite$SDM, pathWidth = 4, pathColor = "purple")

## ------------------------------------------------------------------------
topoPathMap(Yosemite$DEM, xy, topoPaths = tLCP, type = "hillshade",
            costSurface = Yosemite$SDM, pathWidth = 4, pathColor = "purple")
lines(tdist[[2]], lty = 2, lwd = 2)

## ---- warning=FALSE------------------------------------------------------
topoProfile(Yosemite$DEM, topoPaths = tLCP, pts = 1000, 
            type = "base", singlePlot = TRUE)

