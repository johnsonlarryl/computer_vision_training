from ImageUtilities import createImageL, imageReadL, showImageL
import itertools
import os.path
from PlotUtilities import plot3DColorHistogram
from PrintUtilities import printImageRangeL

from Chapter1 import Input

BASE_DIR = Input.__path__[0]
IMAGE_FILE_LOCATION = os.path.join(BASE_DIR, "Zebra.png")
brigthDelta = 80
printRange = [0, 10]

# Read image into array
inputImage, width, height = imageReadL(IMAGE_FILE_LOCATION)

# Output the image
outputImage = createImageL(width, height)

# Set the pixels in the output image
for x, y in itertools.product(range(0, width), range(0, height)):
    outValue = int(inputImage[y, x]) + brigthDelta

    if outValue < 255:
        outputImage[y, x] = outValue
    else:
        outputImage[y, x] = 255

# Show images
showImageL(inputImage)
showImageL(outputImage)

# Print image range
print("Input Image Range: ")
printImageRangeL(inputImage, printRange, printRange)
print("Output Image Range: ")
printImageRangeL(outputImage, printRange, printRange)

