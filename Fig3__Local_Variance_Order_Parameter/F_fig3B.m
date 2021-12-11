% diff_sigma.m
% FIGURE 3B
tic
R=[5];
BETA = [0.1,0.5,0.9,1,5,7,10,15,20,25,50,75,100,250,500,1000];
no = length(BETA);
neg_sd_beta = zeros(1,no);
pos_sd_beta = zeros(1,no);
variance_pos = zeros(1,no);
variance_neg = zeros(1,no);

folder = '..';

for i=1:no
        temp = zeros(1,5);
        %avg = 0;
        for ll=1:5
            
        if i<4
            filename=sprintf('/r=%d/minuscircle_beta%0.1f_r%d_t%d.mat',R(1),(-1)*BETA(i),R(1),ll);
        else
            filename=sprintf('/r=%d/minuscircle_beta%d_r%d_t%d.mat',R(1),(-1)*BETA(i),R(1),ll);
        end
      
        %filename=sprintf('/r=%d/minuscircle_beta%d_r%d_t%d.mat',R(1),-BETA(i),R(1),ll);
            
        load(fullfile(cd,folder,'newbetas','datasets','square',filename));
        tmp=LocalSigma(LEUP,51,1);
        tmp2 = mean(diff(tmp));
        %avg=avg+tmp2;
        temp(ll) = tmp2;
        end
        
        neg_sd_beta(i) = mean(temp);
        variance_neg(i) = std(temp);
end

    neg_sd_beta = fliplr(neg_sd_beta);
    variance_neg =  fliplr(variance_neg);
    
for index=1:no
        temp = zeros(1,5);
        %avg = 0;
        for ll=1:5
        if index<4
            filename=sprintf('/r=%d/circle_beta%0.1f_r%d_t%d.mat',R(1),BETA(index),R(1),ll);
        else
            filename=sprintf('/r=%d/circle_beta%d_r%d_t%d.mat',R(1),BETA(index),R(1),ll);
        end

        %filename=sprintf('/r=%d/minuscircle_beta%d_r%d_t%d.mat',R(1),-BETA(i),R(1),ll);
            
        load(fullfile(cd,folder,'newbetas','square',filename));
        tmp=LocalSigma(LEUP,51,1);
        tmp2 = mean(diff(tmp));
        temp(ll) = tmp2;
        %avg=avg+tmp2;
        end
        
        pos_sd_beta(index) = mean(temp);
        variance_pos(index) = std(temp);
end


% xaxis = cat(2,-fliplr(BETA),BETA);
% figure
% %plot(1:16,neg_sd_beta,'LineWidth',3)
% scatter(1:16,neg_sd_beta,100,'filled')
% hold on
% %plot(17:32,pos_sd_beta,'LineWidth',3)
% scatter(17:32,pos_sd_beta,100,'filled')
% xticklabels({'-250','-75','-15','-1','1','15','75','250'})
% title({[sprintf('Average d \sigma/dt  for r = %d',R(1))],['Max Min Normalisation']});
% legend('\beta<0','\beta>0')

% %xticklabels({'-1000','-500','-250','-100','-75','-50','-25','-20','-15','-10','-7','-5','-1','-0.9','-0.5','-0.1','0.1','0.5','0.9','1','5','7','10','15','20','25','50','75','100','250','500','1000'})
% xticklabels({'-250','-75','-15','-1','1','15','75','250'})
% 
% %ax = gca;
% %ax.XTick = xaxis;
% title('Average d\sigma/dt  for r = 1');
% legend('\beta<0','\beta>0')
% save(gca,'edit_sigma_diff_r1.jpg')

xaxis = cat(2,-fliplr(BETA),BETA);
figure
ax = gca;
ax.FontSize = 160;
errorbar(1:16,neg_sd_beta,variance_neg,'o','MarkerSize',10,'MarkerFaceColor',[0.4660,0.6740,0.1880],'MarkerEdgeColor','green');
hold on
errorbar(17:32,pos_sd_beta,variance_pos,'o','MarkerSize',10,'MarkerFaceColor','blue','MarkerEdgeColor','blue');
xticklabels({'-75','-15','-1','1','15','75','250'})
set(gca,'FontSize',16); xlabel('\beta'); ylabel('Avg. d\sigma^2/dt');
legend({'\beta<0','\beta>0'},'FontSize',20);



toc

