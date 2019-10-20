function splplot(k, t, alpha)
%
% splplot(k, t, alpha)
%
% plot k'e orde spline met coefficienten alpha op
% knikpunten rij t

% Jasper van den Eshof, 1997

% instelling

quality        = 150;
printmult      = 1;

% grafische instellingen
whitebg('w');

% maak plotje
% stapgrootte voor ongeveer 'quality' pixels
d = (t(size(t,2)) - t(1)) / quality;

% we evalueren een paar keer extra vlak links en rechts van
% de steunpunten om discontinuteiten scherper af te beelden

extral = t(2:size(t,2)) - eps*1000*ones(1,size(t,2)-1);
extrar = t(1:size(t,2)-1);

% de steunpunten rij waarop de functie wordt geevalueerd
x = sort([t(1):d:t(size(t,2)) extral extrar ]);
h = splval(x,t,k,alpha);

plot(x,h);
hold on;
plotknots(t,printmult);
