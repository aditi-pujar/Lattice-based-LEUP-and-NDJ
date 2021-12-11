% tsize=size(I,3);
% n=zeros(1,tsize);
% d=zeros(1,tsize);
% j=zeros(1,tsize);
% i=zeros(1,tsize);
% 
% for t=1:tsize
%     n(t)=mean(N(:,:,t),'all');
%     d(t)=mean(D(:,:,t),'all');
%     j(t)=mean(J(:,:,t),'all');
%     i(t)=mean(I(:,:,t),'all');
% end
% 
% x=1:tsize;
% 
% figure
% plot(x,n,x,d,x,j,x,i);
% legend('n','d','j','i');
% 
% %seed = 1:5;

parfor seed=1:5
    %periodic_square_NDJ(1400,1300,seed);
    hexaMoore_NDJ(1400,1300,seed);
end


    