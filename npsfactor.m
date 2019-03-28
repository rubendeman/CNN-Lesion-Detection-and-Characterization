xx=1:801;
factor=exp(-((xx-801).^2/(40000)));
factor=[factor,fliplr(factor(1:800))];
