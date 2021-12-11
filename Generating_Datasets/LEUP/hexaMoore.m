function [] = hexaMoore(NN,r,beta,seed)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%length of lattice:
%columns could be anything, rows MUST be EVEN.
%Lattice Generation
TMAX=5; %% total time
%Initial conditions:
dt=0.001; 
NoI=TMAX/dt; %number of iterations
interval=100; %no of iterations after which value of LEUP is stored
SIZE=NoI/interval; %size of LEUP array with snapshot of phenotypes stored after every "iterv" iterations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Neighboring indices given radius
%BIT=1;
[NX,NY,nn]=MooreNeighbours(r);
%function neighbors which returns the list of neighboring indices and no of
%neighbors i.e. size of that array for r and BIT as input.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Initialising
rng(seed,'twister'); %setting seed=1 with generator twister for random no
LEUPinit=-1+2*rand(NN);
LEUP=zeros(NN,NN,SIZE+1);
LEUP(:,:,1)=LEUPinit;

LEUPval=LEUPinit;
LEUPnew=zeros(NN);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%the iterating loops
for t=1:NoI
for l=1:NN
for m=1:NN
            p2=0; p3=0;
            
            %for the cell at (l,m)
            for kk=1:nn
            NXval=mod((-1)^(mod(l+1,2))*NY(kk)+l,NN);
            if NXval==0
                NXval=NN;
            end
            
            NYval=mod((-1)^(mod(l+1,2))*NX(kk)+m,NN);
            if NYval==0
                NYval=NN;
            end
            
            p2=p2+LEUPval(NXval,NYval);
            p3=p3+(LEUPval(NXval,NYval))^2;
            end
%Time step

LEUPnew(l,m)=leup(LEUPval(l,m),p2,p3,beta,nn,dt);

if mod(t,interval)==0
    tau=t/interval;
    LEUP(l,m,tau+1)=LEUPnew(l,m);
end

end %for j
end %for i
LEUPval=LEUPnew;
end %for the time iterations

filename=strcat('MOORBETA',num2str(beta),'_r',num2str(r),'_t',num2str(seed),'.mat');
folder=strcat('r=',num2str(r));
save(fullfile(cd,'hexagonal',folder,filename),'LEUP');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
end