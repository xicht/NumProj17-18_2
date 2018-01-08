
global epsZero;
epsZero = 100*eps;

%G = @(x,y)sin(x^2)-y
G = @(x,y) sin(10*(sin(x)-y))


[x y] = implicitCurve(G, 0, 0, 20, pi/100);
plot(x,y);