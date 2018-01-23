
global epsZero;
epsZero = 1000*eps;

r = 1;
G = @(x,y) 0.1*x.^2+y.^2-r^2
dGx = @(x,y) 0.2*x 
dGy = @(x,y) 2*y 
stepwidth = 10^-2
phi = 0
x0 = 0
y0 = 1
h = 10^-1
[x y] = implicitCurve(G, dGx, dGy, x0, y0, 4.5*pi*r, h,h);  

plot(x,y);
hold on
[x y] = implicitCurve_noCorr(G, dGx, dGy, x0, y0, 4.5*pi*r, h,h); 
plot(x,y);

[x y] = implicitCurve_ortho(G, dGx, dGy, x0, y0, 140, h); 
plot(x,y);
[x y] = implicitCurve_ortho_noCorr(G, dGx, dGy, x0, y0, 140, h); 
plot(x,y);
hold off