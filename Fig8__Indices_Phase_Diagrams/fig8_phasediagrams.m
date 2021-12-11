nboot = 500;
tic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Phase diagrams
R=1:10;
BETA=[0.1,0.5,0.9,1,5,7,10,15,20,25,50,75,100,250,500,1000];

dipval=zeros(length(R),length(BETA));
pval=zeros(length(R),length(BETA));
SBI=zeros(length(R),length(BETA));
nSBI=zeros(length(R),length(BETA));

MAX=zeros(length(R),length(BETA));
    Cdip=cell(1,5);
    Cpval=cell(1,5);
    Csbc=cell(1,5);
    
for lindex=1:5
for kindex=1:length(R)
    for mindex=1:length(BETA)
        if mindex<4
            filename=sprintf('/r=%d/radbeta%0.1f_r%d_t%d.mat',R(kindex),BETA(mindex),R(kindex),lindex);
        else
            filename=sprintf('/r=%d/radbeta%d_r%d_t%d.mat',R(kindex),BETA(mindex),R(kindex),lindex);
        end
            
       load(fullfile(cd,'radial',filename)); 
        
        tmp1=LEUP(:,:,51);
        sample=tmp1/max(abs(tmp1(:)));
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [dipval(kindex,mindex),pval(kindex,mindex)]=HartigansDipSignifTest(sample,500);
        SBI(kindex,mindex)=SarleBimodalityIndex(sample(:));      
    end
end
    Cdip{1,lindex}=dipval;
    Cpval{1,lindex}=pval;
    Csbc{1,lindex}=SBI;
end

avgDIP=(Cdip{1,1}+Cdip{1,2}+Cdip{1,3}+Cdip{1,4}+Cdip{1,5})/5;
avgPVAL=(Cpval{1,1}+Cpval{1,2}+Cpval{1,3}+Cpval{1,4}+Cpval{1,5})/5;
avgSBC=(Csbc{1,1}+Csbc{1,2}+Csbc{1,3}+Csbc{1,4}+Csbc{1,5})/5;
  
   figure
           imagesc(avgDIP)
           colorbar
           title({[strcat("Dip Value")],[strcat('Square Lattice (25x25), Positive Beta')]});
           xlabel('beta');
           ylabel('radius');
           
   figure
           imagesc(avgPVAL)
           colorbar
           title({[strcat("P Value")],[strcat('Square Lattice (25x25), Positive Beta')]});
           xlabel('beta');
           ylabel('radius');
         
   figure
           imagesc(avgSBC)
           colorbar
           title({[strcat("SBC Value")],[strcat('Square Lattice (25x25), Positive Beta')]});
           xlabel('beta');
           ylabel('radius');
%   
toc
% 
% tmp3=sign(nSBI);
% nSBI=tmp3;
%  figure
%          imagesc([BETA(1),BETA(2),BETA(3),BETA(4),BETA(5),BETA(6),BETA(7),BETA(8),BETA(9),BETA(10),BETA(11),BETA(12)],[R(1),R(2),R(3),R(4),R(5),R(6),R(7),R(8),R(9),R(10),R(11),R(12)],nSBI)
%          colorbar
%          title({[strcat("nSBI phase diagram")],[strcat('threshold=',num2str(thresh))]});
%          %colormap('gray');
%          xlabel('beta');
%          ylabel('radius');
         
%          
%  figure
%          imagesc(log(MAX))
%          colorbar
%          title({[strcat("Maximum of LEUP")],["Log scale"],['VN Neighborhood']});
%          %colormap('gray');
%          xlabel('beta');
%          ylabel('radius');
% 
%  
% [Xtmp,Ytmp]=meshgrid(rval,betaval);
% Xfinal=Xtmp(:);
% Yfinal=Ytmp(:);
% Z1final=dipval(:);
% 
% subplot(2,1,1)
% plot3(Xfinal,Yfinal,Z1final)
% 
% subplot(2,1,1)
% plot3(rval,betaval,pval)
