function movement(hco,eventStruct)

global state_puls x_pen y_pen timeFeature X Y Meta

h_axes = findobj('Tag','AXES');

p = get(h_axes,'CurrentPoint');
x = p(1,1);
y = p(1,2);

if state_puls
    % Puls
    
    if ((y < 0) || (y > 1) || (x < 0) || (x > 1))
        %nothing
        return;
    end
    
    if ((x ~= x_pen(end)) || (y ~= y_pen(end)))
        % next point
        x_pen = [x_pen x];
        y_pen = [y_pen y];
        %         tiks = [tiks tik];
        plot(h_axes,[x_pen(end-1) x],[y_pen(end-1) y],'b.-','Tag','TRAJECTORY');
    end
    
% else
%     
%     if ((x < 0.1) && (y < 0.1)) || ((x > 0.9) && (y < 0.1))
%         % RED zone
%         %         Stemp=size(x_pen);
%         %         chk=Stemp(1,2)
%         %         if ((x_pen(chk)==-1)||~ismember(-1,x_pen))
%         if (~isempty(x_pen))
%             % Process
%             
%            
%            
%             
%             % erase
% %             delete(findobj('Tag','TRAJECTORY'));
% %             delete(findobj('Tag','TRAJECTORY2'));
%             
%             % separate features of each word
% %             x_pen = [];
% %             y_pen = [];
% %             timeFeature = [];
% %             putvar(X,Y,Meta)
% %             assignin('base', 'X', X);
% %             assignin('base', 'Y', Y);
% %             assignin('base', 'Meta', Meta);
%             
%         end
%     end
end
