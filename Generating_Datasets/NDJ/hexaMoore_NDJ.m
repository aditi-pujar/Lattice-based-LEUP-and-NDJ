function hexaMoore_NDJ(D0_value,J0_value,seed)
%% Ready get set go:
close all
tic
%% Declaring Global Variables: %%
global dt gamma gammaI N0 D0 J0 kTD kTJ kC I0 nN nD nJ nF lambdaN lambdaJ lambdaD ldf ljf NN TMAX 

%% Signalling Paramters:%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% taken from NJP 2015:
% Degradation rate:
gamma=0.1;  gammaI=0.5;
% Transcription rate:
N0=1400;
D0=1600; 
J0=1200; 
% kt and kc:
kTD=5e-5; 
kTJ=5e-5; 
kC=5e-4;
% Threshold value of NICD:
I0=200;
% Hill function coefficient or cooperativity:
nN=2.0; nD=2.0; nJ= 5.0;nF=1.0;
% Lambdas(fold change)
lambdaN= 2.0; 
lambdaJ= 2.0; 
lambdaD= 0.0;
% Lambda for fringe:
ldf=1.0;
%% Change the parameter for different runs:
D0=D0_value;
J0=J0_value;
%folder_name=folder; 
%% inverse fringe
ljf=1/ldf;

%% Space-time paramters:
%columns could be anything, rows MUST be EVEN.
%Lattice Generation
NN=24;
TMAX=300; %% total time   %2000 for final datasets, interval = 1000
dt=0.01; % time step:
NoI=TMAX/dt; %number of iterations
interval=100; %no of iterations after which value of LEUP is stored
SIZE=NoI/interval; %size of LEUP array with snapshot of phenotypes stored after every "iterv" iterations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Neighboring indices given radius
%BIT=1;
%radius=1;
[NX,NY,nn]=MooreNeighbours(1);
%function MooreNeighbors which returns the list of neighboring indices and no of
%neighbors i.e. size of that array for r and BIT as input.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initialising
rng(seed,'twister');
%% Initial conditions:%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
noise = 0.5;

Ninit=N0*(1+noise*(-0.5+rand(NN)));
Dinit=D0*(1+noise*(-0.5+rand(NN)));
Jinit=J0*(1+noise*(-0.5+rand(NN)));
Iinit=I0*(1+noise*(-0.5+rand(NN)));

% Initialise array for storing results of the time step:
Nnew=zeros(NN);Dnew=zeros(NN);Jnew=zeros(NN);Inew=zeros(NN);
% Initialising the 3D array for storing NDJI values:
N=zeros(NN,NN,SIZE+1);D=zeros(NN,NN,SIZE+1);
J=zeros(NN,NN,SIZE+1);I=zeros(NN,NN,SIZE+1);
T=zeros(1,SIZE+1);
% Putting the first time point in arrays:
N(:,:,1)=Ninit;D(:,:,1)=Dinit;J(:,:,1)=Jinit;I(:,:,1)=Iinit;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% iterating loops
for t=1:NoI
for l=1:NN
for m=1:NN
    % Initialising External quantities for a cell:
    Dext=0;Jext=0;N_D_I_ext=0;N_J_I_ext=0;
    % Summing over neigbours and obtaining external ligand values
    for kk=1:nn
        NXval=mod((-1)^(mod(l+1,2))*NY(kk)+l,NN);
        if NXval==0
            NXval=NN;
        end
            
        NYval=mod((-1)^(mod(l+1,2))*NX(kk)+m,NN);
        if NYval==0
            NYval=NN;
        end
            
        N_D_I_ext=N_D_I_ext+Ninit(NXval,NYval)*Hill(Iinit(NXval,NYval),I0,nF,ldf);
        N_J_I_ext=N_J_I_ext+Ninit(NXval,NYval)*Hill(Iinit(NXval,NYval),I0,nF,ljf);
        Dext=Dext+Dinit(NXval,NYval);
        Jext=Jext+Jinit(NXval,NYval);
    end
    % Dividing the external values by average to bring them back to normal values
    N_D_I_ext=N_D_I_ext/nn;N_J_I_ext=N_J_I_ext/nn;Dext=Dext/nn;Jext=Jext/nn;
    %Time step
    [Nnew(l,m),Dnew(l,m),Jnew(l,m),Inew(l,m)]=ndj_equations(Ninit(l,m),Dinit(l,m),Jinit(l,m),Iinit(l,m),Dext,Jext,N_D_I_ext,N_J_I_ext);

end %for j
end %for i

Ninit=Nnew;Dinit=Dnew;Jinit=Jnew;Iinit=Inew;
if mod(t,interval)==0
    tau=t/interval;
    N(:,:,tau+1)=Nnew; D(:,:,tau+1)=Dnew;
    J(:,:,tau+1)=Jnew; I(:,:,tau+1)=Inew;
    T(tau+1)=t*dt;
end
end %for the time iterations
%% Save the data here:
%save(strcat(folder_name,'kTD_',num2str(kTD),'_kTJ_',num2str(kTJ),'_N0_',num2str(N0),'_D0_',num2str(D0),'_J0_',num2str(J0),'_f_',num2str(ldf),'.mat'),'N','D','I','J','T','kTD','kTJ','kC','ldf')
save(strcat('hex_control300_D0_',num2str(D0),'_J0_',num2str(J0),'_t',num2str(seed),'.mat'),'N','D','I','J','T','kTD','kTJ','kC','ldf','N0','D0','J0','I0')

%% Print time taken:
toc
end