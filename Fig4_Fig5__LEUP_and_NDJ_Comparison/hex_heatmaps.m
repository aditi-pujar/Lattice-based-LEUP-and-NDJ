
load('hex_control300_D0_1600_J0_700_t1.mat');
sample = I(:,:,end);
sample = sample/(max(abs(sample(:))));

% minval = min(sample(:)); maxval = max(sample(:));
% sample = (sample-minval)/(maxval-minval);

hexplot(sample);
colorbar;set(gca,'xtick',[],'xticklabel',[],'ytick',[],'yticklabel',[]);
% % 
%title('NDJ D_0 1600 J_0 700');

%%
filename = 'hex_beta100.0_r1_T1.mat'; 
load(filename);
sample = LEUP(:,:,end);
sample = sample/(max(abs(sample(:))));

% minval = min(sample(:)); maxval = max(sample(:));
% sample = (sample-minval)/(maxval-minval);

hexplot(sample);
colorbar;
title('LEUP r5 \beta100');
picname = strcat('heat_',filename(1:end-4),'.jpg');
saveas(gca,fullfile('draft1',picname));

%%
sample = discretisn(abs(sample),6);
hexplot(sample);
colorbar; set(gca,'xtick',[],'xticklabel',[],'ytick',[],'yticklabel',[]);
% % 
%title({['Disc. |LEUP|'],['r5 \beta 100']});
picname = strcat('heat_disc_',filename(1:end-4),'.jpg');
saveas(gca,fullfile('draft1',picname));



