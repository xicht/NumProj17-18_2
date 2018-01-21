
%Raster:
%linspace(anfang,ende,anzahl der punkte)
k=150;
x=linspace(-3,3,k);
y=linspace(-3,3,k);

F=@(x,y)sin(x.^2+y.^2-atan2(y,x))

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
%contour(X,Y,Z,'ShowText','on');
contour(X,Y,Z,'ShowText','off');
colormap(jet);


