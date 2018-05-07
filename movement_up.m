function movement_up(hco,eventStruct)


global state_puls x_pen y_pen timeFeature

tik = toc;
% toggle
state_puls = 0;

h_axes = findobj('Tag','AXES');



delete(findobj('Tag','TRAJECTORY2'));

% creating a dotted rectangle
x_i = min(x_pen);
x_f = max(x_pen);
x_d = max([1 (x_f - x_i)]);
y_i = min(y_pen);
y_f = max(y_pen);
y_d = max([1 (y_f - y_i)]);
plot(h_axes,[x_i x_f x_f x_i x_i],[y_i y_i y_f y_f y_i],'K:','MarkerSize',22,'Tag','TRAJECTORY2');

% Time interval and the correspond column number as two features
colz=size(x_pen);
Col=colz(1,2);
timeFeature = [timeFeature [Col;tik]];
clc