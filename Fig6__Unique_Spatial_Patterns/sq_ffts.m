% FFTs
filename = 'radial_beta100.0_r1_T1.mat'; 
load(filename);
sample = LEUP(:,:,201);
sample = sample/(max(abs(sample(:))));
val = abs(fft2(sample));
val = val/(max(abs(val(:))));

figure
imagesc(val);
colormap summer;
colorbar;
set(gca,'xtick',[],'xticklabel',[],'ytick',[],'yticklabel',[]);
%title('FFT r1 \beta100');
picname = (strcat('FFT_',filename(1:end-4),'.jpg'));
saveas(gca,fullfile(cd,'draft1',picname));

%%
filename = 'radial_beta100.0_r2_T1.mat'; 
load(filename);
sample = LEUP(:,:,201);
sample = sample/(max(abs(sample(:))));
val = abs(fft2(sample));
val = val/(max(abs(val(:))));

figure
imagesc(val);
colormap pink;
colorbar;
set(gca,'xtick',[],'xticklabel',[],'ytick',[],'yticklabel',[]);
%title('FFT r2 \beta100');
picname = (strcat('FFT_',filename(1:end-4),'.jpg'));
saveas(gca,fullfile(cd,'draft1',picname));

%%

nn=4;
%LEUP avg
r1_cell=cell(nn,1);
r2_cell=cell(nn,1);

for i=1:nn
    filename = sprintf('radial_beta100.0_r1_T%d.mat',i);
    load(filename);
    sample = LEUP(:,:,201);
    sample = sample/(max(abs(sample(:))));
    val = abs(fft2(sample));
   
    r1_cell{i} = sqpowspec(val);
    
    
    filename = sprintf('radial_beta100.0_r2_T%d.mat',i);
    load(filename);
    sample = LEUP(:,:,201);
    sample = sample/(max(abs(sample(:))));
    val = abs(fft2(sample));
   
    r2_cell{i} = sqpowspec(val);
end

r1_ps = reshape(cell2mat(r1_cell),[13,nn]);
r2_ps = reshape(cell2mat(r2_cell),[13,nn]);
load('mychessboard.mat','chessboard_ps');

figure
stdshade(transpose(r1_ps),0.3,[0,0.5,0],0:12); %[0,0.4470,0.7410]
hold on;
stdshade(transpose(r2_ps),0.3,[0.4940,0.1840,0.5560],0:12);
hold on;
plot(0:12,chessboard_ps,'--k','LineWidth',4);
legend({'LEUP r1 \beta-100','','LEUP r2 \beta-100','','Ref Chessboard'},'FontSize',20);
%title('Normalised Radial Power Spectrum of Spatial FFT');
xlim([-0.5,12.5]); ylim([-0.1,1.1])
xlabel('Radial Distance r'); ylabel('Radial Power Spectrum p(r)');
set(gca,'FontSize',16);

