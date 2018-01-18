global epsZero;
epsZero = 100*eps;

G = @(x,y)(x.^2+y.^2+10^-2).^-1 + ((x-0.5).^2+y.^2+10^-2).^-1
dGx = @(x,y) - (2*x)/(x^2 + y^2 + 1/100)^2 - (2*x - 1)/((x - 1/2)^2 + y^2 + 1/100)^2
dGy = @(x,y) - (2*y)/(x^2 + y^2 + 1/100)^2 - (2*y)/((x - 1/2)^2 + y^2 + 1/100)^2


Z=[10,15,20,25,G(0.25,0),40,60,80]; %vorgebene funktionswerte
Steps=100*1./sqrt([1:length(Z)]);
StepWidth=5*10^-4*ones(1,length(Z));

a=0;
b=0.25;
c=0;
d=1;

niveauplot(G, dGx, dGy, Z, a, b, c, d, Steps, StepWidth,1);

