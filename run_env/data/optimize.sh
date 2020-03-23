#!/bin/sh

set -e

gdal_rasterize -l DMA_GEZ -a gez_code -tr 0.00025 0.00025 -a_nodata 255 -te -61.5 15.2 -61.2 15.7 -ot Byte -of GTiff -co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 -co TILED=YES -co BLOCKXSIZE=400 -co BLOCKYSIZE=400 ./raw/DMA_GEZ.geojson DMA_GEZ.tif
gdal_rasterize -l DMA_AL4 -a id -tr 0.00025 0.00025 -a_nodata 255 -te -61.5 15.2 -61.2 15.7 -ot Byte -of GTiff -co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 -co TILED=YES -co BLOCKXSIZE=400 -co BLOCKYSIZE=400 ./raw/DMA_AL4.geojson DMA_AL4.tif
#gdal_translate -projwin -61.5 15.7 -61.2 15.2 -co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 -co TILED=YES -co BLOCKXSIZE=400 -co BLOCKYSIZE=400 ./raw/Hansen_GFC-2018-v1.6_gain_20N_070W.tif Hansen_GFC-2018-v1.6_gain_20N_070W.tif
#gdal_translate -projwin -61.5 15.7 -61.2 15.2 -co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 -co TILED=YES -co BLOCKXSIZE=400 -co BLOCKYSIZE=400 ./raw/Hansen_GFC-2018-v1.6_lossyear_20N_070W.tif Hansen_GFC-2018-v1.6_lossyear_20N_070W.tif
#gdal_translate -projwin -61.5 15.7 -61.2 15.2 -co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 -co TILED=YES -co BLOCKXSIZE=400 -co BLOCKYSIZE=400 ./raw/Hansen_GFC-2018-v1.6_treecover2000_20N_070W.tif Hansen_GFC-2018-v1.6_treecover2000_20N_070W.tif
mkdir -p optimized
gdal_translate -co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 -co TILED=YES -co BLOCKXSIZE=400 -co BLOCKYSIZE=400 ./raw/Hansen_GFC-2018-v1.6_gain_20N_070W.tif ./optimized/Hansen_GFC-2018-v1.6_gain_20N_070W.tif
gdal_translate -co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 -co TILED=YES -co BLOCKXSIZE=400 -co BLOCKYSIZE=400 ./raw/Hansen_GFC-2018-v1.6_gain_20N_080W.tif ./optimized/Hansen_GFC-2018-v1.6_gain_20N_080W.tif
gdalbuildvrt Hansen_GFC-2018-v1.6_gain.vrt optimized/Hansen_GFC-2018-v1.6_gain_*.tif

gdal_translate -co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 -co TILED=YES -co BLOCKXSIZE=400 -co BLOCKYSIZE=400 ./raw/Hansen_GFC-2018-v1.6_lossyear_20N_070W.tif ./optimized/Hansen_GFC-2018-v1.6_lossyear_20N_070W.tif
gdal_translate -co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 -co TILED=YES -co BLOCKXSIZE=400 -co BLOCKYSIZE=400 ./raw/Hansen_GFC-2018-v1.6_lossyear_20N_080W.tif ./optimized/Hansen_GFC-2018-v1.6_lossyear_20N_080W.tif
gdalbuildvrt Hansen_GFC-2018-v1.6_lossyear.vrt optimized/Hansen_GFC-2018-v1.6_lossyear_*.tif

gdal_translate -co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 -co TILED=YES -co BLOCKXSIZE=400 -co BLOCKYSIZE=400 ./raw/Hansen_GFC-2018-v1.6_treecover2000_20N_070W.tif ./optimized/Hansen_GFC-2018-v1.6_treecover2000_20N_070W.tif
gdal_translate -co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 -co TILED=YES -co BLOCKXSIZE=400 -co BLOCKYSIZE=400 ./raw/Hansen_GFC-2018-v1.6_treecover2000_20N_080W.tif ./optimized/Hansen_GFC-2018-v1.6_treecover2000_20N_080W.tif
gdalbuildvrt Hansen_GFC-2018-v1.6_treecover2000.vrt optimized/Hansen_GFC-2018-v1.6_treecover2000_*.tif