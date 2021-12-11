% dum = zeros(25);
% i1=13; j1=13; r1=4; N = 25;
% [NX,NY,nn]=RadialNeighbours(r1);
% for k =1:nn
%     nx = mod(NX(k)+i1,N); 
%     if (nx==0)
%         nx = N;
%     end
%     
%     ny = mod(NY(k)+j1,N); 
%     if (nx==0)
%         ny = N;
%     end
%     dum(nx,ny) = 5;
% end
% figure; imagesc(dum);
% collect SBC values of 

% RADIAL
rad_t1 = SBC_table(1,3);
rad_t2 = SBC_table(2,3);
rad_t3 = SBC_table(3,3);

radT1 = my_table_fn(rad_t1);
radT2 = my_table_fn(rad_t2);
radT3 = my_table_fn(rad_t3);

rad_table = (radT1+radT2+radT3)/3;

% table of r vs critical beta for each trial
% avg table radial

%SQUARE

sq_t1 = SBC_table(1,1);
sq_t2 = SBC_table(2,1);
sq_t3 = SBC_table(3,1);

sqT1 = my_table_fn(sq_t1);
sqT2 = my_table_fn(sq_t2);
sqT3 = my_table_fn(sq_t3);

sq_table = (sqT1+sqT2+sqT3)/3;

%DIAGONAL

diag_t1 = SBC_table(1,2);
diag_t2 = SBC_table(2,2);
diag_t3 = SBC_table(3,2);


diagT1 = my_table_fn(diag_t1);
diagT2 = my_table_fn(diag_t2);
diagT3 = my_table_fn(diag_t3);

diag_table = (diagT1+diagT2+diagT3)/3;

rx = 2:10;

nx_rad = [12,36,56,96,128,184,228,300,356];
nx_sq = [24,48,80,120,168,224,288,380,440];
nx_diag = [12,24,40,60,84,112,144,180,220];

figure
% stdshade(transpose(NDJg),0.3,'r',1:12); hold on;
plot(rx,log(rad_table),'-o',rx,log(sq_table),'-o',rx,log(diag_table),'-o','LineWidth',3)
legend('Radial','Square','Diagonal')
%title('Critical \beta  v/s r');
xlabel('Radial Distance (r)'); ylabel('log(\beta_c) for PT2')
set(gca,'FontSize',16); 

figure
plot(nx_rad,log(rad_table),'-o',nx_sq,log(sq_table),'-o',nx_diag,log(diag_table),'-o','LineWidth',3)
legend('Radial','Square','Diagonal')
%title('Critical \beta s v/s n');
xlabel('No. of neighbouring cells'); ylabel('log(\beta_c) for PT2')
set(gca,'FontSize',16); xlim([0 460])

figure
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
