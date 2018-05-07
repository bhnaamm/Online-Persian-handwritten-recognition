close all
clear all
clc

% load('class.mat');
load('hmms.mat');


% classResults=cell(100,1);
% for i=1:100
%     loglik0 =log(0);
%     classtemp=getClasses(i);
%     classtemp=classtemp(16:20,:);
%     classResults{i}.real=i;
%     classResults{i}.detected=i;
%     for j=1:100
%         logliktmp = dhmm_logprob(classtemp, hmms{j}.prior2, hmms{j}.transmat2, hmms{j}.obsmat2);
%         if logliktmp>loglik0
%             loglik0 = logliktmp;
%             classResults{i}.detected=j;
%         end
%     end
% end

classResults=zeros(100,5,2,'uint8');


dst=90;


for k=1:100
    
    classtemp=getClasses(k);
% %     classtemp=getvector(classtemp);
    for i=1:5
%         classResults(k,i,1)=i;            %index
        classResults(k,i,1)=k;          %real
        classResults(k,i,2)=k;          %detected
        if(i<3)
            cltemp=getvector(classtemp(i));
%             cltemp=classtemp(i);
        else
            cltemp=getvector(classtemp(15+i));
%             cltemp=classtemp(15+i);
        end
%         extendedcltemp=addotherclasses(cltemp);
          extendedcltemp=cltemp;
%         cltemp=cell2mat(cltemp);
        loglik0 =log(0);
        for j=1:100
            logliktmp{j} = dhmm_logprob(extendedcltemp, hmms{j}.prior2, hmms{j}.transmat2, hmms{j}.obsmat2);
                
            if logliktmp{j}>=loglik0
                loglik0 = logliktmp{j};
                classResults(k,i,2)=j;
            end
        end
    end
end

save('classResults.mat','classResults');

% FNN=0;TTP=0;TN=0;FN=0;Acc=0;
% tempTotal=classResults(:,:,3);
% for i=1:100
%     tempD=tempTotal(i,:,3);
%     tempR=tempTotal(i,:,2);
%     
%     [~, FNN]=size(temp(temp==i));
%     [~,TP] = size(temp(temp~=i));
%     [TN,~] = size(tempTotal);
%     [~,TP1]=size(temp);
%     FN=TN-FNN;
%     Recall = TN/FN+FNN;
%     Precision = TN/FN+TP;
%     Fmeasurment =(Precision*Recall)/(Precision+Recall);
%     if Fmeasurment>Acc
%         Acc=Fmeasurment;
%     end
% end

% TP=0;FP=0;TN=0;FN=0;Acc=0;
% tempTotal=classResults(:,:,3);
% for i=1:100
%     tempD=tempTotal(i,:,3);
%     tempR=tempTotal(i,:,2);
%     
%     [~, FNN]=size(tempD(tempD==i));
%     [~,TP] = size(temp(temp~=i));
%     [TN,~] = size(tempTotal);
%     [~,TP1]=size(temp);
%     FN=TN-FNN;
%     Recall = TN/FN+FNN;
%     Precision = TN/FN+TP;
%     Fmeasurment =(Precision*Recall)/(Precision+Recall);
%     if Fmeasurment>Acc
%         Acc=Fmeasurment;
%     end
% end
% 
% Acc





