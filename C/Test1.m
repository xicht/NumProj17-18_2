
global epsZero;
epsZero = 100*eps;

G = @(x,y) sin(x.^2)-y
dGx = @(x,y) 2*x*cos(x.^2)
dGy = @(x,y) -1

[x y] = implicitCurve(G, dGx, dGy, 0, 0, 100, 10^-3, 10^-3, [1;1]);
plot(x,y);
