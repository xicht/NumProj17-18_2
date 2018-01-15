global epsZero;
epsZero = 100*eps;

G = @(x,y)(x.^2+y.^2+10^-2).^-1 + ((x-0.5).^2+y.^2+10^-2).^-1
dGx = @(x,y) -x./(x.^2+y.^2+10^-2).^(3/2) - (x-d)./((x-d).^2+y.^2+10^-2).^(3/2) 
dGy = @(x,y) -y./(x.^2+y.^2+10^-2).^(3/2) - y./((x-d).^2+y.^2+10^-2).^(3/2)


Z=[10,15,20,30]; %vorgebene funktionswerte
Steps=50000*ones(1,4);
StepWidth=10^-4*ones(1,4);

a=0.1;
b=0.2;
c=0.1;
d=1;

[X, Y] = nivlines3(G, dGx, dGy, Z, a, b, c, d, Steps, StepWidth); 

figure(1)
plot(X{1},Y{1})
hold on

for j=2:length(Z)
   plot(X{j},Y{j});
end

hold off
