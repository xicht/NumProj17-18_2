
global epsZero;
epsZero = 100*eps;

G = @(x,y) x.*exp(-x.^2-y.^2)
dGx = @(x,y) exp(-x.^2-y.^2)-2*x.^2.*exp(-x.^2-y.^2)
dGy = @(x,y) -2*x.*y.*exp(-x.^2-y.^2)

X0=[-1,0,1,2];
Y0=[1,1,1,1];

[X, Y] = nivlines1(G, dGx, dGy, X0, Y0, 500, 10^-2); % mit 500 gehts schief

figure(1)
plot(X(1,:),Y(1,:))
hold on

for j=2:length(X0)
   plot(X(j,:),Y(j,:));
end

hold off
