
global epsZero;
epsZero = 100*eps;

%G = @(x,y)sin(x^2)-y
G = @(x,y) x.^2+y.^2-1


[x y] = implicitCurve(G, 1/sqrt(2), 1/sqrt(2), 10, 10^-3);
plot(x,y);