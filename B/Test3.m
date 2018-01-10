
global epsZero;
epsZero = 1000*eps;

G = @(x,y) sin(sin(x)-y);
dGx = @(x,y) cos(sin(x)-y)*cos(x) 
dGy = @(x,y) -cos(sin(x)-y) 

k = [0.5 0.9 1 10 100]
for i = k
    [x y] = implicitCurve(G, dGx, dGy, 0, 0, 10*i, pi/i);
    plot(x,y);
    hold on
end
hold off