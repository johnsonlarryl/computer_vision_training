figure;
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

% --- make a 2-D numeric matrix from image 'a'
function A = as_gray2d(a)
  if ndims(a) == 3
    A = mean(double(a), 3);   % RGB -> grayscale (no image pkg needed)
  else
    A = double(a);
  end
end

% --- bar3 replacement using stem3 (Octave)
function h = bar3_oct(Z, step)
  if nargin < 2 || isempty(step), step = 1; end
  Z = double(Z);
  if isvector(Z)
    Z = Z(:);                 % ensure 2-D (n x 1) if vector
  end
  % downsample (optional)
  Z = Z(1:step:end, 1:step:end);
  [nr, nc] = size(Z);
  [X, Y] = meshgrid(1:nc, 1:nr);

  % use vectorized inputs so sizes always match
  h = stem3(X(:), Y(:), Z(:));
  colormap(gray);
  axis tight;
  view(45, 60);
  title(sprintf('bar3_oct (downsample step = %d)', step));
end


A = as_gray2d(a);
figure;
surf(A); shading interp; colormap(gray); axis tight; view(45,60);
title('Surface plot of pixel intensities');

drawnow;
disp('Close the figure to exit (or press RETURN).');
% EITHER ONE of the following:
waitfor(gcf);     % keeps window until you close it
% pause;          % or just pause for RETURN