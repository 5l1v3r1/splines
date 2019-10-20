function A = SmoothReconstruct(AlphaNew,s,t)

t = [1 3:size(AlphaNew,1)-2 size(AlphaNew,1)];
s = 1:(size(AlphaNew,1)-1)/(length(s)-1):size(AlphaNew,1);
V = bsplvander(3,t,s);
A = V*AlphaNew;

