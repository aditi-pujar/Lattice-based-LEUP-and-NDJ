VAL=zeros(1,5);

for i = 1:5
     filename = sprintf('hex_control300_D0_1400_J0_1300_t%d.mat',i);
%     filename = sprintf('hex_control300_D0_1600_J0_700_t%d.mat',i);
%    filename = sprintf('control300_D0_1400_J0_1300_t%d.mat',i);
%     filename = sprintf('control300_D0_1600_J0_700_t%d.mat',i);
    load(filename);
Nf = N(:,:,end);
Df = D(:,:,end);
Jf = J(:,:,end);

Lf = Df+Jf;

%[Nextval,Lextval] = devr(Nf,Df,Jf);
[Nextval,Lextval] = devr2(Nf,Df,Jf);

A=Nextval(:); B = Lextval(:);
v1 = det(cov(A,B));

C = Nf(:); D = Lf(:);

s22 = cov(Nextval(:),Lextval(:));
s11 = cov(Nf(:),Lf(:));

s21 = cov(Nextval(:),Nf(:)) + cov(Lextval(:),Lf(:));
s12 = cov(Nf(:),Nextval(:)) + cov(Lf(:),Lextval(:));

val = det(s22 - (s21/s11)*s12);
VAL(i) = val;
% X = cat(2,C,D);
% Y = cat(2,A,B);
% 
% vYY = cov(Y,Y);
% vYX = cov(Y,X);
% vXX = (cov(X,X));
% vXY = cov(X,Y);
% 
% val = det(vYY - vYX/vXX*vXY);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ccval = 1/(1+log(2*pi) + log(v1)/2 - 12);
% Ns = mean(Nf(:));
% Ds = mean(Df(:));
% Js = mean(Jf(:));
chi=1.5e-8;
beta = 2*(log(5000*sqrt(2))-log(2*3.14159)-log(chi*Nf.*(Df+Jf)))/(log(abs(val)));

cellist = find(Nf>5000);
cell2=cellist; cell1= setdiff(1:576,cellist);

N1=Nf(cell1); D1=Df(cell1); J1=Jf(cell1); ln1 = log(chi*N1.*(D1+J1)); b1 = beta(cell1);

N2=Nf(cell2); D2=Df(cell2); J2=Jf(cell2); ln2 = log(chi*N2.*(D2+J2)); b2 = beta(cell2);

fprintf(1, '\nN1\t%f\t%f\tD1\t%f\t%f\tJ1\t%f\t%f\tln1\t%f\t%f\tb1\t%f\t%f\nN2\t%f\t%f\tD2\t%f\t%f\tJ2\t%f\t%f\tln2\t%f\t%f\tb2\t%f\t%f\n\n',...
mean(N1),std(N1)*100/mean(N1),mean(D1),std(D1)*100/mean(D1),mean(J1),std(J1)*100/mean(J1),...
mean(ln1),std(ln1)*100/mean(ln1),mean(b1),std(b1)*100/mean(b1),...
mean(N2),std(N2)*100/mean(N2),mean(D2),std(D2)*100/mean(D2),mean(J2),std(J2)*100/mean(J2),...
mean(ln2),std(ln2)*100/mean(ln2),mean(b2),std(b2)*100/mean(b2));
end