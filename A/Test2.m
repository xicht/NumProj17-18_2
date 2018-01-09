
global epsZero;
epsZero = 1000*eps;

G = @(x,y) x.^2+y.^2-1
stepwidth = 10^-4
phi = -pi/2 + 0.001
x0 = sin(phi)
y0 = cos(phi)
[x y] = implicitCurve(G, x0, y0, floor((1-x0)/stepwidth -epsZero), stepwidth);
plot(x,y);
%plot(x,G(x,y));