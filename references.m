function references(hco,eventStruct)


set(findobj('UserData','REF'),'Checked','off');
set(findobj('Tag',get(hco,'Tag')),'Checked','on');

% delete previous grid style
delete(findobj('Tag','REFERENCE'));

%finding the axes abject
h_axes = findobj('Tag','AXES');

switch get(hco,'Tag')
    case {'NORMAL'}
        for i = 0:0.1:1
            % horitzontal
            plot(h_axes,[0 1],[i i],'k:','Color',[0.5 0.5 0.5],'Tag','REFERENCE');
            
            % vertical
            plot(h_axes,[i i],[0 1],'k:','Color',[0.5 0.5 0.5],'Tag','REFERENCE');
        end
        
    case {'ITALIC'}
        for i = 0:0.1:1
            % horitzontal
            plot(h_axes,[0 1],[i i],'k:','Color',[0.5 0.5 0.5],'Tag','REFERENCE');
            
            % vertical
            plot(h_axes,[i i+0.1],[0 1],'k:','Color',[0.5 0.5 0.5],'Tag','REFERENCE');
        end
end
