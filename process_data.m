% -----------Processing data using HMM
%    Author: Behnam Anjomruz
%    Email: behnam.anjomruz@gmail.com
%       Copyright © 2014

function process_data()
% global timeFeature
persistent num_blocks  num
global Features loadstat




% if ~isempty(loadstat)
%         
% end
% num_blocks = num;

if isempty(num_blocks)
        num_blocks = 1;
else
    num_blocks = num_blocks + 1;
end

if loadstat==1
    [num e]=size(Features);
    loadstat=0;
end

% HMM Code starts here
if num>1    
    set(findobj('Tag','TEXT'),'String',[' ' num2str(num-1),' word(s) & ' num2str(num_blocks) ' word(s) received']);
else
    set(findobj('Tag','TEXT'),'String',[' ' num2str(num_blocks) ' word(s) received']);
end
% YX=[Y;X];
% temp=YX';
% [c]=chaincode(temp,'true');
% chain=c.code+1;
% chain=chain';




% return X,Y,Meta;

