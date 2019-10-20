function s = nieuwkp(x,t,m)
%
% function s = nieuwkp(x,t,m)
%
% voeg knikpunt toe met multipliciteit m of
% als x al in t, verhoog multipliciteit met m

% Jasper van den Eshof, 1997

s = sort([t x*ones(1,m)]);