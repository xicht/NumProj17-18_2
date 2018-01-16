
global epsZero;
epsZero = 100*eps;

G = @(x,y) sin(x^2)-y
dGx = @(x,y) 2*cos(x^2)
dGy = @(x,y) -1


[x1 y1 z1 length1 steps1] = implicitCurve(G, dGx, dGy, 0, 0, 250, 10^-3);
[x2 y2 z2 length2 steps2] = implicitCurveAdapt2(G, dGx, dGy, 0, 0, 250, 10^-1, 10^-4);
[x3 y3 z3 length3 steps3] = implicitCurve(G, dGx, dGy, 0, 0, 250, 5*10^-2);
figure(1)
%plot(x1,y1);
hold on
plot(x2,y2,'r');
plot(x3,y3,'b');
hold off

figure(2)
plot(x2,y2, 'b.')

steps1
steps2
steps3
