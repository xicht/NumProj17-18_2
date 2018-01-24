global epsZero;
global print_error;
epsZero = 1000*eps;
print_error = true;

plottinator = @(a,b) plot(a,b,'r');
r = 1;
G = @(x,y) x^3-x*y+y^2-1
dGx = @(x,y) 3*x^2-y
dGy = @(x,y) 2*y-x
stepwidth = 10^-2
phi = 0
x0 = -1
y0 = 1
h = 10^-1
hold on
[x y] = implicitCurve(G, dGx, dGy, x0, y0, 5, h,h,[1;0.1]);  

plot(x,y);

[x y] = implicitCurve_ortho(G, dGx, dGy, x0, y0, 50, h,plottinator); 
plot(x,y);
hold off
print_error = false;