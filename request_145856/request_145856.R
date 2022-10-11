library(raster)
library(rgdal)

test <- new("RasterLayer", file = new(".RasterFile", name = "C:\\Users\\nikos\\OneDrive\\Desktop\\tst\\evi.tif", 
                              datanotation = "FLT8S", byteorder = "little", nodatavalue = -Inf, 
                              NAchanged = FALSE, nbands = 1L, bandorder = "BIL", offset = 0L, 
                              toptobottom = TRUE, blockrows = 256L, blockcols = 256L, driver = "gdal", 
                              open = FALSE), data = new(".SingleLayerData", values = logical(0), 
                                                        offset = 0, gain = 1, inmemory = FALSE, fromdisk = TRUE, 
                                                        isfactor = FALSE, attributes = list(), haveminmax = FALSE, 
                                                        min = Inf, max = -Inf, band = 1L, unit = "", names = "evi"), 
    legend = new(".RasterLegend", type = character(0), values = logical(0), 
                 color = logical(0), names = logical(0), colortable = logical(0)), 
    title = character(0), extent = new("Extent", xmin = 983600, 
                                       xmax = 1033100, ymin = 976000, ymax = 1028800), rotated = FALSE, 
    rotation = new(".Rotation", geotrans = numeric(0), transfun = function () 
      NULL), ncols = 495L, nrows = 528L, crs = new("CRS", projargs = "+proj=lcc +lat_0=28.62510126 +lon_0=77 +lat_1=28.375 +lat_2=28.875 +x_0=1000000 +y_0=1000000 +datum=WGS84 +units=m +no_defs"), 
    history = list(), z = list())

gf <- focalWeight(test, 0.2, "Gauss")
r_gf <- focal(test, w = gf)


blurr_it <- function(raster_obj, sigma_val){
  gf <- focalWeight(raster_obj, sigma_val, "Gauss")
  r_gf <- focal(raster_obj, w = gf)
  
  writeRaster(r_gf, paste0("path/evi_",10 * sigma_val,".tif"))
}


lapply(seq.default(from = 0.2, by = 0.05, length.out = 15),
       blurr_it, raster_obj = evi)