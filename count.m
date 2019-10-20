function c = count(v)

v = sign(v);
c = 0;
for i = 2:length(v)
    if abs( v(i) - v(i-1) ) == 2, c = c + 1;, end;
end