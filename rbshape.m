function img2 = rbshape(type, imsize, centercol, centerrow, radius1, angle1, radius2, angle2, radius3, angle3)
    
    %
    % CHECK INPUT PARAMETERS
    %
    if nargin < 10
        if nargin < 6
            angle1=0;
        end
        radius2=radius1;
        angle2=angle1+120;
        radius3=radius1;
        angle3=angle1+240;
    end 
    
    %
    % RESCALE FOR TRIANGLE/STAR
    %
   switch(type)
        case 'triangle'
    myscale=1.53;
radius1=radius1*myscale; 
radius2=radius2*myscale; 
radius3=radius3*myscale; 
       case 'star'
           myscale=1.38;
           radius1=radius1*myscale; 
radius2=radius2*myscale; 
radius3=radius3*myscale; 
            otherwise
    end

    %
    % IF SHAPE TOO SMALL, GENERATE LARGER IMAGE OF SHAPE THEN COMPRESS
    %
    maxradius=max([radius1,radius2,radius3]);
if maxradius < 0.3*imsize
    tmpimsize=2*round(maxradius)+2;
    colshift = round(centercol-(tmpimsize+2)/2);
    rowshift = round(centerrow-(tmpimsize+2)/2);
    tmpcentercol=centercol-colshift;
    tmpcenterrow=centerrow-rowshift;
    
    dcol1=0; dcol2=0; drow1=0; drow2=0;
    if colshift<0
        dcol1=0-colshift;
    end
    if (colshift+tmpimsize)> imsize
        dcol2=imsize-(colshift+tmpimsize);
    end
    if rowshift<0
        drow1=0-rowshift;
    end
    if (rowshift+tmpimsize)> imsize
        drow2=imsize-(rowshift+tmpimsize);
    end
else
   tmpimsize=imsize;
    colshift = 0;
    rowshift = 0;
    tmpcentercol=centercol;
    tmpcenterrow=centerrow;
    dcol1=0; dcol2=0; drow1=0; drow2=0;
end

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
newimsize=tmpimsize*upsample;
newcentercol=1+(tmpcentercol-1)*upsample;
newcenterrow=1+(tmpcenterrow-1)*upsample;
newradius1=radius1*upsample;
newradius2=radius2*upsample;
newradius3=radius3*upsample;

%
% CREATE SHAPE
%
    switch(type)
        case 'circle'
            img=rbcircle(newimsize, newcentercol, newcenterrow, newradius1);
        case 'triangle'
            img=rbtriangle(newimsize, newcentercol, newcenterrow, newradius1, angle1, newradius2, angle2, newradius3, angle3);
        case 'star'
            img=rbstar(newimsize, newcentercol, newcenterrow, newradius1, angle1);
        otherwise
            printf('shape is unknown/n');
            return
    end


%
% downsample if upsampling was used
%
if upsample >= 2
    img=downsample(img);
end

if upsample == 4
    img=downsample(img);
end

    
%
% INSERT
%
img2 = zeros(imsize,imsize);
img2(1+rowshift+drow1:rowshift+tmpimsize+drow2,1+colshift+dcol1:colshift+tmpimsize+dcol2)=img(1+drow1:tmpimsize+drow2,1+dcol1:tmpimsize+dcol2);
