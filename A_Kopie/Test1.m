plot(
global epsZero;
epsZero = 100*eps;

G = @(x,y) sin(x^2)-y
dGx = @(x,y) 2*cos(x^2)
dGy = @(x,y) -1

[x y z length] = implicitCurve(G, dGx, dGy, 0, 0, 1500, 10^-3);
plot(x,y);
plot(x,z);
length