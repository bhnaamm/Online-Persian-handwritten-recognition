close all
clear all
clc

% if isempty(strfind(path,'./HMMtlbx;'))
%     addpath('./HMMtlbx');
% end
% get the 20 instanses of 100 classes of subwords which have been converted
% into chaincodes 8-conn
classes=cell(100,1);

% initial state for hmms
hmms=cell(100,1);


O = 8;          %Number of coefficients in a vector
% T = 240;         %Number of vectors in a sequence
% nex = 15;        %Number of sequences
% M = 1;          %Number of mixtures
Q = 4;          %Number of states

cov_type = 'full';



% initial guess of parameters
prior0 = [1;0;0;0];
transmat0 = [0.6,0.4,0,0;0,0.6,0.4,0;0,0,0.6,0.4;0,0,0,0.6];
% transmat0=[0.6,0.4;0.6,0;0,0,0.6,0.4;0,0,0,0.6];
% data=zeros(1,9,15);
figure
colors=hsv(128);

for i=1:100
    
    classtemp = getClasses(i);
    classtemp = getvector(classtemp(3:17));
    %     matcls=cell2mat(classtemp);
%     extendedcltemp=addotherclasses(classtemp);
    extendedcltemp= classtemp;
    classes{i} = extendedcltemp;

%     classes{i} = classtemp;
%     extendedcltemp =classtemp;
    
%     data=cell2struct(extendedcltemp, 15);
    %     idx3 = kmeans(classtemp,3,'Distance','cityblock');
    %     [silh3,h] = silhouette(classtemp,idx3,'cityblock');
    %     h = gca;
    %     h.Children.EdgeColor = [.8 .8 1];
    %     xlabel 'Silhouette Value';
    %     ylabel 'Cluster';
    
%     Sigma0 = repmat(eye(O), [1 1 Q M]);
%     % Initialize each mean to a random data point
%     indices = randperm(T*nex);
%     mu0 = reshape(data(:,indices(1:(Q*M))), [O Q M]);
%     mixmat0 = mk_stochastic(rand(Q,M));
%     hmms{i}.prior1 = normalise(rand(Q,1));
%     hmms{i}.transmat1 = mk_stochastic(rand(Q,Q));
%     hmms{i}.obsmat1 = mk_stochastic(rand(Q,O));
%     
    hmms{i}.prior1 = prior0;
    hmms{i}.transmat1 = transmat0;
    hmms{i}.obsmat1 = mk_stochastic(rand(Q,O));
    
    [hmms{i}.LL, hmms{i}.prior2, hmms{i}.transmat2,hmms{i}.obsmat2] =...
        dhmm_em(extendedcltemp, hmms{i}.prior1, hmms{i}.transmat1, hmms{i}.obsmat1, 'obs_prior_weight',1,'adj_prior',0);


    
    plot(hmms{i}.LL,'Color',[rand rand rand],'LineWidth',2);
    hold on
end

save('hmms.mat','hmms');
save('classes.mat','classes');


% 37 has been commented and 40 has been added

