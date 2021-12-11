% T = size(I,3);
% ent_t = LocalSigma(I,T,1);
nn=5;
%LEUP avg
LEUP_cell=cell(nn,1);
g_LEUP_cell=cell(nn,1);

NDJ_cell=cell(nn,1);
g_NDJ_cell=cell(nn,1);

for i=1:nn
    %%%filename = sprintf('radbeta25_r1_dt0.001_TMAX50_T%d.mat',i);
    %filename = sprintf('bigDT_radial_beta100.0_r1_T%d.mat',i);
    filename = sprintf('minuscircle_beta-25_r1_t%d.mat',i);
    load(filename);
    %tl = 201;%size(LEUP,3);
    tl=21;
    LEUP_cell{i} = LocalSigma(LEUP,tl,1);
    g_LEUP_cell{i} = grandGsq(LEUP(:,:,tl));
    
   % filename = sprintf('control300_D0_1600_J0_700_t%d.mat',i);
    filename = sprintf('control300_D0_1400_J0_1300_t%d.mat',i);
    load(filename);
    tnd = size(I,3);
    NDJ_cell{i} = LocalSigma(I,tnd,1);
    g_NDJ_cell{i} = grandGsq(I(:,:,tnd));
end

LEUPent = reshape(cell2mat(LEUP_cell),[tl,nn]);
avg_LEUPent = mean(LEUPent,2);
err_LEUP = std(LEUPent,1,2);

NDJent = reshape(cell2mat(NDJ_cell),[tnd,nn]);
avg_NDJent = mean(NDJent,2);
err_NDJ = std(NDJent,1,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load('radbeta25_r1_dt0.001_TMAX50_T5.mat')

figure
%errorbar(1:tl,avg_LEUPent(:),err_LEUP(:),'LineWidth',3);
%plot(1:tl,avg_LEUPent(:),'LineWidth',3);

%plot(1:31,avg_LEUPent(1:31),'LineWidth',3);
%errorbar(1:31,avg_LEUPent(1:31),err_LEUP(1:31),'LineWidth',3);

tt=21;
mymat = transpose(LEUPent);
mymat = mymat(:,1:21);
stdshade(mymat,0.3,'b',1:21);

hold on;
%errorbar(1:tnd,avg_NDJent(:),err_NDJ(:),'LineWidth',3);
%plot(1:tnd,avg_NDJent(:),'LineWidth',3);

% val = avg_NDJent(1:10:301);
% sdval = err_NDJ(1:10:301);
% plot(1:31,val(:),'LineWidth',3);
%errorbar(1:31,val(:),sdval(:),'LineWidth',3);

mymat2 = transpose(NDJent);
mymat2 = mymat2(:,1:10:201);
stdshade(mymat2,0.3,'g',1:21);

%legend({'LEUP r1 \beta100','','N D1600 J700',''},'FontSize',14);
legend({'LEUP r1 \beta-100','','N D1400 J1300',''},'FontSize',14);
%title('Increasing \sigma^2 Max Min Normalisation (dt=0.1)');
ylabel('Avg. Local \sigma^2'); xlabel('Time (10s or 1000#)');
set(gca,'FontSize',16); xlim([1 21]); 

%title('Increasing \sigma^2 Abs Max Normalisation')

% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LEUPg = reshape(cell2mat(g_LEUP_cell),[12,nn]);
% avg_LEUPg = mean(LEUPg,2);
% err_LEUPg = std(LEUPg,1,2);
% 
% NDJg = reshape(cell2mat(g_NDJ_cell),[12,nn]);
% avg_NDJg = mean(NDJg,2);
% err_NDJg = std(NDJg,1,2);
% 
% %load('mychessboard.mat','chessboard_g');
% 
% figure
% stdshade(transpose(LEUPg),0.3,'m',1:12);
% hold on;
% stdshade(transpose(NDJg),0.3,'r',1:12);
% hold on;
% plot(1:12,chessboard_g(:),'--k','LineWidth',4);
% legend({'LEUP r1 \beta100','','N D1600 J700','','Ref. Salt & Pepper'},'FontSize',14);
% %title('Radial Distribution Function (Increasing \sigma^2) (dt=0.1)');
% xlim([0.5,12.5]); set(gca,'FontSize',16); 
% xlabel('Radial Distance (r)'); ylabel('Radial Distribution Fn. g(r)');
% 
% figure
% stdshade(transpose(LEUPg),0.3,'b',1:12);
% hold on;
% stdshade(transpose(NDJg),0.3,'g',1:12);
% hold on;
% plot(1:12,chessboard_g(:),'--k','LineWidth',4);
% legend({'LEUP r1 \beta100','','N D1600 J700','','Ref. Salt & Pepper'},'FontSize',14);
% %title('Radial Distribution Function (Increasing \sigma^2) (dt=0.1)');
% xlim([0.5,12.5]); set(gca,'FontSize',16); 
% xlabel('Radial Distance (r)'); ylabel('Radial Distribution Fn. g(r)');
% 
% % figure
% % errorbar(1:12,avg_LEUPg(:),err_LEUPg(:),'LineWidth',3);
% % 
% % '-mo',...
% %     'LineWidth',2,...
% %     'MarkerEdgeColor','k',...
% %     'MarkerFaceColor',[.49 1 .63],...
% %     'MarkerSize',10)
