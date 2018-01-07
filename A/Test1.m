
global epsZero;
epsZero = 5*eps;

G = @(x,y)sin(x^2)-y
[x y] = implicitCurve(G, 0, 0, 10000, pi/1000);
plot(x,y);