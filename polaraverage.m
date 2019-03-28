function y=polaraverage(img, csize, psize, step)

ximg=repmat([-csize+0.5:csize-0.5],2*csize,1);
yimg=repmat([csize-0.5:-1:-csize+0.5]',1,2*csize);

rimg=repmat([-psize:step:psize],psize*2/step+1,1);
thetaimg=repmat([0:psize*2/step]'*(pi/(psize*2/step)),1,psize*2/step+1);
[xnew,ynew]=pol2cart(thetaimg(:),rimg(:));
xnew=reshape(xnew,[psize*2/step+1,psize*2/step+1]);
ynew=reshape(ynew,[psize*2/step+1,psize*2/step+1]);

boundarymean=(mean(img(1,:))+mean(img(end,:))+mean(img(:,1))+mean(img(:,end)))/4.0;

newimg=interp2(ximg,yimg,img,xnew,ynew,'*linear',boundarymean);
size(newimg)
array=mean(newimg,1);
array=(array+fliplr(array))/2.0;
newimgav=repmat(array,psize*2/step+1,1);

[thetanew,rnew]=cart2pol(ximg(:),yimg(:));
rnew=reshape(rnew,[csize*2,csize*2]);
thetanew=reshape(thetanew,[csize*2,csize*2]);
index=find(thetanew<0);
rnew(index)=-rnew(index);
thetanew(index)=thetanew(index)+pi;

newestimg=interp2(rimg,thetaimg,newimgav,rnew,thetanew,'*linear');

y=newestimg;
