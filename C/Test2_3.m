
global epsZero;
epsZero = 1000*eps;

r = 1;
G = @(x,y) x+y+x.^10+y.^10-2
dGx = @(x,y) 1+10*x^9
dGy = @(x,y) 1+10*y^9
stepwidth = 10^-2
phi = 0
x0 = 0
y0 = 1
h = 10^-1
[x y] = implicitCurve(G, dGx, dGy, x0, y0, 8, h,h);  

plot(x,y);
hold on
[x y] = implicitCurve_noCorr(G, dGx, dGy, x0, y0, 8, h,h, [1;-1]); 
plot(x,y);

[x y] = implicitCurve_ortho(G, dGx, dGy, x0, y0, 80, h); 
%plot(x,y);
[x y] = implicitCurve_ortho_noCorr(G, dGx, dGy, x0, y0, 80, h); 
plot(x,y);
hold off