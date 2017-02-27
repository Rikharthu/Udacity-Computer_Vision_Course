clc;

im=imread('peppers.png');
whos im
% extract the green (2nd, rGb) layer (plane)
imgreen = im(:,:,2); % all the rows, all the columns, 2nd layer
whos imgreen
% notice that im is 384x512x3 matrix, but imgreen is just 384x512 
% => one layer

% show the images
imshow(im)
figure
imshow(imgreen)
% draw a red line
line([1 512], [256 256], 'color','r') %[x1 x2],[y1,y2]
% plot 256th row's intensities
figure 
plot(imgreen(256,:));
