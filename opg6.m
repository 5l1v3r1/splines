function opg6(ntotaal,interval,doeplot)
%
% Opgave 6
%
% function opg6(ntotaal,interval,doeplot)
%
% ntotaal  : aantal knikpunten (eventueel verzameling)
% interval : te bestuderen interval
% doeplot  : genereer plotjes (optioneel)

a      = -5;      % linker grens
b      = 5;       % rechter grens

f      = 'sqrt(abs(x))';

x      = a:(b-a)/1000:b;
fx     = eval(f);
fb1    = 1/(2*sqrt(b));
Prev   = 0;

if nargin == 2, 
   doeplot = 0;
else
   whitebg('w');
end;

l           = (b-a)/length(x);
interval    = sort(interval);

la  = interval(1);
ra = interval(2);

interval(2) = min((interval(2)-a) / l + 1,length(x));
interval(1) = max((interval(1)-a) / l + 1,1);
interval    = round(interval);

for n = ntotaal,

    t = a:(b-a)/(n-1):b;

    % links hebben we natuurlijke spline voorwaarden
    links = [];
    for j = -3:length(t)-2, links = [ links bspldval(j,3,t,t(1),2) ];, end

    % rechts hebben we een geklemde rand
    rechts = [];
    for j = -3:length(t)-2, rechts = [ rechts bspldval(j,3,t,t(length(t)),1) ];, end

    V = sparse([ links; bsplvander(3,t,t); rechts]);
    f = [ 0; (sqrt(abs(t)))'; fb1 ];   

    % oplossen coefficienten

    alpha = V \ f;
    sx = splval(x,t,3,alpha);
  
    [fout,idx] = max(abs(fx(interval(1):interval(2)) - ...
                         sx(interval(1):interval(2))));
    fouttot = max(abs(fx-sx));

    disp(['n                     : ',num2str(n)]);
    disp(['|t|                   : ',num2str((b-a)/(n-1))]);
    disp(['Fout in interval      : ',num2str(fout)]);
    disp(['Verbetering           : ',num2str(fout \ Prev)]);
    disp(['Fout totaal           : ',num2str(fouttot)]);

    Prev = fout;

    if doeplot, 
       clf;
       hold on;
       plot(x(interval(1):interval(2)),fx(interval(1):interval(2))- ...
       sx(interval(1):interval(2)));
       plotknots(t( find( t >= la & t <= ra ) ));
       title('Fout in benadering');
       disp('Druk een toets ... ');
       pause;
    end;
    disp('------------------------------ ');
end;
