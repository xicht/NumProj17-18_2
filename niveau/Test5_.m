global epsZero;
epsZero = 100*eps;

G = @(x,y)(x.^2+y.^2+10^-2).^-1 + ((x-0.5).^2+y.^2+10^-2).^-1
dGx = @(x,y) - (2*x)/(x^2 + y^2 + 1/100)^2 - (2*x - 1)/((x - 1/2)^2 + y^2 + 1/100)^2
dGy = @(x,y) - (2*y)/(x^2 + y^2 + 1/100)^2 - (2*y)/((x - 1/2)^2 + y^2 + 1/100)^2


Z=[10,15,20,25,G(0.25,0),30,40,60,80,30,40,60,80]; %vorgebene funktionswerte
Steps=[2000*ones(1,5) 500*ones(1,8)];
StepWidth=2*10^-3;

A= [zeros(1,9) 0.5 0.5 0.5 0.5];
B=0.25+A;
C=0;
D=1;

niveauplot(G, dGx, dGy, Z, A, B, C, D, Steps, StepWidth,14,1);

