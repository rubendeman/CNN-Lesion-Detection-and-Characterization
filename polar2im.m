function y=polar2im(polar, csize, step)

psize=(size(polar,2)-1)*step/2;

ximg=repmat([-csize+0.5:csize-0.5],2*csize,1);
yimg=repmat([csize-0.5:-1:-csize+0.5]',1,2*csize);

[thetanew,rnew]=cart2pol(ximg(:),yimg(:));
rnew=reshape(rnew,[csize*2,csize*2]);
thetanew=reshape(thetanew,[csize*2,csize*2]);
index=find(thetanew<0);
rnew(index)=-rnew(index);
thetanew(index)=thetanew(index)+pi;

rimg=repmat([-psize:step:psize],psize*2/step+1,1);
thetaimg=repmat([0:psize*2/step]'*(pi/(psize*2/step)),1,psize*2/step+1);

newimg=interp2(rimg,thetaimg,polar,rnew,thetanew,'linear');

y=newimg;