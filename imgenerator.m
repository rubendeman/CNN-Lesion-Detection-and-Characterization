imsize=128;
background=0.0;
lesionsize=36.0;
angle1=0;
angle2=120;
angle3=240;
contrast = 100.0;
dcontrast=20;
pixelsize=200/imsize;
fignr=1;

for n=1:150
    for blurfactor=[0,2.5,10]
        if blurfactor==0
            stdfactor=50;
            cd file/location
        elseif blurfactor==2.5
            stdfactor=25;
            cd file/location
        else
            stdfactor=10;
            cd file/location
        end
        for desired_std=[1,2,3,4,5,6,7,8,9,10]*stdfactor
            for i=1:4
                name = sprintf('t_%d.raw',fignr);
                jpegname=sprintf('%d.png',fignr);
                if i<=1
                    img = background+zeros(imsize,imsize);
                else
                    switch(i)
                        case 2
                            type = 'circle';
                        case 3
                            type = 'triangle';
                        case 4
                            type = 'star';
                        otherwise
                    end
                    
                    radius1=lesionsize/2.0;
                    radius2=radius1;
                    radius3=radius2;
                    centercol=rand(1,1)*0.8 * imsize + 0.1 * imsize;
                    centerrow=rand(1,1)*0.8 * imsize + 0.1 * imsize;
                    newcontrast=contrast+rand(1,1)*dcontrast*2-dcontrast;
                    img = background+newcontrast*rbshape(type, imsize, centercol, centerrow, radius1, angle1, ...
                        radius2, angle2, radius3, angle3);
                    
                end
                
                % RESOLUTION MODEL
                %filter image with Gaussian Kernel
                blursigma=blurfactor/2.3548/pixelsize;
                img=convolgauss(img,2); %need to compute correct sigma for FWHM=1.0
                
                % NOISE
                whitenoise = rbnoise(imsize,desired_std,blursigma);
                whitenoise=whitenoise*(desired_std/std(whitenoise(:)));
                white = img+whitenoise;
                
                            switch(i)
                                case 1
                                    cd none
                                    rubenwrite(name,white)
                                    cd ..
                                case 2
                                   cd circle
                                   rubenwrite(name,white)
                                   cd ..
                                case 3
                                   cd triangle
                                   rubenwrite(name,white)
                                   cd ..
                                case 4
                                   cd star
                                   rubenwrite(name,white)
                                   cd ..
                                otherwise
                            end
                fignr=fignr+1;
            end
        end
        cd ..
    end
end
