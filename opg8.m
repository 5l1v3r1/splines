function opg8(Optie,extra,doeplot)
%
% Opgave 8
%
% function opg8(Optie,extra,doeplot)
%
% Optie = 'Plot'
%   extra   :
%   doeplot :
%
% Optie = 'Smooth'
%   extra   : delta
%   doeplot :
%
% Optie = 'Agee'
%   extra   : aantal iteraties
%   doeplot : maak plotjes (optioneel)

if strcmp(Optie,'Plot'),

   disp('EW     = eigenwaarde');
   disp('TW     = aantal tekenwisselingen');

   hold on;
   t = 0:0.05:1;
   x = 0:0.005:1;
   s = schoenval(3,t);
   [V,D] = eig(full(bsplvander(3,t,s)));
   [D,I] = sort(diag(D));
   V = V(:,I);
   j = 1;
   for j = 1:size(V,2),
       if rem(j-1,4) == 0 & j > 1,
          disp('Druk op een toets .....');
          pause;
          clf;
       end;

       subplot(2,2,rem(j-1,4)+1);
       splplot(3,t,V(:,j));

       tit = ['EW: ',num2str(D(j)),' TW: ', num2str(count(V(:,j))) ];
       title(tit);
   end;

elseif strcmp(Optie,'Smooth')

   hold on;
   clf;

   t = 0:0.05:1;
   t = 0:0.01:1;
   x = 0:0.005:1;

   s = schoenval(3,t);
   
   f =  sin(s*4*pi) + 0.2*cos(150*pi*s);
   fx = sin(x*4*pi) + 0.2*cos(150*pi*x);

   [V,D] = eig(full(bsplvander(3,t,s)));

   alpha = V*D^(-1)*(D>extra)*V^(-1)*f';
   splplot(3,t,alpha);

   plot(s,f,'bo');
%  plot(x,fx,'c');

   legend('Spline benadering ','Knikpunten','Data ');

elseif strcmp(Optie,'Agee')

   if nargin == 3,
      figure(1);
      clf;
      hold on;
   end;

   t = 0:0.05:1;
   t = 0:0.01:1;
   x = 0:0.005:1;

   s  = schoenval(3,t);
   f  = sin(s*4*pi) + 0.5*cos(150*pi*s);
   fx = sin(x*2*pi) + 0.5*cos(150*pi*x);

   V = bsplvander(3,t,s);

%  sf = localsmooth(f);
%  plot(s,sf,'or');

   v = zeros(size(f'));
   for i = 1:extra
       v = (eye(size(V)) - V)*v + f' ;

       if nargin == 3,

          if rem(i-1,4) == 0 & i > 1,
              disp('Druk op een toets .....');
              pause;
              clf;
           end;

           subplot(2,2,rem(i-1,4)+1);
           splplot(3,t,v);
           plot(s,f,'ob');
           title(['Iteratie ',num2str(i)]);
       end;
   end

   figure(2);
   clf;
   hold on;
   splplot(3,t,v);
   plot(s,f,'ob');
   title('Eind resultaat');
   legend('Spline ','Data ','Knikpunten ');
end
