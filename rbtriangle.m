function triangleimg2 = rbtriangle(imsize, centercol, centerrow, radius1, angle1, radius2, angle2, radius3, angle3)

%
% DEFAULT PARAMETERS
%
    if nargin < 9
        radius2=radius1;
        angle2=angle1+120;
        radius3=radius1;
        angle3=angle1+240;
    end 
    
%
% FOR SMALL RADII,PRODUCE PARTIAL IMAGE
%
maxradius=max([radius1,radius2,radius3]);
if maxradius < 0.3*imsize
    newimsize=2*round(maxradius)+2;
    colshift = round(centercol-(newimsize+2)/2);
    rowshift = round(centerrow-(newimsize+2)/2);
    triangleimg = rbtriangle(newimsize,centercol-colshift, centerrow-rowshift,radius1, angle1, radius2, angle2, radius3, angle3);
    triangleimg2 = zeros(imsize,imsize);
    dcol1=0; dcol2=0; drow1=0; drow2=0;
    if colshift<0
        dcol1=0-colshift;
    end
    if (colshift+newimsize)> imsize
        dcol2=imsize-(colshift+newimsize);
    end
    if rowshift<0
        drow1=0-rowshift;
    end
    if (rowshift+newimsize)> imsize
        drow2=imsize-(rowshift+newimsize);
    end
    triangleimg2(1+rowshift+drow1:rowshift+newimsize+drow2,1+colshift+dcol1:colshift+newimsize+dcol2)=triangleimg(1+drow1:newimsize+drow2,1+dcol1:newimsize+dcol2);
else

%
% upsample for small radii
%
upsample=1;
if maxradius < 20
    upsample=2;
end
if maxradius < 10
    upsample=4;
end
imsize=imsize*upsample;
centercol=1+(centercol-1)*upsample;
centerrow=1+(centerrow-1)*upsample;
radius1=radius1*upsample;
radius2=radius2*upsample;
radius3=radius3*upsample;
    
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
% MORE BLACK MAGIC
%
anglesigma=5;
    d1=randn(1,1)*anglesigma;
    d2=randn(1,1)*anglesigma;
radiussigma=0.06;
s1=(1+randn(1,1)*radiussigma);
s2=(1+randn(1,1)*radiussigma);

%
% COMPUTE CORNERS, HALFPLANES, & TRIANGLE
%
x1=radius1*sin(angle1/57.3);
y1=radius1*cos(angle1/57.3);
x2=radius2*s1*sin((angle2+d1)/57.3);
y2=radius2*s1*cos((angle2+d1)/57.3);
x3=radius3*s2*sin((angle3+d2)/57.3);
y3=radius3*s2*cos((angle3+d2)/57.3);
line12 = sign(yimg*(x2-x1)-ximg*(y2-y1)-y1*x2+x1*y2) == sign(y3*(x2-x1)-x3*(y2-y1)-y1*x2+x1*y2);
line32 = sign(yimg*(x2-x3)-ximg*(y2-y3)-y3*x2+x3*y2) == sign(y1*(x2-x3)-x1*(y2-y3)-y3*x2+x3*y2);
line13 = sign(yimg*(x3-x1)-ximg*(y3-y1)-y1*x3+x1*y3) == sign(y2*(x3-x1)-x2*(y3-y1)-y1*x3+x1*y3);
triangleimg2 = line12 & line32 & line13;

%
% downsample if upsampling was used
%
if upsample >= 2
    triangleimg2=downsample(triangleimg2);
end

if upsample == 4
    triangleimg2=downsample(triangleimg2);
end

end

end
