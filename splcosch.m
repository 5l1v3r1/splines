function alpha = splcosch(f,k,t)
%
% function alpha = splcoef(f,k,t)
%
% retourneer coefficienten "schoenberg variatie
% vervagende spline benadering" f op knikpuntenrij t

% Jasper van den Eshof, 1997

x = schoenval(k,t);
alpha = eval(f);