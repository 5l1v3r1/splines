function b = bspliszero(j,k,t)
%
% function b = bspliszero(j,k,t)
%
% retourneer 0 als B-Spline j,k op knikpuntenrij t > 0
% anders 0

% Jasper van den Eshof, 1997

% t(j) bevindt zich op index j+1

b = (t(max(j+1,1)) == t(min(j+k+2,length(t))));