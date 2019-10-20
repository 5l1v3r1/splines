function V = bsplvander(k,t,s)
%
% V = bsplvander(k,t,s)
%
% retourneer vandermonde-matrix voor k'e orde B-spline basis
% op knikpuntenrij t met steunpunten s

% Jasper van den Eshof, 1997
% quick and dirty !

nknots = length(t)-2;
s = s';

% 0'e orde basis splines
V = sparse(zeros(length(s),k));

for j = 1:nknots
  V = [V ( s >= t(j) & s < t(j+1)) ];
end
V = [V  ( s >= t(nknots+1) & s <= t(nknots+2)) ];

% voorkom langzame if statements :
t = [ (t(1) * ones(1,k)) t (t(length(t)) * ones(1,k)) ];
% t[j] zit nu in t(j+k+1)

for kloop = 1:k

    v = t(k+1) - t(k-kloop+1);

    for j = -kloop:nknots

        if v ~= 0, 
           V(:,j+k+1) =  (s - t(j+k+1) ) / v .* V(:,j+k+1) ;
        end;

        v = t(j+k+kloop+2) - t(j+k+2);

        if v ~= 0,
           V(:,j+k+1) = V(:,j+k+1) + (t(j+k+kloop+2)-s ) / v .* V(:,j+k+2);
        end;
    end
end