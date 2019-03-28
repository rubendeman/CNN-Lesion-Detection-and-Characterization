function img=gaussimg(imsize,sigma)
    
%
% CALCULATE COLIMG AND ROWIMG
%
imsize=128;
colimg=repmat(1:imsize,imsize,1);
rowimg=repmat((1:imsize)',1,imsize);

%
% CALCULATE XIMG AND YIMG
%
centercol=(imsize+1)/2;
centerrow=(imsize+1)/2;
ximg=colimg - centercol;
yimg=centerrow-rowimg;

%
% CALCULATE DISTANCE FROM CIRCLE CENTER
%
distimg = sqrt((ximg).^2+(yimg).^2);

%
% CALCULATE CIRCLE IMAGE
%
img=exp(-distimg.^2/(2*sigma^2));
