
%Raster:
%linspace(anfang,ende,anzahl der punkte)
k=100;
x=linspace(-0.5,1,k);
y=linspace(-0.5,0.5,k);

F=@(x,y)(x.^2+y.^2+10^-2).^-1 + ((x-0.5).^2+y.^2+10^-2).^-1

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

figure(3); %─quipotenziallinien
contour(X,Y,Z,'ShowText','on');
%contour(X,Y,Z,'ShowText','off');
colormap(jet);


