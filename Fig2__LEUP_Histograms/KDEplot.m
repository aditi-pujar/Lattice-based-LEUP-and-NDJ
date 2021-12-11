clear all;
%R=[1,2,7,10]; %[1,2,3,4,5,10,15,20,25];
R=[1];
%BETA=[0.1,0.5,0.9,1,5,7,10,15,20,25,50,70,100,250];
BETA=[5,25,100,250];

C=cell(1,5);
figure
sgtitle({['Z Score Normalisation']})
%sgtitle({['Max Min Normalisation']})
%sgtitle({['Abs Max Normalisation']})

% % For circle negative
%     for index=1:length(BETA)
%         for ll=1:5
%         filename=sprintf('/r=%d/minuscircle_beta%d_r%d_t%d.mat',R(1),-BETA(index),R(1),ll);
%             
%         load(fullfile(cd,'datasets','square',filename));
%         LEUPval=LEUP(:,:,51);
%         sample=LEUPval/max(abs(LEUPval(:)));
% % 
% %         maxval = max(LEUPval(:)); minval=min(LEUPval(:));
% %         sample = (LEUPval-minval)/(maxval-minval);
% 
%         %sample = zscore(LEUPval(:));
%         C{ll}=sample(:);
%         end
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%     final=cell2mat(C);
%     %SBCval=SarleBimodalityIndex(final(:));
%     subplot(1,4,index)
%         data = final(:);
%         n = 2^4;
%         [bandwidth,density,xmesh,cdf]=kde(data,n,-1,1);
%         
%         subplot(1,4,index)
%         a = area(xmesh,density);
%         a.FaceAlpha = 0.4;
%         a.LineWidth = 2;
%         a.FaceColor = 'magenta';
%         a.EdgeColor = 'magenta';
%         set(gca,'Xticklabel',[]);
%         %a.xticklabel = [];
%         title({[strcat("\beta = ", num2str(-BETA(index)))]});         
%    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % For square positive
%     for index=1:length(BETA)
%         for ll=1:5
%         filename=sprintf('/r=%d/circle_beta%d_r%d_t%d.mat',R(1),BETA(index),R(1),ll);
%             
%         load(fullfile(cd,'square',filename));
%         LEUPval=LEUP(:,:,51);
%         %sample=LEUPval/max(abs(LEUPval(:)));
%         sample = zscore(LEUPval(:)); 
%         
% %         maxval = max(LEUPval(:)); minval=min(LEUPval(:));
% %         sample = (LEUPval-minval)/(maxval-minval);
% %         
%         C{ll}=sample(:);
%         end
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%     final=cell2mat(C);
%     %SBCval=SarleBimodalityIndex(final(:));
%     subplot(1,4,index)
%         data = final(:);
%         n = 2^4;
%         [bandwidth,density,xmesh,cdf]=kde(data,n,-1,1);
%         
%         subplot(1,4,index)
%         a = area(xmesh,density);
%         a.FaceAlpha = 0.4;
%         a.LineWidth = 2;
%         a.FaceColor = 'blue';
%         a.EdgeColor = 'blue';
%         set(gca,'Xticklabel',[]);
%         %a.xticklabel = [];
%         title({[strcat("\beta = ", num2str(BETA(index)))]});         
%     end
% 
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%For hexagonal positive
    for index=1:length(BETA)
        for ll=1:5
        filename=sprintf('/r=%d/MOORBETA%d_r%d_t%d.mat',R(1),BETA(index),R(1),ll);
            
        load(fullfile(cd,'hexagonal',filename));
        LEUPval=LEUP(:,:,51);
        %sample=LEUPval/max(abs(LEUPval(:)));
        sample = zscore(LEUPval(:));
%         
%         minval=min(LEUPval(:)); maxval=max(LEUPval(:));
%         sample =  (LEUPval-minval)/(maxval-minval);
%         
        C{ll}=sample(:);
        end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    final=cell2mat(C);
    SBCval=SarleBimodalityIndex(final(:));
    subplot(1,4,index)
        data = final(:);
        n = 2^4;
        [bandwidth,density,xmesh,cdf]=kde(data,n,-1,1);
        
        subplot(1,4,index)
        a = area(xmesh,density);
        a.FaceAlpha = 0.4;
        a.LineWidth = 2;
        a.FaceColor = 'green';
        a.EdgeColor = 'green';
        set(gca,'Xticklabel',[]);
        %a.xticklabel = [];
        title({[strcat("\beta = ", num2str(BETA(index)))]});         
   end