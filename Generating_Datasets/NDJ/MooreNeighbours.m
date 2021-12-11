function [neighX,neighY,Nn]=MooreNeighbours(r)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Moore neighbors for a given R
%Nn = 6(1+2+..r)=3*r*(r+1)
Nn = 3*r*(r+1);

%for origin at (0,0)

%CUBIC INDICES
listX=zeros(Nn,1);
listY=zeros(Nn,1);
listZ=zeros(Nn,1);

neighX=zeros(Nn,1);
neighY=zeros(Nn,1);

if r>0
k=1;
for x=-r:r
    for y=-r:r
        for z=-r:r

        if (x==0 && y==0 && z==0)
            continue
        end
        
        if x+y+z==0
            listX(k)=x;
            listY(k)=y;
            listZ(k)=z;
            
            neighX(k)= x + (z+mod(z,2))/2;
            neighY(k)=z;
            k=k+1;
        end
        end
    end
end
end

end

