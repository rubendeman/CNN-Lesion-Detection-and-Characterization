function starimg = rbstar(imsize, centercol, centerrow, radius, startangle)

anglesigma=5;
    d1=randn(1,1)*anglesigma;
    d2=randn(1,1)*anglesigma;
    d3=randn(1,1)*anglesigma;
    d4=randn(1,1)*anglesigma;
    d5=randn(1,1)*anglesigma;
radiussigma=0.06;
s1=(1+randn(1,1)*radiussigma);
s2=(1+randn(1,1)*radiussigma);
s3=(1+randn(1,1)*radiussigma);
s4=(1+randn(1,1)*radiussigma);
s5=(1+randn(1,1)*radiussigma);
    
    starimg=rbtriangle(imsize, centercol, centerrow, radius, startangle, radius/2, startangle+90, radius/2, startangle+270);
    starimg=max(starimg, rbtriangle(imsize, centercol, centerrow, s1*radius, startangle+60+d1, radius/2, startangle+150+d1, radius/2, startangle+330+d1));
    starimg=max(starimg, rbtriangle(imsize, centercol, centerrow, s2*radius, startangle+120+d2, radius/2, startangle+210+d2, radius/2, startangle+30+d2));
    starimg=max(starimg, rbtriangle(imsize, centercol, centerrow, s3*radius, startangle+180+d3, radius/2, startangle+270+d3, radius/2, startangle+90+d3));
    starimg=max(starimg, rbtriangle(imsize, centercol, centerrow, s4*radius, startangle+240+d4, radius/2, startangle+330+d4, radius/2, startangle+150+d4));
    starimg=max(starimg, rbtriangle(imsize, centercol, centerrow, s5*radius, startangle+300+d5, radius/2, startangle+30+d5, radius/2, startangle+210+d5));