global epsZero;
epsZero = 100*eps;

G = @(x,y)(x.^2+y.^2+10^-2).^-1 + ((x-0.5).^2+y.^2+10^-2).^-1
dGx = @(x,y) - (2*x)/(x^2 + y^2 + 1/100)^2 - (2*x - 1)/((x - 1/2)^2 + y^2 + 1/100)^2
dGy = @(x,y) - (2*y)/(x^2 + y^2 + 1/100)^2 - (2*y)/((x - 1/2)^2 + y^2 + 1/100)^2

G(0.25,0)
Z=[10,15,20,25,G(0.25,0),40,60,80]; %vorgebene funktionswerte
Steps=10000*1./sqrt([1:length(Z)]);
StepWidth=5*10^-4*ones(1,length(Z));

a=0;
b=0.25;
c=0;
d=1;

[X, Y] = nivlines3(G, dGx, dGy, Z, a, b, c, d, Steps, StepWidth); 

figure(1)
plot(X{1},Y{1})
hold on

for j=2:length(Z)
   plot(X{j},Y{j});
end

hold off
