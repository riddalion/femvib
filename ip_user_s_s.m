function [l,b,h,A,I]=ip_user_s_s
l=input('Now The length of the beam              :   ');
b=input('The breadth                             :   ');
h=input('The height                              :   ');
A=b*h;
I=b*(h^3)/12;