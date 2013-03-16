function[l,r,A,I]=ip_user_c_5
l=input('Now The length of the beam              :   ');
r=input('The radius                              :   ');
%entering nodes is not required here already defined before the call of
%this function
A=pi*(r^2);
d=2*r;
I=pi/64*(d^4);