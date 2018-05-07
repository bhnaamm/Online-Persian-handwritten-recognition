function extendedcltemp = addotherclasses(cltemp)

[h w]=size(cltemp);


for i=1:h
    x= cltemp{i,1};
    y= cltemp{i,2};
    theta= cltemp{i,4};
    
    LpcX= lpc(x,length(x)-1);
    LpcY= lpc(y,length(y)-1);
    dX= diff(x);
    dY= diff(y);
    dtheta= diff(theta);
    SinDtheta= sin(dtheta);
    CosDtheta= cos(dtheta);
    
    cltemp{i,7}= dX;
    cltemp{i,8}= dY;
    cltemp{i,9}= CosDtheta;
    cltemp{i,10}= LpcX(2:end);
    cltemp{i,11}= LpcY(2:end);
    cltemp{i,12}= dtheta;
    cltemp{i,13}= SinDtheta;
    
end
    
    
extendedcltemp=cltemp;