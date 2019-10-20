function y = lift(x,l)

even = x;
for i = 1:l
    [even,odd] = Split(even);
    even = 2 * even - Peven(odd);
end;
y = even;
