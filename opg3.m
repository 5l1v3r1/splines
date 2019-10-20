function opg3(t)
%
% Opgave 3
%
% function opg3(t)
%
% t : knikpunten ( indien weggelaten wordt automatisch
%                  een knikpuntenrij gegenereerd ) 


a     = -5;      % linker grens
b     = 5;       % rechter grens
n     = 7;       % aantal knikpunten

% te benaderen functie en bijbehorende 4'e afgeleide

f   = '1./(1+25*x.^2)';
f4  = '15000 *( 3125 * x.^4 - 250 *x.^2 + 1) ./ ((25 * x.^2 +1 ).^5)';

% ------------------------------------------

wie = 'Gebruiker';

figure(1);
clf;
hold on;
whitebg('w');

x   = a:(b-a)/1000:b;
fx  = eval(f);
f4x = eval(f4);

tunif = a:(b-a)/(n-1):b;

if nargin < 1
   wie = 'Automatisch';

   t = [a];
   f4x = abs(f4x) .^(0.25);
   perint = sum(f4x)/(n-1);
   s = 0;
   ptr = 0;
   for i = 2:n-1,
       while s < perint,
            ptr = ptr + 1;
            s = s + f4x(ptr);
       end
       t = [t x(ptr) ];
       s = s - perint;
   end
   t = [t b];
end

if length(t) ~= n, 
   disp(['Fout: t moet ',num2str(n),' elementen bevatten']);
   return;
end

[alpha1,V1] = splcokno(f,3,t);
[alpha2,V2] = splcokno(f,3,tunif); 

sx1 = splval(x,t,3,alpha1);
sx2 = splval(x,tunif,3,alpha2);

plot(x,fx,'k',x,sx1,'r',x,sx2,'b');
plotknots(t);
legend('f(x)',['Spline ',wie,' '],'Spline uniform  ','Knikpunten gebruiker ');
title('Spline benaderingen');

% print wat informatie

disp(wie);
disp(' ');
disp(['Fout spline benadering            : ',num2str(max(abs(sx1-fx)))]);
disp(['Norm spline interpolatie operator : ',num2str(norm(full(V1^(-1)),Inf))]);

disp(' ');
disp('Uniform');
disp(' ');
disp(['Fout spline benadering            : ',num2str(max(abs(sx2-fx)))]);
disp(['Norm spline interpolatie operator : ',num2str(norm(full(V2^(-1)),Inf))]);

figure(2);
hold on;

[m1,i1] = max(sx1-fx);
[m2,i2] = max(sx2-fx);

f1 = sx1 - fx;
f2 = sx2 - fx;

clf;
plot(x,f1,'r',x,f2,'b',x(i1),f1(i1),'r*',x(i2),f2(i2),'b*');
legend(['Fout ',wie,' '],'Fout uniform ' );
title('Fout in benaderingen');
