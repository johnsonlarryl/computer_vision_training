#!/usr/bin/env python3

from ImageUtilities import createImageF, imageReadL, showImageL
import os.path
from PlotUtilities import plot3DColorHistogram
from PrintUtilities import printImageRangeL

from Chapter1 import Input

BASE_DIR = Input.__path__[0]
IMAGE_FILE_LOCATION = os.path.join(BASE_DIR, "SmoothSquare.png")

# Read image into array
inputImage, width, height = imageReadL(IMAGE_FILE_LOCATION)

# Show input image
showImageL(inputImage)

# Print pixel's values in an image range
printImageRangeL(inputImage, [0, width - 1], [0, height - 1])

# Create an image to store the z value for surface
outputZ = createImageF(width, height)

# Three float arrays to store colours of the surface
colorsRGB = createImageF(width, height, 3)

# Set the surface and colour values
for x in range(0, width):
    for y in range(0, height):
        pixelValue = float(inputImage[y, x])
        outputZ[y, x] = pixelValue
        pointColour = float(inputImage[y, x]) / 255.0
        colorsRGB[y, x] = [pointColour, pointColour, pointColour]

# Plot histogram to show image
plot3DColorHistogram(outputZ, colorsRGB, [0, 400])
