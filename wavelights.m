function s=setlights(t)
global tgreen tred vwave;
global nblocks L;
tcycle=tgreen+tred
for b=1:nblocks
twc=mod(t-b*L/vwave, tcycle)
if (twc<tgreen)
s(b)=1
else
s(b)=0
end
end 