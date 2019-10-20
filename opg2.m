function opg2(t,s)

% Opgave 2
%
% function opg2(t,s)
%
% t : knikpunten
% s : steunpunten

if nargin == 1, s = schoenval(3,t);, end;

disp(' ')
disp('Invloed keuze steunpunten op norm kubische spline interpolatie');
disp(' ');

t = sort(t);
s = sort(s);

% -------------------------------------------------

if length(s) ~= length(t)+2,
   disp('Fout: #s <> #t + 2');
   return;
end;

% dummy functie
V = bsplvander(3,t,s);

r = norm(full(V^(-1)),Inf);
sleft1 = left(s);
dif1 = sleft1(1:length(s)-1) - s(1:length(s)-1);
m1 = min(dif1);
M1 = max(dif1);

t
s

disp(['Norm Inverse Vandermonde matrix       : ',num2str(r)]);
disp(['min |s(i+1)-s(i)|                     : ',num2str(m1)]);
disp(['1 / min |s(i+1)-s(i)|                 : ',num2str(1/m1)]);
