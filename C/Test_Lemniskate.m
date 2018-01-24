global epsZero;
%global print_error;
epsZero = 10*eps;
%print_error = true;

G = @(x,y) (x^2+y^2)^2-x^2+y^2
dGx = @(x,y) 4*x*(x^2+y^2)-2*x
dGy = @(x,y) 4*y*(x^2+y^2)+2*y
stepwidth = 10^-2
phi = 0
x0 = 1
y0 = 0
h = 10^-4 /2
[x y] = implicitCurve2(G, dGx, dGy, x0, y0, 6, h,h,[-1;-1]);  

plot(x,y);

hold on
%[x y] = implicitCurve_ortho(G, dGx, dGy, x0, y0, 50, h,plottinator); 
%plot(x,y);
hold off
%print_error = false;