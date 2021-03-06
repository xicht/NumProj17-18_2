
global epsZero;
epsZero = 100*eps;

G = @(x,y) x.^2+y.^2
dGx = @(x,y) 2*x
dGy = @(x,y) 2*y

X0=[0,0,0,0];
Y0=[1,1.5,2,2.5];
Steps=500*[1:4];
StepWidth=5*10^-3*ones(1,4);

[X, Y] = nivlines2(G, dGx, dGy, X0, Y0, Steps, StepWidth); % mit 410 gehts schief

figure(1)
plot(X{1},Y{1})
hold on

for j=2:length(X0)
   plot(X{j},Y{j});
end

hold off
