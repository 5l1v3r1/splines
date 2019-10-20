function ret = splval(x, t, k, alpha)
% function ret = splval(x, t, k, alpha)
%
% evalueer k'e orde spline met coefficienten alpha
% op knikpunten-rij t in x

% Jasper van den Eshof, 1997

% dit is vaak sneller
if length(x) > 1,
   ret = (bsplvander(k,t,x) * alpha(1:length(t)-1+k))';
   return;
end

if x < t(1), ret = 0;, return, end;

% zoek interval j zodat x in [ t(j), t(j+1) ) 

j = find( t > x);
if  isempty(j), ret = alpha(length(t)+k-1);, return, end;
j = j(1) - 1;

% bouw driehoek op met benodigde alpha waarden
% van rechts naar links en van onder naar boven

for l = 0:k-1

    for i = j+k:-1:j+l+1

        tjkml = t(min(i-l,size(t,2)));      % tjkml = t[j+k-l]
        tj = t(max(i-k,1));                 % tj    = t[j]

        v = tjkml - tj;                     % v     = t[j+k-l] - t[j]

        if v == 0
           alpha(i) = 0;
        else 
           alpha(i) = ( alpha(i-1)*(tjkml-x) + alpha(i) * (x-tj))/v;
        end
    end
end

ret = alpha(j+k);
