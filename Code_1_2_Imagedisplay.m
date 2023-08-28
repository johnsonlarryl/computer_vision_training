disp("Executing Code_1_2")
file_util;

function inverted = invert(image)
  % Subtract image point brightness from maximm
  % Usage:new image= invert(old_image)
  % Parameters: image - array of points

  ##[rows, cols] = size(image);  # get dimensions
##  maxi = max(max(image)); # find the maxium
##
##  [rows, cols, channels] = size(image);    % Get dimensions of the image
  % subtract image points from maxium
##  for x = 1:cols% address from maximum
##    for y = 1:rows % address all rows
##      inverted(y, x) = maxi - image(y, x);
##    end
##   end
##end

  inverted =max(max(image)) - image
 end




file_location = get_image_file_location("Chapter1/Input/SmoothSquare.png");


# Read in an image
a = imread(file_location);
inverted = invert(a)

  # View image
imagesc(inverted)
# imagesc(a)

 # View it in black and white
disp('We shall display the data as a grey level image')
colormap(gray);


# Let's hold so view can view it
 disp('When you are ready to move on, press RETURN')
 pause;

