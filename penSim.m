
% -----------penSim- pen-panel
%    Author: Behnam Anjomruz
%    Email: behnam.anjomruz@gmail.com
%       Copyright © 2014
%%
%%
%
% A Mouse-Panel as a Pen-Panel
% Can be used as a feature extractor of online handwriting
%
%
%   Features: (x,y), Break index, and time interval of a mouse pressure
%         It, also, considers the speed of writing (number of saved points in a time unit)
%   The time factor, affects in two manners: time interval and number of points subject to
%     the speed of writing.
%
%(c) PI-I><
%
%
close all;
clear all;
clc

global state_puls timeFeature X Y Meta Features

% for evaluation
% load('hmms.mat');
% load('class.mat');


Gimage = findobj('tag','PEN');
if (isempty(Gimage))
    state_puls = 0;
    
    % Creating a new figure
    Gimage = figure;
    
    hvision.version = '0.01';
    
    set(Gimage,'numbertitle','off');
    set(Gimage,'resize','off');
    set(Gimage,'name',['PENSIM (' hvision.version ')']);
    set(Gimage,'MenuBar','none');
    set(Gimage,'doublebuffer','on');
    set(Gimage,'tag','PEN');
    set(Gimage,'Color',[0.95 0.95 0.95]);
    set(Gimage,'WindowButtonMotionFcn',@movement);
    set(Gimage,'WindowButtonDownFcn',@movement_down);
    set(Gimage,'WindowButtonUpFcn',@movement_up);
    
    % Axes
    h_axes = axes('position', [0 0 1 0.85]);
    set(h_axes,'Tag','AXES');
    box(h_axes,'on');
    grid(h_axes,'on');
    axis(h_axes,[0 1 0 1]);
    axis(h_axes,'off');
    hold(h_axes,'on');
    
    % Creates the add-boxes, by entring to the area of these boxes, the
    % written word will be saved and the screen will be reset.
%     fill([0 0.1 0.1 0 0],[0 0 0.1 0.1 0],'r');
%     fill([0.9 1 1 0.9 0.9],[0 0 0.1 0.1 0],'r');
    
    
    uicontrol('Style','edit','Units','normalized','Position',...
        [0 0.85 1 0.15],'FontSize',11,'HorizontalAlignment',...
        'left','Enable','inactive','Tag','TEXT');
%     uicontrol('Style','edit','Units','normalized','Position',...
%         [0 0.85 1 0.15],'FontSize',8,'HorizontalAlignment',...
%         'right','Enable','inactive','Tag','TEXT0');
    uicontrol('Style','pushbutton','String','Save Data',...
        'Position',[460 365 90 40],'Callback',@SaveData);
    uicontrol('Style','pushbutton','String','Load Data',...
        'Position',[360 365 90 40],'Callback',@LoadData);
    
    uicontrol('Style','pushbutton','String','ADD',...
        'Position',[10 10 80 30],'Callback',@ADDpnl);
    
     uicontrol('Style','pushbutton','String','Clear',...
        'Position',[475 10 80 30],'Callback',@clearpnl);

    % -------  MENU  ------------------------------------------------------
    h_opt = uimenu('Label','&Options');
    uimenu(h_opt,'Label','Manual mode {input processed at the red area}','Enable','off');
    uimenu(h_opt,'Label','Clear / Restore','Callback',@ADDpnl);
    h_ref = uimenu(h_opt,'Label','References','separator','on');
    uimenu(h_ref,'Label','Rectangular','Callback',@references,'Tag','NORMAL','UserData','REF');
    uimenu(h_ref,'Label','Italic','Callback',@references,'Tag','ITALIC','UserData','REF');
    uimenu(h_ref,'Label','None','Callback',@references,'Tag','CAP','UserData','REF','Checked','on');
    
    uimenu(h_opt,'Label','Exit','Callback','closereq;','separator','on');
    
    h_opt2 = uimenu('Label','&About');
    uimenu(h_opt2,'Label','A Matlab GUI which can be used as a handwritten feature extractor');
    uimenu(h_opt2,'Label','Cross the mouse over the RED area to reset the panel');
    
else
    figure(Gimage);
end
