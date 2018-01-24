
global epsZero;
epsZero = 100*eps;

G = @(x,y) x.^10+y.^10-1
dGx = @(x,y) 10*x.^9
dGy = @(x,y) 10*y.^9
d2Gxx = @(x,y) 90*x.^8
d2Gxy = @(x,y) 0
d2Gyy = @(x,y) 90*y.^8

length=1
%[x0 y0 z0 length0 steps0] = implicitCurve(G, dGx, dGy, 0, 1, length, 0.48*10^-5);
%[x1 y1 z1 length1 steps1] = implicitCurveAdapt2(G, dGx, dGy, d2Gxx, d2Gxy, d2Gyy, 0, 1, length, 5*10^-3, 10^-9,1.6*10^-12);
%[x2 y2 z2 length2 steps2] = implicitCurveAdapt3(G, dGx, dGy, 0, 1, length, 5*10^-3, 10^-9,2.5*10^-11);
%[x3 y3 z3 length3 steps3] = implicitCurveAdapt4(G, dGx, dGy, d2Gxx, d2Gxy, d2Gyy, 0, 1, length, 5*10^-3, 10^-9,1.6*10^-12);

% figure('DefaultAxesFontSize',14);
% figure(1)
% hold on
% plot(x0,y0,'r','LineStyle','--','Marker','^','MarkerSize',4.5,'LineWidth',1,'MarkerFaceColor','r');
% plot(x2,y2,'b','LineStyle','-','Marker','.','MarkerSize',16,'LineWidth',1);
% plot(x3,y3,'g','LineStyle','-','Marker','.','MarkerSize',16,'LineWidth',1);
% hold off

[steps0,steps1,steps2,steps3]

F= @(x) x*hypergeom([-1/10, 1/10], 11/10, x^10);

err0=polygonerr(x0,y0,F);
err1=polygonerr(x1,y1,F);
err2=polygonerr(x2,y2,F);
err3=polygonerr(x3,y3,F);

err=[err0, err1, err2, err3]

% figure('DefaultAxesFontSize',14);
% figure(2)
% figure('DefaultAxesFontSize',14);
% loglog(ERR(:,1),ERR(:,2));
% hold on
% loglog(ERR(:,1),ERR(:,3));
% loglog(ERR(:,1),ERR(:,4));
% loglog(ERR(:,1),ERR(:,5));
% loglog(ERR(:,1),0.005*ERR(:,1).^-2);
% hold off



figure(3)
figure('DefaultAxesFontSize',14);
loglog(ERR(:,1),ERR(:,2).*ERR(:,2).^-1);
hold on
loglog(ERR(:,1),ERR(:,3).*ERR(:,2).^-1);
loglog(ERR(:,1),ERR(:,4).*ERR(:,2).^-1);
loglog(ERR(:,1),ERR(:,5).*ERR(:,2).^-1);
hold off


