function movement_down(hco,eventStruct)

global state_puls x_pen y_pen


state_puls = 1;


h_axes = findobj('Tag','AXES');
p = get(h_axes,'CurrentPoint');

tic
x = p(1,1);
y = p(1,2);

% Data*********************************************************************
x_pen = [x_pen x];
y_pen = [y_pen y];

% Plot the DOTs
plot(h_axes,x,y,'b.','Tag','TRAJECTORY');
