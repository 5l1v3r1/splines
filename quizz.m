function quizz
%
% Opgave 1
%
% Beantwoord de vraag en druk op een willekeurige
% toets om het antwoord te verifieren

clf

disp('Vraag 1');
disp(' ');

disp('Van welke orde is de geplotte B-Spline');
t = nieuwkp(5,0:10,2);
alpha = zeros(length(t)+3,1);
alpha(9) = 1;
splplot(4,t,alpha);
disp('Druk een toets ...');
pause;


disp('4e orde <= totale multipliciteit in inwendige is 4');
disp('Druk een toets ...');
pause;

disp(' ');
disp('Vraag 2');

disp('Van welke orde is de geplotte B-Spline');
t = nieuwkp(5,0:10,2);
t = nieuwkp(6,t,2);
alpha = zeros(length(t)+4,1);
alpha(11) = 1;
clf;
splplot(5,t,alpha);
pause;
disp('5e orde <= 1 maal differentieerbaar in x = 5, dus orde 3 + (3-1) = 5');

disp('Druk een toets ...');
pause;

t = 0:10;
alpha = zeros(length(t)+3,1);
alpha(2) = 1;
clf;
splplot(4,t,alpha);

disp('Dit is de B-Spline Bj4. Wat is j hier?');
disp('Druk een toets ...');
pause;
disp('j = -3 <= in x = 0 wel continu maar niet differentieerbaar');

disp('Druk een toets ...');
pause;

clf;
hold on;

disp('Raad de orde van de hier getekende B-splines');

x = 0:0.05:12;
t = 0:12;
t = nieuwkp(5,t,1);
t = nieuwkp(6,t,1);

n = zeros(length(t)+5,1);

alpha = n;, alpha(9) = 1;
sx = splval(x,t,4,alpha);
plot(x,sx);
hold on;
alpha = n;, alpha(12) = 1;
sx = splval(x,t,4,alpha);
plot(x,sx);

plotknots(t);

disp('Druk een toets ...');
pause;

disp('k = 4, de eerste spline zegt dat k even is en de tweede dat k >= 4');
 
