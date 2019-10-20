function opg4(epsilon,delta,doeplot)
%
% Opgave 4
%
% function opg4(epsilon,delta,doeplot)
%
% epsilon : afstand knikpunten t(10) en t(9), eventueel verzameling
%           epsilon = t(10)-t(9)
% delta   : maiximale grootte perturbatie
% doeplot : genereer ook plotjes (optioneel)


a      = -5;      % linker grens
b      = 5;       % rechter grens
n      = 20;      % aantal knikpunten

p      = [1 1 1 1];

% -----------------------------------------------------

if nargin == 2, 
   doeplot = 0;
else
   whitebg('w');
   clf;
   hold on;
end;

x = a:(b-a)/1000:b;
r = delta * rand(1,n+2)';

% t1 = uniform, t2 = uniform & verstoord

for e = epsilon,

   t1 = a:(b-a)/(n-1):b;
   t2 = a:(b-a)/(n-1):b;
   ndx = n/2;
   t2(ndx) = t2(ndx-1) + e;

   s1 = sort([t1 (t1(1)+t1(2))/2 (t1(length(t1)-1)+t1(length(t1)))/2 ]);
   s2 = sort([t2 (t2(1)+t2(2))/2 (t2(length(t2)-1)+t2(length(t2)))/2 ]);

   V1 = bsplvander(3,t1,s1);   
   V2 = bsplvander(3,t2,s2);

   Vx1 = bsplvander(3,t1,x);
   Vx2 = bsplvander(3,t2,x);

   px = polyval(p,x);

   % de perturbatie

   f1 = polyval(p,s1)' + r;
   f2 = polyval(p,s2)' + r;

   alpha1 = V1^(-1)*f1;
   alpha2 = V2^(-1)*f2;
   
   disp('--------------------- ');
   disp(['Epsilon            : ',num2str(e)]);
   disp(['Delta              : ',num2str(delta)]);
   disp(['Fout uniform       : ',num2str(max(abs(Vx1*alpha1 - px')))]);
   disp(['Fout niet uniform  : ',num2str(max(abs(Vx2*alpha2 - px')))]);   
   disp(['Norm uniform       : ',num2str(norm(full(V1^(-1)),Inf))]);
   disp(['Norm niet uniform  : ',num2str(norm(full(V2^(-1)),Inf))]);   

   if doeplot,
      clf;
      plot(x,Vx1*alpha1 - px','r',x,Vx2*alpha2 - px','b');
      legend('Uniform','Niet uniform');
      disp('Druk een toets....');
      pause;
   end
end
