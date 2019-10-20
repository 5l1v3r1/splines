function x = schoenval(k,t)
%
% function x = schoenval(k,t)
%
% retourneer schoenberg punten van k'e orde op
% knikpuntenrij t

% Jasper van den Eshof, 1997

tster = t(1);
x = [ tster ];

for j = 2-k:size(t,2)-1
    tster = tster + ( t(min(j+k,size(t,2))) - t(max(j,1)) )/k;
    x = [ x tster ];
end