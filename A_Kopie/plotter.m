
%Raster:
%linspace(anfang,ende,anzahl der punkte)
k=100;
x=linspace(-1,1,k);
y=linspace(-1,1,k);

F=@(x,y)x.*y

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


