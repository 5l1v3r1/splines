function grayimage(img,ngray)

% gejat uit wavelab - library

if nargin < 2,
   ngray = 255;
end;

% clg;
image(img);
axis('image');
colormap(gray(ngray));
