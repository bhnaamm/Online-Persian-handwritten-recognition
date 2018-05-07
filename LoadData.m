function LoadData(hco,eventStruct)
global Features loadstat

loadstat=0;
% if isempty(Features)

[fname, pname] = uigetfile('*.mat','Select Features');
filename = fullfile(pname, fname);
if (fname==0)
    return;
else
    load(filename)
    [num e]=size(Features);
    % uisave({'Features'},'feature');
    % evalin('base', 'save({''X'',''Y'',''Meta''}'',''features.mat'')');
    % structDATA = struct('X',.X,'Y',base.Y,'Meta',base.Meta);
    % uisave ('features', 'structDATA');
    % evalin('base','save(''feat1.mat'')');
    % uisave({'X','Y','Meta'},'features');
    set(findobj('Tag','TEXT'),'String',[' ' num2str(num) ,' word(s) loaded']);
    loadstat=1;
end

end

