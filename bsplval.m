function y = bsplval(j,k,t,x)
%
% retourneer waarden B-spline Bjk op knikpuntenrij t in x

% Jasper van den Eshof, 1997

% alphas
alpha = zeros(1,size(t,2)+k-1);
alpha(j+k+1)=1;

y=[];,for y2 = x,y = [y splval(y2,t,k,alpha)];, end;