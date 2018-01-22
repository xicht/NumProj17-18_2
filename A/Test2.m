
global epsZero;
epsZero = 1000*eps;

G = @(x,y) x.^2+y.^2-1
dGx = @(x,y) 2*x 
dGy = @(x,y) 2*y 
stepwidth = 0.2
phi = -pi/2
x0 = sin(phi)
y0 = cos(phi)
[xl yl] = implicitCurve(G, dGx, dGy, x0, y0, floor((1-x0)/stepwidth -epsZero)+1, stepwidth);

stepwidth = 0.001
[xh yh] = implicitCurve(G, dGx, dGy, x0, y0, floor((1-x0)/stepwidth -epsZero)+1, stepwidth);
figure(1)
plot(xl,yl,'-o','LineWidth',1);
hold on
plot(xh,yh,'--','LineWidth',3);
hold off
axis([-1.1 1.1 -0.1 1.1])
daspect([1 1 1])


%plot(x,G(x,y));