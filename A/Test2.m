
global epsZero;
epsZero = 1000*eps;

G = @(x,y) x.^2+y.^2-1
stepwidth = 10^-4
x0 = sin(0.2)
y0 = cos(0.2)
[x y] = implicitCurve(G, x0, y0, floor((1-x0)/stepwidth -epsZero), stepwidth);
plot(x,y);
%plot(x,G(x,y));