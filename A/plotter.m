
%Raster:
%linspace(anfang,ende,anzahl der punkte)
k=100;
x=linspace(0,2*pi,k);
y=linspace(0,2*pi,k);

F=@(x,y)sin(10*(sin(x)-y))

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

figure(3); %Äquipotenziallinien
%contour(X,Y,Z,'ShowText','on');
contour(X,Y,Z,'ShowText','off');
colormap(jet);


