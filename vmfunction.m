function vv= v(d)
%this gives the speed as a function of the distance to the car ahead
global dmin dmax vmax;
if (d<dmin)
vv=0;
elseif (d<dmax)
vv= vmax*log(d/dmin)/log(dmax/dmin);
else
vv=vmax
end