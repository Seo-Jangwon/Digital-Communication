%filename:ZFE_design.m
function [w,Delay]=ZFE_design(h,w_length);

%delay decision
max_index=find(abs(h)==max(abs(h)));
Delay=max_index-1;

%toeplitz matrix construction
C=transpose([h zeros(1,length(h)-1)]);
R=[h(1) zeros(1,w_length-1)];
H=toeplitz(C,R);
HH=H(Delay+1:Delay+w_length,:);
z=zeros(1,w_length)';
z(Delay+1)=1;
w=inv(HH)*z;