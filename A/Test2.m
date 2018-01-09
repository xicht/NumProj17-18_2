
global epsZero;
epsZero = 1000*eps;

G = @(x,y) x.^2+y.^2-1
 
[x y] = implicitCurve(G, sin(0.3),cos(0.3), 704, 10^-3);
plot(x,y);
%plot(x,G(x,y));