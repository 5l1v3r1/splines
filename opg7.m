function opg7(l)
%
% Opgave 7
%
% function opg7(l)
%
% l : aantal keer projecteren

if nargin == 0, l = 1;, end;
Lenna = full(255 * eye(200,200));
%Lenna = tril(255*ones(size(Lenna)));

ml = max(max(Lenna));
sl = std(std(Lenna));

ty = [1 3:(size(Lenna,1)-2) size(Lenna,1)];
sy = 1:size(Lenna,1);

tx = [1 3:(size(Lenna,2)-2) size(Lenna,2)];
sx = 1:size(Lenna,2);

figure(1);
grayimage(Lenna,255);
title('Het origineel');

disp(' ');
disp('Smoothing vertikaal');

A = SmoothMatrix(Lenna,sy,ty,l);

disp(' ');
disp('Smoothing Horizontaal');
B = SmoothMatrix(A',sx,tx,l);

A = SmoothRe(B,sx,tx);
Lenna = SmoothRe(A',sy,ty);

Lenna = (ml/max(max(Lenna))) * Lenna;
%Lenna = Lenna - max(max(Lenna)) + ml;
%Lenna = sl*Lenna/std(std(Lenna)) ;
%min(min(Lenna))

figure(2);
grayimage(Lenna,255);
title('De gelifte versie');
