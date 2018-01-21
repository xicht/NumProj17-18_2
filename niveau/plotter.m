
%Raster:
%linspace(anfang,ende,anzahl der punkte)
k=200;
x=linspace(-1,1,k);
y=linspace(-1,1,k);

%F=@(x,y)(x.^2+y.^2+10^-2).^-1 + ((x-0.5).^2+y.^2+10^-2).^-1
%F=@(x,y)abs(x).^(2*(x.^2+y.^2))+abs(y).^(2*(x.^2+y.^2))
F = @(x,y) x.^2+y.^2-sin(50*atan2(y,x))./20
[X,Y]=meshgrid(x,y);

Z=F(X,Y);
mesh(X,Y,Z);
figure(1)
surf(X,Y,Z);
colormap(jet);
colorbar;

figure(2);
surf(X,Y,Z);
view(2);
colorbar;
colormap(jet);

figure(3); %aequipotenziallinien
contour(X,Y,Z,'ShowText','on');
%contour(X,Y,Z,'ShowText','off');
colormap(jet);


