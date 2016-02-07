function [ s ]=setlights( t )
global tgreen tred nblocks; %how many lights are setting
tcycle=tgreen+tred
twc=mod(t,tcycle)%tells you the remainder
if twc<tgreen
s=ones(1,nblocks)
else
s=zeros(1,nblocks)
end