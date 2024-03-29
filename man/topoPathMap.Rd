% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/topoPathMap.R
\name{topoPathMap}
\alias{topoPathMap}
\title{Map of topographic paths}
\usage{
topoPathMap(
  DEM,
  pts,
  topoPaths,
  type = "hillshade",
  costSurface = NULL,
  costColors = NULL,
  pathWidth = 2,
  pathColor = "darkred",
  alpha = 0.65,
  angle = 45,
  direction = 0,
  cex = 2,
  bg = "gray",
  col = "black",
  pch = 21,
  ...
)
}
\arguments{
\item{DEM}{A RasterLayer for digital elevation model (DEM) data.}

\item{pts}{A SpatialPoints object or two-column matrix with xy coordinates for the geographic points from which to calculate pairwise distances and paths.}

\item{topoPaths}{A SpatialLines object containing the topographic paths to be plotted.}

\item{type}{character (default = "hillshade"). Type of map on which to plot topographic paths: "hillshade", "terrain", or "topo".}

\item{costSurface}{(optional) A RasterLayer for the conductance (inverse of resistance) values for each cell.}

\item{costColors}{(optional) A function that takes an integer argument (the required number of colors) and returns a character vector of colors (see rgb) interpolating the given sequence (similar to heat.colors or terrain.colors), such as the one returned by colorRampPalette.}

\item{pathWidth}{numeric (default = 2). Width for drawing path line.}

\item{pathColor}{character (default = "darkred"). Color for drawing path line.}

\item{alpha}{numeric (default = 0.65). Alpha transparency for drawing path line.}

\item{angle}{numeric (default = 45). Angle of lighting for hillshade maps, only (type = "hillshade").}

\item{direction}{numeric (default = 0). Direction of lighting for hillshade maps, only (type = "hillshade").}

\item{cex}{numeric (optional). Point size.}

\item{bg}{character (optional). Background color for spatial points.}

\item{col}{character (optional). Color for spatial points.}

\item{pch}{numeric (optional). Shape of spatial points.}

\item{...}{character, logical, or numeric (optional). Additional arguments to be passed to the plot function.}
}
\value{
Plot of topographic paths
}
\description{
Plots a map of topographic paths on a landscape layer
}
\details{
The objects supplied for the DEM and pts arguments (and, optionally, costSurface) are generally those used to calculate the topographic paths using topoDist or topoLCP.

For the type argument, choosing "hillshade" will plot a shaded relief map, "terrain" will plot a map with terrain colors, and "topo" will plot a map with topo colors.

Optional arguments can be supplied to control the size (cex), shape (pch), and color (bg and col) of the points.
}
\examples{
xy <- matrix(ncol = 2, byrow = TRUE,
   c(-119.5566, 37.72474,
   -119.4718, 37.76078))
YosPaths <- topoDist(Yosemite$DEM, xy, paths = TRUE)
topoPathMap(Yosemite$DEM, xy, topoPaths = YosPaths)
}
