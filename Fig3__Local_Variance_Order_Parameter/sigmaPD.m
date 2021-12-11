
%MINUS phase diagrams (laterally inverted)
nboot = 500;
tic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Phase diagrams
R=1:10;
BETA=[0.1,0.5,0.9,1,5,7,10,15,20,25,50,75,100,250,500,1000];

sigmaval1=zeros(length(R),length(BETA));
sigmaval2=zeros(length(R),length(BETA));

    Csigma1=cell(1,5);
    Csigma2=cell(1,5);

% NEGATIVE Local Variance Phase diagram
for lindex=1:5
for kindex=1:length(R)
    for mindex=1:length(BETA)
        if mindex<4
            filename=sprintf('/r=%d/minusMOORBETA%0.1f_r%d_t%d.mat',R(kindex),-BETA(mindex),R(kindex),lindex);
        else
            filename=sprintf('/r=%d/minusMOORBETA%d_r%d_t%d.mat',R(kindex),-BETA(mindex),R(kindex),lindex);
        end
            
        load(fullfile(cd,'datasets','hexagonal',filename));
        tmp1=LEUP(:,:,51);
        sample3=tmp1/max(abs(tmp1(:)));
        sigmaval1(kindex,mindex)= LocalEnt_HexFn(sample3,24,3);
        %SBI(kindex,mindex)=SarleBimodalityIndex(sample3(:));
    end
end
Csigma1{1,lindex}=sigmaval1;
end

    
% POSITIVE Local Variance Phase diagram
for lindex=1:5
for kindex=1:length(R)
    for mindex=1:length(BETA)
        if mindex<4
            filename=sprintf('/r=%d/MOORBETA%0.1f_r%d_t%d.mat',R(kindex),BETA(mindex),R(kindex),lindex);
        else
            filename=sprintf('/r=%d/MOORBETA%d_r%d_t%d.mat',R(kindex),BETA(mindex),R(kindex),lindex);
        end
            
        load(fullfile(cd,'hexagonal',filename));
        tmp1=LEUP(:,:,51);
        sample3=tmp1/max(abs(tmp1(:)));
        sigmaval2(kindex,mindex)= LocalEnt_HexFn(sample3,24,3);
        %SBI(kindex,mindex)=SarleBimodalityIndex(sample3(:));
    end
end
Csigma2{1,lindex}=sigmaval2;
end

avgSIGMAminushex=(Csigma1{1,1}+Csigma1{1,2}+Csigma1{1,3}+Csigma1{1,4}+Csigma1{1,5})/5;
avgSIGMAplushex=(Csigma2{1,1}+Csigma2{1,2}+Csigma2{1,3}+Csigma2{1,4}+Csigma2{1,5})/5;

avgsigma = cat(2,flip(avgSIGMAminushex,2),avgSIGMAplushex);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   figure
           imagesc(avgsigma);
           colorbar
           title({[strcat('Average Local Variance \sigma^2_L')],[strcat('Hexagonal Lattice')]});
           xlabel('\beta');
           ylabel('radius');
           yticklabels([1,2,3,4,5,6,7,8,9,10]); 
           xticklabels([-75,-25,-1,10,50,250])