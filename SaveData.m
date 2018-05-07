function SaveData(hco,eventStruct)


global Features 

if isempty(Features)
    return;
end

[num e]=size(Features);

[fname, pname] = uiputfile('*.mat','Save Features As');
filename = fullfile(pname, fname);
if (fname==0)
    return;
else
    save(filename, 'Features')
    % uisave({'Features'},'feature');
    % evalin('base', 'save({''X'',''Y'',''Meta''}'',''features.mat'')');
    % structDATA = struct('X',.X,'Y',base.Y,'Meta',base.Meta);
    % uisave ('features', 'structDATA');
    % evalin('base','save(''feat1.mat'')');
    % uisave({'X','Y','Meta'},'features');
    set(findobj('Tag','TEXT'),'String',[' ' num2str(num) ' featur(s) have been saved successfully']);
end
end