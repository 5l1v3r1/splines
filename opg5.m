function opg5(ntotaal,doeplot)
%
% Opgave 5
%
% function opg5(ntotaal,doeplot)
%
% ntotaal  : aantal knikpunten (eventueel verzameling)
% doeplot  : genereer plotjes (optioneel)

a      = 1;       % linker grens
b      = 5;       % rechter grens

f      = '1 ./ x';
x      = a:(b-a)/1000:b;
fx     = eval(f)';
fa1    = -1/a^2;
fb1    = -1/b^2;

if nargin == 1, 
   doeplot = 0;
else
   whitebg('w');
   clf;
   hold on;
end;

prevKnot = 0;
prevCla  = 0;
prevNat  = 0;

for n = ntotaal,
    t      = a:(b-a)/(n-1):b;

    V      = bsplvander(3,t,x);
    AlKnot = splcokno(f,3,t);
    AlCla  = splcocla(f,3,t,fa1,fb1);
    AlNat  = splconat(f,3,t);    
    
    fknot  = V*AlKnot;
    fcla   = V*AlCla;    
    fnat   = V*AlNat;

    disp(['n                       : ',num2str(n)]);
    disp(['|t|                     : ',num2str((b-a)/(n-1))]);
    disp(['Fout Clamped            : ',num2str(max(abs(fx-fcla)))]);
    disp(['Fout Natural            : ',num2str(max(abs(fx-fnat)))]);
    disp(['Fout Knot-a-knot        : ',num2str(max(abs(fx-fknot)))]);
    disp(' ');
    disp(['Verbetering Clamped     : ',num2str(max(abs(fx-fcla)) \ prevCla)]);
    disp(['Verbetering Natural     : ',num2str(max(abs(fx-fnat)) \ prevNat)]);
    disp(['Verbetering Knot-a-knot : ',num2str(max(abs(fx-fknot))\ prevKnot)]);

    prevCla = max(abs(fx-fcla));
    prevKnot = max(abs(fx-fknot));
    prevNat = max(abs(fx-fnat));

    if doeplot,
%       plot(x,fx,x,fknot,x,fcla,x,fnat);
%       legend('f(x)','knot-a-knot','clamped','natural');
%       title('Benaderingen');
%       pause; 
       clf; 
       plot(x,fx-fknot,x,fx-fcla,x,fx-fnat);
       legend('knot-a-knot','clamped','natural');
       title('Fout in Benaderingen'); 
       disp('Druk een toets ...');
       pause;      
    end
    disp('------------------------- ');
end;
