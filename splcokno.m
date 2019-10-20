function [alpha,V] = splcokno(f,k,t)
%
% function [alpha,V] = splcokno(f,k,t)
%
% retourneer coefficienten "knikloze rand spline interpolant"
% functie f op knikpuntenrij t, met extra steunpunten in
% (t(1)+t(2))/2 en (t(length(t)-1)+t(length(t)))/2
% extra steunpunten

% Jasper van den Eshof, 1997

x = sort([t (t(1)+t(2))/2 (t(length(t)-1)+t(length(t)))/2 ]);
V = bsplvander(k,t,x);

f = eval(f)';
alpha = V \ f;