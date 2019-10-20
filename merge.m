function x = Merge(even,odd)

for i = 1:length(even)
    x = [x even(i) odd(i) ];
end
