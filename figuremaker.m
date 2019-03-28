type = 'circle';
imsize=128; 
background=0;
desired_std=100; % 100 (RANGE)
blurfactor=0; %RANGE RANGE RANGE
centercol=rand(1,1)*0.8 * imsize + 0.1 * imsize;
centerrow=rand(1,1)*0.8 * imsize + 0.1 * imsize;
radius1=18;
radius2=18;
radius3=18;
angle1=0;
angle2=120;
angle3=240;
contrast=250;
pixelsize=200/imsize;

img = background+contrast*rbshape(type, imsize, centercol, centerrow, radius1, angle1, ...
                    radius2, angle2, radius3, angle3);

blursigma=blurfactor/2.3548/pixelsize;
            img=convolgauss(img,blursigma); %need to compute correct sigma for FWHM=1.0
            whitenoise = rbnoise(imsize,desired_std,blursigma);
            whitenoise=whitenoise*(desired_std/std(whitenoise(:)));
            white = img+whitenoise;

imshow(white,[])