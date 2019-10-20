function [alpha,V] = splcocla(f,k,t,fa1,fb1)
%
% function [alpha,V] = splcocla(f,k,t,fa1,fb1)
%
% retourneer coefficienten spline geklemde spline
% interpolant van functie f op knikpunten t
% fa1, fb1 zijn de eerste afgeleide in respectievelijk
% het rechter en linker randpunt

% Jasper van den Eshof, 1997

% eis dat afgeleide op randen = [fa1,fb1]
links = [];
for j = -k:length(t)-2, links = [ links bspldval(j,k,t,t(1),1) ];, end
rechts = [];
for j = -k:length(t)-2, rechts = [ rechts bspldval(j,k,t,t(length(t)),1) ];, end

V = sparse([ links; bsplvander(k,t,t); rechts]);

x = t;
f = eval(f)';
f = [fa1; f; fb1];
alpha = V \ f;
