
global epsZero;
epsZero = 1000*eps;

r = 1;
G = @(x,y) x.^2+y.^2-r^2
dGx = @(x,y) 2*x 
dGy = @(x,y) 2*y 
stepwidth = 10^-3
phi = 0
x0 = cos(phi)*r
y0 = sin(phi)*r
%[x y] = implicitCurve(G, dGx, dGy, x0, y0, floor((1-x0)/stepwidth -epsZero)*3, stepwidth);
[x y] = implicitCurve(G, dGx, dGy, x0, y0, 2*pi*r, 5*10^-3, 5*10^-2);  % hier geht was schief, bei 100 geht's noch
l = linspace(0,2*pi);
%plot(cos(l), sin(l), x,y);
plot(x,y);