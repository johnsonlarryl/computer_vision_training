graphics_toolkit qt;   % optional but good on macOS
figure;
file_util;

file_location = get_image_file_location("Chapter1/Input/SmoothSquare.png");

% Read in an image
a = imread(file_location);   % <-- semicolon avoids printing the matrix

% View image
imagesc(a); axis image off;

% View it in black and white
disp('We shall display the data as a grey level image');
colormap(gray);

% Let's hold so you can view it
disp('When you are ready to move on, press RETURN');
pause;

% Keep windows open when run via --eval
disp('Close the figure to exit (or press RETURN).');
waitfor(gcf);   % or: pause;

% ====== local helper functions MUST be at the end ======
function A = as_gray2d(a)
  if ndims(a) == 3
    A = mean(double(a), 3);   % RGB -> grayscale
  else
    A = double(a);
  end
end

function h = bar3_oct(Z, step, width)
  if nargin < 2 || isempty(step),  step  = 1;   end
  if nargin < 3 || isempty(width), width = 0.8; end
  if width <= 0 || width > 1, error('width must be in (0,1].'); end

  Z = double(Z);
  if isvector(Z), Z = Z(:); end
  Z = Z(1:step:end, 1:step:end);

  [nr, nc] = size(Z);
  if nr == 0 || nc == 0, error('bar3_oct:Empty','Z empty after downsampling.'); end

  maxBars = nnz(isfinite(Z));
  verts = zeros(maxBars*8, 3);
  faces = zeros(maxBars*6, 4);
  cdata = zeros(maxBars*8, 1);
  vptr = 0; fptr = 0;

  for r = 1:nr
    for c = 1:nc
      z = Z(r,c);
      if ~isfinite(z) || z == 0, continue; end
      x0 = c - width/2;  x1 = c + width/2;
      y0 = r - width/2;  y1 = r + width/2;
      z0 = 0;            z1 = z;

      V = [ x0 y0 z0;  x1 y0 z0;  x1 y1 z0;  x0 y1 z0; ...
            x0 y0 z1;  x1 y0 z1;  x1 y1 z1;  x0 y1 z1 ];
      F = [ 1 2 3 4;  5 6 7 8;  1 2 6 5;  2 3 7 6;  3 4 8 7;  4 1 5 8 ];

      verts(vptr+(1:8), :) = V;
      cdata(vptr+(1:8), 1) = z;
      faces(fptr+(1:6), :) = F + vptr;

      vptr = vptr + 8;
      fptr = fptr + 6;
    end
  end

  verts = verts(1:vptr, :);
  faces = faces(1:fptr, :);
  cdata = cdata(1:vptr, :);

  h = patch('Vertices',verts,'Faces',faces,'FaceVertexCData',cdata, ...
            'FaceColor','flat','EdgeColor',[0.3 0.3 0.3],'CDataMapping','scaled');

  axis tight vis3d; view(45,60); box on; colormap(gray);
  camlight headlight; lighting gouraud;
  xlabel('column'); ylabel('row'); zlabel('intensity');
end

% ----- Surface plot (MATLAB bar3 alternative) -----
A = as_gray2d(a);
figure;
surf(A); shading interp; colormap(gray); axis tight; view(45,60);
title('Surface plot of pixel intensities');
drawnow;

% Keep windows open when run via --eval
disp('Close the figure to exit (or press RETURN).');
waitfor(gcf);   % or: pause;

% ----- Discrete bars (bar3 replacement) -----
figure;
bar3_oct(A, 1, 0.85);             % step=1 (no downsample), width=0.85
title('bar3\_oct of pixel intensities');
drawnow;

% Keep windows open when run via --eval
disp('Close the figure to exit (or press RETURN).');
waitfor(gcf);   % or: pause;

