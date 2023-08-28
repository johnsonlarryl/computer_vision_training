file_util;

file_location = get_image_file_location("Chapter1/Input/SmoothSquare.png");

# Read in an image
a = imread(file_location)

# View image
imagesc(a)

# View it in black and white
disp('We shall display the data as a grey level image')
colormap(gray);

# Let's hold so view can view it
 disp('When you are ready to move on, press RETURN')
 pause;

# disp('Now we shall display the data as a surface')
# bar3(a); This function is implemented in MATLAB, but not Octave
