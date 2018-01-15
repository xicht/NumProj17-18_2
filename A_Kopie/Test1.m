
global epsZero;
epsZero = 100*eps;

G = @(x,y) sin(x^2)-y
dGx = @(x,y) 2*cos(x^2)
dGy = @(x,y) -1

[x y] = implicitCurve(G, dGx, dGy, 0, 0, 1000, 5*10^-2);
plot(x,y);
