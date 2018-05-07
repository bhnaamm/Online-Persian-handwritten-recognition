clear all
clc
close all
load 'classResults.mat';


TN=0;FN=0;Acc=0;TP=0;
FP=0; tempTotal=classResults;
[w,h, ~]=size(tempTotal);

% mat1=tempTotal(tempTotal(:,:,1)==tempTotal(:,:,2));
% mat2=tempTotal(tempTotal(:,:,1)~=tempTotal(:,:,2));
% [TP, ~]=size(mat1);
% [FP, ~]=size(mat2);
% FP=w*h-TP;



for i=1:100
    tempR=tempTotal(i,:,1);
    tempD=tempTotal(i,:,2);
    for j=1:5
        if (tempR(j)==i && tempD(j)==i)
            TP=TP+1;
        end
        if (tempR(j)~=i && tempD(j)~=i)
            FP=FP+1;
        end
        
        if (tempR(j)~=i && tempD(j)==i)
            TN=TN+1;
        end
        if (tempR(j)==i && tempD(j)~=i)
            FN=FN+1;
        end
    end
%     Recall = TP/(FN+TP);
%     Precision = TP/(TP+FP);
%     Fmeasurment =Precision*Recall/(Precision+Recall);
    Fmeasurment=(TP+TN)/(TP+FP+TN+FN);
    if Fmeasurment>Acc
        Acc=Fmeasurment;
    end
end

Acc*100
