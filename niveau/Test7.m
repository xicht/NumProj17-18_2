
global epsZero;
epsZero = 100*eps;

G = @(x,y) x.^20+y.^20
dGx = @(x,y) 20*x.^19
dGy = @(x,y) 20*y.^19


Z=[1]; %vorgebene funktionswerte
Steps=10000*ones(1,1);
StepWidth=10^-2*ones(1,1)

a=-0.6;
b=-0.4;
c=-3;
d=3;

[X, Y] = nivlines4(G, dGx, dGy, Z, a, b, c, d, Steps, StepWidth); 

figure(1)
plot(X{1},Y{1})
hold on

for j=2:length(Z)
   plot(X{j},Y{j});
end

hold off
