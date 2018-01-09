
global epsZero;
epsZero = 100*eps;

G = @(x,y)sin(x^2)-y

[x y] = implicitCurve(G, 0, 0, 10000, 10^-3);
plot(x,y);
