function vectorclass = getvectore(classtemp)

[h w]=size(classtemp);

clstmp=[];
chain=[];
Xs=[];
Ys=[];
Thetas=[];
sins=[];
coses=[];
chains=[];
% classtemp1=zeros(1,w);
for i=1:w
    [hs ws]=size(classtemp{1,i});
    for j=1:ws
        %         =[
        %             clstmp;
%         time=classtemp{1,i}(j).chtime.times;
%         chain=classtemp{1,i}(j).chtime.chain;
        X=classtemp{1,i}(j).X;
        Y=classtemp{1,i}(j).Y;
%         Theta=classtemp{1,i}(j).theta;
%         sin=classtemp{1,i}(j).sintheta;
%         cos=classtemp{1,i}(j).costheta;
        %         classtemp{1,i}(ws).times];
    end
%     times=[times time];
    Xs=[Xs X];
    Ys=[Ys Y];
%     Thetas=[Thetas Theta];
%     sins=[sins sin];
%     coses=[coses cos];
%     chains=[chains chain];
%     vectorclass{1,i}=[clstmp,times,Xs,Ys,Thetas,sins,coses];
%     clstmp{1,i}=chains;
%     clstmp{2,i}=Xs;
%     clstmp{3,i}=Ys;
%     clstmp{4,i}=Thetas;
%     clstmp{5,i}=sins;
%     clstmp{6,i}=coses;
%     clstmp{7,i}=times;
%     
    clstmp{1,i}=Xs;
    clstmp{2,i}=Ys;
%     clstmp{3,i}=Thetas;
%     clstmp{4,i}=sins;
%     clstmp{5,i}=coses;
%     clstmp{6,i}=chains;
%     clstmp{6,i}=times;
%     clstmp=vectorclass{1,i};
    %     clstmp=classtemp1{i};
end

% vectorclass=cell2mat(clstmp);
vectorclass=clstmp';

% 31 to 34 and 23 to 25 and 19 to 20