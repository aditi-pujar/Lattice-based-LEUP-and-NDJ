%%%%%%%%%%%%%%%%%%%%%%%
function [SIGMA]=LocalEnt_HexFn(f,NN,r)
SIGMA=zeros(NN,NN);

%tmp=f/max(abs(f(:)));
minval = min(f(:)); maxval=max(f(:));
tmp = (f-minval)/(maxval-minval);

f=tmp;

for l=1:NN
    for m=1:NN
        [NX,NY,Nn]=MooreNeighbours(r);
        tmp1=f(l,m); tmp2=(f(l,m))^2;
        
        for k=1:Nn
            
            nxval=mod((-1)^(mod(l+1,2))*NY(k)+l,NN);
            if nxval==0
                nxval=NN;
            end
            
            nyval=mod((-1)^(mod(l+1,2))*NX(k)+m,NN);
            if nyval==0
                nyval=NN;
            end

            tmp1=f(nxval,nyval)+tmp1;
            tmp2=(f(nxval,nyval))^2+tmp2;
        end
        
        mean=tmp1/(Nn+1); sqmean=tmp2/(Nn+1);
        SIGMA(l,m)=sqmean-(mean)^2;
    end
end

end
