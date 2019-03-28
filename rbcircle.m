function circleimg = rbcircle(imsize, centercol, centerrow, radius)

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
radiussigma=0.06;
s1=(1+randn(1,1)*radiussigma);
s2=(1+randn(1,1)*radiussigma);

%
% CALCULATE DISTANCE FROM CIRCLE CENTER
%
distimg = sqrt((ximg*s1).^2+(yimg*s2).^2);

%
% CALCULATE CIRCLE IMAGE
%
circleimg = (distimg <= radius);
