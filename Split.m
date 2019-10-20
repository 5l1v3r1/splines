function [even, odd] = Split(x)

even = x(1:2:length(x));
odd  = x(2:2:length(x));