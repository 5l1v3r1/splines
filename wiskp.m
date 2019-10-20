function s = wiskp(x,t,m)
%
% function s = wiskp(x,t,m)
%
% retourneer knikpunten rij als t maar mult. van x
% met m verlaagd
% Als m niet wordt meegegeven wordt x uit de 
% gehele rij verwijderd

% Jasper van den Eshof, 1997

h = mult(x,t);
if nargin < 3, m = h;, end;
s = nieuwkp(x,t(find(t ~= x)),h - min(h,m));