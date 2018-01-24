global epsZero;
%global print_error;
epsZero = 10*eps;
%print_error = true;

r = 1;
G = @(x,y) (x^2+y^2-1)^3-x^2*y^3
dGx = @(x,y) 6*x*(x^2+y^2-1)^2-2*x*y^3
dGy = @(x,y) 6*y*(x^2+y^2-1)^2-3*x^2*y^2
stepwidth = 10^-2
phi = 0
x0 = 0.999949673582727
y0 = 10^-4
h = 10^-3
[x y] = implicitCurve2(G, dGx, dGy, x0, y0, 8, h,h,[-1;-1]);  

plot(x,y);

hold on
%[x y] = implicitCurve_ortho(G, dGx, dGy, x0, y0, 50, h,plottinator); 
%plot(x,y);
hold off
%print_error = false;