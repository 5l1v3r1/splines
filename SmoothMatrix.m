function AlphaNew = SmoothMatrix(B,s,t,l)

V = bsplvander(3,t,s);

% bereken spline coefficienten in vertikale richting
Alpha = V^(-1)*B;

AlphaNew = [];
wacht = 0;
for i = 1:size(Alpha,2),

    AlphaNew = [AlphaNew ...
                lift([ Alpha(:,i)
                       zeros(2^l - rem(length(Alpha(:,i)),2^l),1 )
                     ]', l )']; 
   
    if i/size(Alpha,2) > wacht,    
       disp([num2str(floor(i/size(Alpha,2) * 100)),' %']);
       wacht = wacht + 0.1;
    end
end

% t = [1 3:size(AlphaNew,1)-2 size(AlphaNew,1)];
% s = 1:(size(AlphaNew,1)-1)/(length(s)-1):size(AlphaNew,1);
% V = bsplvander(3,t,s);