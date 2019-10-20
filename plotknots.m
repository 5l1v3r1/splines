function plotknots(t,mul)
%
% function plotknots(t,mul)

% Jasper van den Eshof, 1997

if nargin < 2, mul = 0;, end
plot(t,zeros(size(t)),'c*');

ax=axis; dx=(ax(2)-ax(1))/100; dy=(ax(4)-ax(3))/50;
t=t+dx;

if mul,

   while ~isempty(t)

   text(t(1),dy,num2str(mult(t(1),t)));
   t = wiskp(t(1),t);

   end
end
