% -----------Add Panel Function
%    Author: Behnam Anjomruz
%    Email: behnam.anjomruz@gmail.com
%       Copyright © 2014
%       

function ADDpnl(hco,eventStruct)

global x_pen y_pen timeFeature X Y Meta Features


% delete previous picture
delete(findobj('Tag','TRAJECTORY'));
delete(findobj('Tag','TRAJECTORY2'));

% [numb e] = size(Features);

% X = [x_pen -1];
% Y = [y_pen -1];
% Meta = [timeFeature [-1;-1]];
% if(numb==0)
if isempty(x_pen)
    if isempty(y_pen)
        return;
    end
end

XY=[x_pen; y_pen];
Meta={XY,timeFeature};
Features = [Features; Meta]; 

process_data();
x_pen = [];
y_pen = [];
timeFeature = [];



himatge = findobj('tag','PEN');

set(himatge,'WindowButtonMotionFcn',@movement);
set(himatge,'WindowButtonDownFcn',@movement_down);
set(himatge,'WindowButtonUpFcn',@movement_up);
