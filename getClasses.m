function cls=getClasses(num)

numberOfClasses=100;

if (num>numberOfClasses)
    print('num must be smaller than number of Classes');
    return;
end

dData = dir('DATA\*.mat');
dIdx = [dData.isdir];
fList = {dData(~dIdx).name}';

% lnth=length(fList);
lnth=20;
data=cell(lnth,1);
for i=1:lnth
    data{i}=load(strcat('DATA\',fList{i}));
end

% cl=cell(lnth,1);
% cls=repmat(cl,lnth);
% cl=struct;
for i=1:lnth
    tempx=data{i,1}.Features{num,1}(1,:);
    tempy=data{i,1}.Features{num,1}(2,:);
    
    temp=[tempy;tempx]';
    [h z]=size(temp);
    
    times=data{i,1}.Features{num,2};
    [ht zt]=size(times);
    
    idx=1;
    for j=1:zt
        [c]=chaincode(temp(idx:int16(times(1,j)),:),'true');
        chain=c.code+1;
        cl(j).chain=chain';
        cl(j).times=times(2,j); 
        idx=times(1,j);
    end
    
    [~,Sx]=size(tempx);
    thta=zeros(Sx-1,1);
    ji=1;
    
    while(ji<Sx)
        dy=tempy(ji+1)-tempy(ji);
        dx=tempx(ji+1)-tempx(ji);
        thta(ji,1)=atan2(dy,dx);
         ji=ji+1;
end
%     
%     thta=thta';
    cls{i}.X = normalise(tempx);
    cls{i}.Y = normalise(tempy);
%     cls{i}.theta = thta;
%     cls{i}.sintheta = sin(thta);
%     cls{i}.costheta = cos(thta);
%     cls{i}.chtime = cl;
%     cls{i}.chain=cl.chain;
end

% 57 to 60 have been commented

