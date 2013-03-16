function [l,r,A,I]=ip_user_c_s
l=input('Now The length of the beam              :   ');
r=input('The radius                              :   ');
A=pi*(r^2);
d=2*r;
I=pi/64*(d^4);