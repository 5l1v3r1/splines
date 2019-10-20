function y = bspldval(j,k,t,x,d)
%
% function y = bspldval(j,k,t,x,d)
%
% retourneer d'e afgeleide B-spline Bjk in x
%
% Voorbeeld:
%    plot(0:0.01:1,bspldval(3,3,0:0.1:1,0:0.01:1,2))

% Jasper van den Eshof, 1997

if d <= 0, y = bsplval(j,k,t,x);,return,end

tj   = t(max(j+1,1));
tj1  = t(max(j+2,1));
tjk  = t(min(j+k+1,size(t,2))); 
tjk1 = t(min(j+k+2,size(t,2)));

% recursie

if tj ~= tjk,
   y = k*bspldval(j,k-1,t,x,d-1)/(tjk-tj);
else
   y = zeros(size(x));
end

if tj1 ~= tjk1
   y = y - k*bspldval(j+1,k-1,t,x,d-1)/(tjk1-tj1);
end
