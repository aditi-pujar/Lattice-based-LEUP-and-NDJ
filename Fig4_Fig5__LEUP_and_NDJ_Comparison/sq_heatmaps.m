
load('control300_D0_1600_J0_700_t1.mat');
sample = I(:,:,end);
sample = sample/(max(abs(sample(:))));

% minval = min(sample(:)); maxval = max(sample(:));
% sample = (sample-minval)/(maxval-minval);
figure
imagesc(sample);
colorbar; set(gca,'xtick',[],'xticklabel',[],'ytick',[],'yticklabel',[]);
% % 
%title('NDJ D_0 1600 J_0 700');


%%
load('radial_beta10.0_r1_T1.mat');
sample = LEUP(:,:,201);
sample = sample/(max(abs(sample(:))));

% minval = min(sample(:)); maxval = max(sample(:));
% sample = (sample-minval)/(maxval-minval);
figure
imagesc(sample);
colorbar;
%title('LEUP r2 \beta100'); 
set(gca,'xtick',[],'xticklabel',[],'ytick',[],'yticklabel',[]);
% % 

%%
sample = (discretisn(sample,3))/2;
figure
imagesc(sample);
colorbar;
%title({['Disc. LEUP (#=3)'],['r2 \beta 100']});
set(gca,'xtick',[],'xticklabel',[],'ytick',[],'yticklabel',[]);
% % 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIG 6A

% % load('radial_beta10.0_r2_T1.mat');
% % sample = LEUP(:,:,201);
% % sample = sample/(max(abs(sample(:))));
% % 
% % % minval = min(sample(:)); maxval = max(sample(:));
% % % sample = (sample-minval)/(maxval-minval);
% % figure
% % imagesc(sample);
% % colormap winter;
% % colorbar; set(gca,'xtick',[],'xticklabel',[],'ytick',[],'yticklabel',[]);
% % 
% % %title('LEUP r2 \beta100');
% % 
% % %%
% % sample = discretisn(sample,3);
% % figure
% % imagesc(sample);
% % colormap winter;
% % colorbar; set(gca,'xtick',[],'xticklabel',[],'ytick',[],'yticklabel',[]);
% % 
% % %title({['Disc. LEUP (#=3)'],['r2 \beta 100']});
