function y=im2polar(img, psize, step)

csize=size(img,2)/2;

rimg=repmat([-psize:step:psize],psize*2/step+1,1);
thetaimg=repmat([0:psize*2/step]'*(pi/(psize*2/step)),1,psize*2/step+1);
[xnew,ynew]=pol2cart(thetaimg(:),rimg(:));
xnew=reshape(xnew,[psize*2/step+1,psize*2/step+1]);
ynew=reshape(ynew,[psize*2/step+1,psize*2/step+1]);

boundarymean=(mean(img(1,:))+mean(img(end,:))+mean(img(:,1))+mean(img(:,end)))/4.0;

%ximg=repmat([-csize+0.5:csize-0.5],2*csize,1);
%yimg=repmat([csize-0.5:-1:-csize+0.5]',1,2*csize);
ximg=[-csize+0.5:csize-0.5];
yimg=[csize-0.5:-1:-csize+0.5]';

newimg=myinterp2(ximg,yimg,img,xnew,ynew,'linear',boundarymean);

y=newimg;