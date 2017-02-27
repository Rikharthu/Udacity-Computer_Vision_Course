clc 
% Load and dispaly an image
img = imread('peppers.png');
imshow(img)

% Image size:
size(img) % x, y, layers

% Image class or data type:
class(img)

%% Inspect image values
clc
img = imread('peppers.png');
imshow(img)
size(img)

% At a given location (row, col)
img(50,100)

% From an entire row:
line([1 512],[200 200],'color','r')
figure
plot(img(200,:))

% A slice of the image:
img(101:103,201:203)

%% Crop an image
clc
img = imread('cell.tif');
imshow(img)
size(img)
cropped = img(1:100,50:150); %y1:y2, x1:x2 (rows, columns)
figure('Name','Cropped cell')
imshow(cropped)
size(cropped)

%% Color Plane
clc
img = imread('office_4.jpg');
imshow(img)

image_size = size(img)
rows=image_size(1)
columns=image_size(2)
color_planes=image_size(3)

% Select a single color plane
img_red=img(:,:,1);
img_green=img(:,:,2);
img_blue=img(:,:,3);
% they don't have third channel value
size(img_red)
size(img_green)
size(img_blue)

figure('Name','Red channel')
imshow(img_red)
figure('Name','Green channel')
imshow(img_green)
figure('Name','Blue channel')
imshow(img_blue)

figure('Name','Red intensity')
plot(img_red(150,:))
figure('Name','Green intensity')
plot(img_red(150,:))
figure('Name','Blue intensity')
plot(img_blue(150,:))

%% Add two images
clc
peppers = imread('peppers.png');
pears = imread('pears.png');
% image sizes must be equal => crop pears
pears=pears(1:384,1:512,:);

figure('Name','peppers')
imshow(peppers);
disp('peppers image size:');
size(peppers)

figure('Name','pears')
imshow(pears);
disp('pears image size:');
size(pears)

% summ-up matrices 
summed = peppers+pears;
figure('Name','summed')
imshow(summed);
disp('summed image size:');
size(summed)

% divide intensities by two, to keep intensity maximums
average= peppers/2+pears/2;
figure('Name','average')
imshow(average);
disp('average image size:');
size(average)

% ACHTUNG! (peppers+pears)/2 is not the same as peppers/2+pears/2
% since in (peppers+pears) resulting intensities can exceed 255, 
% but they will be scaled down to 255 (uint8) and only then /2
% thus the resulting image will be darker
% example: (127+230)=352 -> scaled to 255. 255/2=127.5=127
% 127/2+230/2 = 178.5 = 178 => lighter than 127
average_alt= (peppers+pears)/2;
figure('Name','average_alt')
imshow(average_alt);

%% Multiply by a scalar
clc
peppers = imread('peppers.png');
imshow(peppers)

figure('Name','Dark peppers')
imshow(peppers/2)
figure('Name','Light peppers')
imshow(peppers*1.5)

% function
scale = @(image,scale)image*scale;
figure('Name','Scaled peppers')
imshow(scale(peppers,3))

%% Image difference
clc
peppers = imread('peppers.png');
pears = imread('pears.png');
% image sizes must be equal => crop pears
pears=pears(1:384,1:512,:);

figure('Name','peppers')
imshow(peppers);
disp('peppers image size:');
size(peppers)

figure('Name','pears')
imshow(pears);
disp('pears image size:');
size(pears)

difference = pears-peppers;
figure('Name','difference')
imshow(difference);

difference_alt = peppers-pears;
figure('Name','difference_alt')
imshow(difference_alt);

% Absolute difference (order deosnt matter)
% 8-56=0 since unsigned int
% use (a-b)+(b-a). (a-b) will yield correct result if a>b and 0 if a<b...
% same princpiple with (b-a)
abs_diff=abs((pears-peppers)+(peppers-pears));
figure('Name','abs_diff')
imshow(abs_diff);

% Better: Use image package
abs_diff_alt=imabsdiff(pears,peppers); % order doesn't matter
figure('Name','abs_diff_alt')
imshow(abs_diff_alt);