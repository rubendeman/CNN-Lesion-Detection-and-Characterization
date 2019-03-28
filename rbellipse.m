function ellipseimg = rbellipse(imsize, centercol, centerrow, radius)

%
% CALCULATE COLIMG AND ROWIMG
%
colimg=repmat(1:imsize,[imsize,1]);
rowimg=repmat((1:imsize)',[1,imsize]);

%
% CALCULATE XIMG AND YIMG
%
ximg=colimg - centercol;
yimg=centerrow-rowimg;

%
% CALCULATE XIMG AND YIMG
%
s1=2;

%
% CALCULATE DISTANCE FROM CIRCLE CENTER
%
distimg = sqrt((ximg).^2+(yimg*s1).^2);

%
% CALCULATE CIRCLE IMAGE
%
ellipseimg = (distimg <= radius);