function y = localsmooth(x)

mask = zeros(size(x));
mask(1:2) = [1 0.8];
T = toeplitz(mask,mask);
y = diag(1 ./ sum(T))*T*x';
