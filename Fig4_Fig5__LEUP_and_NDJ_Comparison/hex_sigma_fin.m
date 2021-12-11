% T = size(I,3);
% ent_t = LocalSigma(I,T,1);
nn=5;
%LEUP avg
LEUP_cell=cell(nn,1);
absLEUP_cell=cell(nn,1);
g_LEUP_cell=cell(nn,1);
g_absLEUP_cell=cell(nn,1);

NDJ_cell=cell(nn,1);
g_NDJ_cell=cell(nn,1);

for i=1:nn
    %filename = sprintf('radbeta25_r1_dt0.001_TMAX50_T%d.mat',i);
    filename = sprintf('hex_beta100.0_r1_T%d.mat',i);
    load(filename);
    tl = 201;%size(LEUP,3);
    LEUP_cell{i} = LocalSigma(LEUP,tl,2);
    g_LEUP_cell{i} = grandGhex(LEUP(:,:,tl));
    
    absLEUP_cell{i} = LocalSigma(abs(LEUP),tl,2);
    g_absLEUP_cell{i} = grandGhex(abs(LEUP(:,:,tl)));
    
    filename = sprintf('hex_control300_D0_1600_J0_700_t%d.mat',i);
    load(filename);
    tnd = size(I,3);
    NDJ_cell{i} = LocalSigma(I,tnd,2);
    g_NDJ_cell{i} = grandGhex(I(:,:,tnd));
end

LEUPent = reshape(cell2mat(LEUP_cell),[tl,nn]);
avg_LEUPent = mean(LEUPent,2);
err_LEUP = std(LEUPent,1,2);

absLEUPent = reshape(cell2mat(absLEUP_cell),[tl,nn]);
avg_absLEUPent = mean(absLEUPent,2);
err_absLEUP = std(absLEUPent,1,2);

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

mymat = transpose(LEUPent);
mymat = mymat(:,1:31);
stdshade(mymat,0.3,'b',1:31);

hold on;
mymat3 = transpose(absLEUPent);
mymat3 = mymat3(:,1:31);
stdshade(mymat3,0.3,'c',1:31);

hold on;
%errorbar(1:tnd,avg_NDJent(:),err_NDJ(:),'LineWidth',3);
%plot(1:tnd,avg_NDJent(:),'LineWidth',3);

% val = avg_NDJent(1:10:301);
% sdval = err_NDJ(1:10:301);
% plot(1:31,val(:),'LineWidth',3);
%errorbar(1:31,val(:),sdval(:),'LineWidth',3);

mymat2 = transpose(NDJent);
mymat2 = mymat2(:,1:10:301);
stdshade(mymat2,0.3,'g',1:31);

legend({'LEUP r1 \beta100','','|LEUP|','','N D1600 J700',''},'FontSize',14);
%title('Hexagonal Increasing \sigma^2 Max Min Normalisation');
ylabel('Avg. Local \sigma^2'); xlabel('Time (10s or 1000#)');
set(gca,'FontSize',16); xlim([1 31]); 

%title('Increasing \sigma^2 Abs Max Normalisation')

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
LEUPg = reshape(cell2mat(g_LEUP_cell),[12,nn]);
avg_LEUPg = mean(LEUPg,2);
err_LEUPg = std(LEUPg,1,2);

absLEUPg = reshape(cell2mat(g_absLEUP_cell),[12,nn]);
avg_absLEUPg = mean(absLEUPg,2);
err_absLEUPg = std(absLEUPg,1,2);

NDJg = reshape(cell2mat(g_NDJ_cell),[12,nn]);
avg_NDJg = mean(NDJg,2);
err_NDJg = std(NDJg,1,2);

load('myhex_antihex.mat','hex_g');

figure
stdshade(transpose(LEUPg),0.3,'y',1:12);
hold on;
stdshade(transpose(absLEUPg),0.3,'m',1:12);
hold on;
stdshade(transpose(NDJg),0.3,'r',1:12);
hold on;
plot(1:12,hex_g(:),'--k','LineWidth',3);
%legend('LEUP r1 \beta100','','N D1600 J700','','Ref. Salt & Pepper');
legend({'LEUP r1 \beta100','','|LEUP|','','N D1600 J700','','Ref. Hex Antihex'},'FontSize',12);
%title('Hexagonal Radial Distribution Function (Increasing \sigma^2)');
xlim([0.5,12.5]); set(gca,'FontSize',16); 
xlabel('Radial Distance (r)'); ylabel('Radial Distribution Fn. g(r)');

figure
stdshade(transpose(LEUPg),0.3,'b',1:12);
hold on;
stdshade(transpose(absLEUPg),0.3,'c',1:12);
hold on;
stdshade(transpose(NDJg),0.3,'g',1:12);
hold on;
plot(1:12,hex_g(:),'--k','LineWidth',3);
%legend('LEUP r1 \beta100','','N D1600 J700','','Ref. Salt & Pepper');
legend({'LEUP r1 \beta100','','|LEUP|','','N D1600 J700','','Ref. Hex Antihex'},'FontSize',12);
%title('Hexagonal Radial Distribution Function (Increasing \sigma^2)');
xlim([0.5,12.5]); set(gca,'FontSize',16); 
xlabel('Radial Distance (r)'); ylabel('Radial Distribution Fn. g(r)');


% figure
% errorbar(1:12,avg_LEUPg(:),err_LEUPg(:),'LineWidth',3);
% 
% '-mo',...
%     'LineWidth',2,...
%     'MarkerEdgeColor','k',...
%     'MarkerFaceColor',[.49 1 .63],...
%     'MarkerSize',10)

nn=5;
LEUP avg
LEUP_cell=cell(nn,1);
absLEUP_cell=cell(nn,1);
g_LEUP_cell=cell(nn,1);
g_absLEUP_cell=cell(nn,1);

NDJ_cell=cell(nn,1);
g_NDJ_cell=cell(nn,1);

for i=1:nn
    filename = sprintf('radbeta25_r1_dt0.001_TMAX50_T%d.mat',i);
    filename = sprintf('hex_beta-10.0_r1_T%d.mat',i);
    load(filename);
    tl = 201;%size(LEUP,3);
    LEUP_cell{i} = LocalSigma(LEUP,tl,2);
    g_LEUP_cell{i} = grandGhex(LEUP(:,:,tl));
    
    absLEUP_cell{i} = LocalSigma(abs(LEUP),tl,2);
    g_absLEUP_cell{i} = grandGhex(abs(LEUP(:,:,tl)));
    
    filename = sprintf('hex_control300_D0_1400_J0_1300_t%d.mat',i);
    load(filename);
    tnd = size(I,3);
    NDJ_cell{i} = LocalSigma(I,tnd,2);
    g_NDJ_cell{i} = grandGhex(I(:,:,tnd));
end

LEUPent = reshape(cell2mat(LEUP_cell),[tl,nn]);
avg_LEUPent = mean(LEUPent,2);
err_LEUP = std(LEUPent,1,2);

NDJent = reshape(cell2mat(NDJ_cell),[tnd,nn]);
avg_NDJent = mean(NDJent,2);
err_NDJ = std(NDJent,1,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('radbeta25_r1_dt0.001_TMAX50_T5.mat')

figure
errorbar(1:tl,avg_LEUPent(:),err_LEUP(:),'LineWidth',3);
plot(1:tl,avg_LEUPent(:),'LineWidth',3);

plot(1:31,avg_LEUPent(1:31),'LineWidth',3);
errorbar(1:31,avg_LEUPent(1:31),err_LEUP(1:31),'LineWidth',3);

mymat = transpose(LEUPent);
mymat = mymat(:,1:31);
stdshade(mymat,0.3,'b',1:31);

hold on;
errorbar(1:tnd,avg_NDJent(:),err_NDJ(:),'LineWidth',3);
plot(1:tnd,avg_NDJent(:),'LineWidth',3);

val = avg_NDJent(1:10:301);
sdval = err_NDJ(1:10:301);
plot(1:31,val(:),'LineWidth',3);
errorbar(1:31,val(:),sdval(:),'LineWidth',3);

mymat2 = transpose(NDJent);
mymat2 = mymat2(:,1:10:301);
stdshade(mymat2,0.3,'g',1:31);

legend({'LEUP r1 \beta-100','','N D1400 J1300',''},'FontSize',14);
title('Increasing \sigma^2 Max Min Normalisation (dt=0.1)');
ylabel('Avg. Local \sigma^2'); xlabel('Time (10s or 1000#)');
set(gca,'FontSize',16); xlim([1 31]); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%