
%x(c)=position of car c
%c=1,2,...
% s(b)=1 green light, 0 red light
clear all
clf
global dmin dmax vmax;
global L;
L = 0.05
dmin = 0.01*L
dmax = 0.1*L
vmax = 50
global tgreen tred vwave;
tgreen = 0.001
tred = 0.001
vwave = 30
global nblocks;
nblocks = 10
global dt;
ncarsmax = 500
R = 100
lastcar = zeros(1,nblocks);
firstcar = ones(1,nblocks);
tmax = 1
dt = 0.0000075
% vmax*dt < dmin << L
% R*dt << 1
% dmax < L
clockmax = ceil(tmax/dt)
%setup for movie
figure(1)
set(gcf,'double','on')
x=zeros(1,ncarsmax)
y=zeros(1,ncarsmax)
s=setlights(0)
hcars=plot(x,y,'b*')
axis([-L,(nblocks+1)*L,-L,L])
axis manual
hold on
for i=1:nblocks
if s(i)==1
hlight(i)=plot(i*L,0,'go')
else
hlight(i)=plot(i*L,0,'ro')
end
end
drawnow
count = 0
count_exit=0
for clock=1:clockmax
t=clock*dt;
s=setlights(t);
%count # of car waiting at x=0
if (lastcar(1)<firstcar(1))
ncw(clock)=0;
else
ncw(clock)=sum(x(1:lastcar(1))==0)
end
%entry of cars
if (rand<R*dt)
lastcar(1)=lastcar(1)+1;
tenter(lastcar(1))=t;
count=count+1;
end
%move cars by blocks
for b=nblocks:(-1):1
if (firstcar(b)<=lastcar(b)) %blocks is not empty
c=firstcar(b);
if (s(b)==1) %green light
if (c==1)|(b==nblocks) %no car ahead
d=dmax;
else
d=x(c-1)-x(c); %is car ahead
end
else %red light
d=b*L-x(c);
end
x(c)=x(c)+dt*v(d); %move first car on the block
%update data structure if necessary
if (x(c)>b*L)
firstcar(b)=firstcar(b)+1
if (b<nblocks)
lastcar(b+1)=c;
else
texit(c)=t; %note exit
count_exit=count_exit +1
end
end
%other cars on blocks
c=c+1;
while (c<=lastcar(b))
x(c)=x(c)+dt*v(x(c-1)-x(c));
c=c+1;
end
end %if block is not empty
%movie each time step
set (hcars, 'xdata', x)
for i=1:nblocks
if (s(i))==1
set (hlight(i),'color','g')
else
set (hlight(i),'color','r')
end
end
drawnow
end %loop over blocks
end %loop over time steps
traveltime = sum(texit(1:count_exit) - tenter(1:count_exit))/count_exit
figure(2)
plot(1:count_exit,tenter(1:count_exit),1:count_exit,texit(1:count_exit))