
global epsZero;
epsZero = 1000*eps;

G = @(x,y) x.^2+y.^2-1
dGx = @(x,y) 2*x 
dGy = @(x,y) 2*y 
stepwidth = 10^-4
phi = -pi/2 + 0.001
x0 = sin(phi)
y0 = cos(phi)
%[x y] = implicitCurve(G, dGx, dGy, x0, y0, floor((1-x0)/stepwidth -epsZero), stepwidth);
[x y] = implicitCurve(G, dGx, dGy, sin(0.1), cos(0.1), floor((1-sin(0.1))/stepwidth -epsZero)+1, stepwidth);
plot(x,y);
%plot(x,G(x,y));