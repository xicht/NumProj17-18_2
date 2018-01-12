
global epsZero;
epsZero = 100*eps;

G = @(x,y) x.^2+y.^2
dGx = @(x,y) 2*x
dGy = @(x,y) 2*y


Z=[1,2,3,4];
Steps=10000*[1:4];
StepWidth=5*10^-4*ones(1,4);

a=-0.6;
b=-0.4;
c=-3;
d=3;

[X, Y] = nivlines3(G, dGx, dGy, Z, a, b, c, d, Steps, StepWidth); 

figure(1)
plot(X{1},Y{1})
hold on

for j=2:length(Z)
   plot(X{j},Y{j});
end

hold off
