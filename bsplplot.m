function bsplplot(j,k,t)
%
% function bsplplot(j,k,t)
%
% Plot  B-spline Bjk op knikpuntenrij t

% Jasper van den Eshof, 1997

% Controle op invoer waarden
if size(t,2) < 2,error('t moet minimaal 2 elementen bevatten!'),end
if k<0, error('Ongeldige waarde voor k (<0)'), end
if j<-k | j>size(t,2)-2, error('Ongeldige waarde voor j'), end

% alphas
a = zeros(1,length(t)+k-1);
a(j+k+1)=1;
splplot(k,t,a);
title(['j = ',num2str(j),', k = ',num2str(k)]);