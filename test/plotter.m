
%Raster:
%linspace(anfang,ende,anzahl der punkte)
k=100;
x=linspace(-1,1,k);
y=linspace(-1,1,k);


F=@(x,y)(x.^2+y.^2+10^-2).^-1 + ((x-0.5).^2+y.^2+10^-2).^-1
%F = @(x,y) -x.^2.*y.^3 + (x.^2+y.^2-1).^3
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
contour(X,Y,Z,'ShowText','on');
%contour(X,Y,Z,'ShowText','off');
colormap(jet);


