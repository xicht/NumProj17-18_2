global epsZero;
epsZero = 100*eps;

G = @(x,y)(x.^2+y.^2+10^-2).^-1 + ((x-0.5).^2+y.^2+10^-2).^-1
dGx = @(x,y) -x./(x.^2+y.^2+10^-2).^(3/2) - (x-0.5)./((x-0.5).^2+y.^2+10^-2).^(3/2) 
dGy = @(x,y) -y./(x.^2+y.^2+10^-2).^(3/2) - y./((x-0.5).^2+y.^2+10^-2).^(3/2)


Z=[5,25,30]; %vorgebene funktionswerte
Steps=5000*ones(1,3);
StepWidth=5*10^-6*ones(1,3);

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
