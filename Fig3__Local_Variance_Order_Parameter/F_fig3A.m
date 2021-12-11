%fig3_plot1.m
%fig3_plot1_minus.m

tic
BETA = [0.1,1,10,100];
%BETA = [-1,-10];
R=[1,2,5];
%TT = 501;
TT=51;
col={[0.9290,0.6940,0.1250],[0.8500,0.3250,0.0980],[0.6350,0.0780,0.1840],[0.4940,0.1840,0.5560]};
%for i=1:length(R)
i=3;

    rval = R(i);
   figure
    sigmavals = cell(length(BETA));
    for j = 1:length(BETA)
        betaval=BETA(j);
        val = zeros(4,TT);
        for t=1:5
            if betaval==0.1
                %filename = sprintf('radbeta%0.1f_r%d_dt0.001_TMAX50_T%d.mat',betaval,rval,t);
   
                filename = sprintf('../newbetas/radial/r=%d/radbeta%0.1f_r%d_t%d.mat',rval,betaval,rval,t);
            else
                %filename = sprintf('radbeta%d_r%d_dt0.001_TMAX50_T%d.mat',betaval,rval,t);
                
                filename = sprintf('../newbetas/radial/r=%d/radbeta%d_r%d_t%d.mat',rval,betaval,rval,t);
            end
            
            load(filename);
            val(t,:) = LocalSigma(LEUP,TT,1);
        end
        sigmavals{j} = val;
        %figure
        stdshade(val,0.3,col{j},1:TT);
        hold on;
    end
    xlim([0,TT]);
    xticklabels({'0','10','20','30','40','50'})
    xlabel('Time t (s)'); ylabel('Avg. \sigma^2(t)');
    set(gca,'FontSize',16); 
    %legend({'\beta 0.1','','\beta 1','','\beta 10','','\beta 100',''},'FontSize',12);
    toc
    
    
    
    tic
%BETA = [0.1,1,10,100];
BETA = [-1,-10,-1,-10];
R=[1,1,10,10];
%TT = 501;
TT=51;
%col={[0.9290,0.6940,0.1250],[0.8500,0.3250,0.0980],[0.6350,0.0780,0.1840],[0.4940,0.1840,0.5560]};
col={[0,0,1],[0.4660,0.6740,0.1880],[0,0.4470,0.7410],[0.75,0,0.75]};
figure
    sigmavals = cell(length(BETA));
    for j = 1:length(BETA)
        betaval=BETA(j); rval = R(j);
        val = zeros(4,TT);
        for t=1:5
                filename = sprintf('../newbetas/datasets/square/r=%d/minuscircle_beta%d_r%d_t%d.mat',rval,betaval,rval,t);
            
            load(filename);
            val(t,:) = LocalSigma(LEUP,TT,1);
        end
        sigmavals{j} = val;
        stdshade(val,0.3,col{j},1:TT);
        hold on;
    end
    
    xlim([0,TT]);
    xticklabels({'0','10','20','30','40','50'})
    xlabel('Time t (s)'); ylabel('Avg. \sigma^2(t)');
    set(gca,'FontSize',16); 
    legend({'r1 \beta -1','','r1 \beta -10','','r10 \beta -1','','r10 \beta -10',''},'FontSize',12);
    toc