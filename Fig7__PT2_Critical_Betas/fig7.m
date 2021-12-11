color=zeros(25);
NN=25;
color(13,13) = 2;
%radial
[NX,NY,nn]=RadialNeighbours(9);
for i=1:nn
    nx=NX(i);
    if nx~=NN
        nx = mod(13+nx,NN);
    end
    
    ny=NY(i);
    if ny~=NN
        ny = mod(13+ny,NN);
    end
    color(nx,ny)=1;
end
figure
imagesc(color); 
colormap summer;
xticklabels([]); yticklabels([]);

color=zeros(25);
color(13,13) = 2;

[NX,NY,nn]=SquareNeighbours(9);
for i=1:nn
    nx=NX(i);
    if nx~=NN
        nx = mod(13+nx,NN);
    end
    
    ny=NY(i);
    if ny~=NN
        ny = mod(13+ny,NN);
    end
    color(nx,ny)=1;
end
figure
imagesc(color);
colormap summer; 
xticklabels([]); yticklabels([]);


color=zeros(25);
color(13,13) = 2;

[NX,NY,nn]=DiagNeighbours(9);
for i=1:nn
    nx=NX(i);
    if nx~=NN
        nx = mod(13+nx,NN);
    end
    
    ny=NY(i);
    if ny~=NN
        ny = mod(13+ny,NN);
    end
    color(nx,ny)=1;
end
figure
imagesc(color); 
colormap summer;

xticklabels([]); yticklabels([]);