global epsZero;
epsZero = 100*eps;

G = @(x,y) sin(x^2)-y
dGx = @(x,y) 2*x*cos(x^2)
dGy = @(x,y) -1

d2Gxx = @(x,y) 2*cos(x^2) - 4*x^2*sin(x^2)
d2Gxy = @(x,y) 0
d2Gyy = @(x,y) 0


%[x1 y1 z1 length1 steps1] = implicitCurve(G, dGx, dGy, 0, 0, 250, 10^-3);

% [x1 y1 z1 length1 steps1] = implicitCurveAdapt2(G, dGx, dGy, d2Gxx, d2Gxy, d2Gyy, 0, 0, 100, 1, 10^-6,7*10^-4);
% [x2 y2 z2 length2 steps2] = implicitCurveAdapt3(G, dGx, dGy, 0, 0, 100, 1, 10^-6,1.05*10^-2);
% [x3 y3 z3 length3 steps3] = implicitCurveAdapt4(G, dGx, dGy, d2Gxx, d2Gxy, d2Gyy, 0, 0, 100, 1, 10^-6,10^-3);

%[x3 y3 z3 length3 steps3] = implicitCurve(G, dGx, dGy, 0, 0, 250, 6*10^-3);

[x1 y1 z1 length1 steps1] = implicitCurveAdapt2(G, dGx, dGy, d2Gxx, d2Gxy, d2Gyy, 0, 0, 200, 1, 10^-6,6*10^-3);
[x2 y2 z2 length2 steps2] = implicitCurveAdapt3(G, dGx, dGy, 0, 0, 200, 1, 10^-6,7.4*10^-2);
[x3 y3 z3 length3 steps3] = implicitCurveAdapt4(G, dGx, dGy, d2Gxx, d2Gxy, d2Gyy, 0, 0, 200, 1, 10^-6,1.3*10^-2);

figure('DefaultAxesFontSize',14);
figure(1)
hold on
plot(x3,y3,'b','LineStyle','-','Marker','.','MarkerSize',16,'LineWidth',1);
plot(x1,y1,'r','LineStyle','--','Marker','^','MarkerSize',4.5,'LineWidth',1,'MarkerFaceColor','r');
hold off

figure('DefaultAxesFontSize',14);
figure(2)
hold on
plot(x3,y3,'b','LineStyle','-','Marker','.','MarkerSize',16,'LineWidth',1);
plot(x2,y2,'g','LineStyle','--','Marker','^','MarkerSize',4.5,'LineWidth',1,'MarkerFaceColor','g');
hold off

steps1
steps2
steps3
