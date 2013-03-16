function[l,b,h,A,I]=ip_user_s_5
l=input('Now The length of the beam              :   ');
b=input('The Breadth                             :   ');
h=input('The Depth                               :   ');
%nodes already entered before call of function
A=b*h;
I=b*(h^3)/12;