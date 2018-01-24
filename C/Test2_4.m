
global epsZero;
global print_error;
epsZero = 1000*eps;
print_error = true;
r = 1;
G = @(x,y) 0.2*x.^2+y.^2-r^2
dGx = @(x,y) 0.4*x 
dGy = @(x,y) 2*y 
stepwidth = 10^-2
phi = 0
x0 = 0
y0 = 1
h = 10^-1
hold on
plottinator = @(a,b) plot(a,b,'r');
[x y] = implicitCurve_ortho(G, dGx, dGy, x0, y0, 105, h, plottinator);  

[x y] = implicitCurve(G, dGx, dGy, x0, y0, 3.5*pi*r, h,h);  

plot(x,y);
hold off
print_error = false;