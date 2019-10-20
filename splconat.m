function [alpha,V] = splconat(f,k,t)
%
% function [alpha,V] = splconat(f,k,t)
%
% retourneer coefficienten natuurlijke spline interpolant
% functie f op knikpuntenrij t

% Jasper van den Eshof, 1997

% eis dat tweede afgeleide op rand = 0 
links = [];
for j = -k:length(t)-2, links = [ links bspldval(j,k,t,t(1),2) ];, end
rechts = [];
for j = -k:length(t)-2, rechts = [ rechts bspldval(j,k,t,t(length(t)),2) ];, end

V = sparse([ links; bsplvander(k,t,t); rechts]);

x = t;
f = eval(f)';
f = [0; f; 0];
alpha = V \ f;