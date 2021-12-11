function []=hexplot(sample)
NN = size(sample,1);
X=zeros(NN);
Y=zeros(NN);
rad3=sqrt(3);

for j=1:NN
    for i=1:NN
        Y(i,j)= -i*3/2;
         
         if mod(i,2)==0
         X(i,j)= j*rad3;
         
         else
         X(i,j)= j*rad3 + rad3/2;
         end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tmp=sample;
sample=tmp/max(abs(tmp(:)));
 
% [Dip,P]=HartigansDipSignifTest(sample,500);
% SBI=SarleBimodalityIndex(sample);
% nSBI=SBI-5/9;

[XV,YV]=voronoi(X(:),Y(:));

figure
plot(XV,YV,'k-','LineWidth',1.5);
axis equal; axis([1 42 -36 -1]); zoom on;
hold on;
scatter(X(:),Y(:),90,sample(:),'filled');
%colormap('gray');
colorbar;

%title({[strcat("N=",num2str(NN),"x",num2str(NN),"r=",num2str(r)," beta=",num2str(beta)," timestep=",num2str(dt)," #=",num2str(NoI))],[strcat('dip=',num2str(Dip), ', p=',num2str(P))],[strcat('SBI=',num2str(SBI),', nSBI=',num2str(nSBI))]});
%     
end