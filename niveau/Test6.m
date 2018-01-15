
global epsZero;
epsZero = 100*eps;

G = @(x,y) -x.^2.*y.^3 + (x.^2+y.^2-1).^3
dGx = @(x,y) 6.*x.*(x.^2 + y.^2 - 1)^2 - 2.*x.*y.^3
dGy = @(x,y) 6.*y.*(x.^2 + y.^2 - 1).^2 - 3.*x^2.*y.^2


Z=[0]; %vorgebene funktionswerte
Steps=15000*ones(1,1);
StepWidth=5*10^-4*ones(1,1)

a=-1;
b=1;
c=-1;
d=1;

[X, Y] = nivlines3(G, dGx, dGy, Z, a, b, c, d, Steps, StepWidth); 

figure(1)
plot(X{1},Y{1})
hold on

for j=2:length(Z)
   plot(X{j},Y{j});
end

hold off
