function[E,l,P,r,nodes,A,I,c]=ip_user_c
E=input('Enter The youngs modulus of the material:   ');
l=input('Now The length of the beam              :   ');
P=input('The density of the material             :   ');
r=input('The radius                              :   ');
nodes=input('Enter number of nodes required      :   ');
A=pi*(r^2);
d=2*r;
I=pi/64*(d^4);
disp('Which of the following condition suits the type of degree of freedom of your problem?');
disp('NOTE: O refers to constrained.');
disp('1 Refers to Free.');
disp('Enter the condition serial number:');
disp('          Sl.No       Disp@1       Disp@2       bm@1       bm@2');
c1=[1 2 3 4 5 6];
tableA(:,1)=c1';
c2=[1 1 1 0 0 0];
tableA(:,2)=c2';
c3=[1 0 0 1 0 1];
tableA(:,3)=c3';
c4=[0 1 0 1 1 0];
tableA(:,4)=c4';
c5=[0 0 1 0 1 1];
tableA(:,5)=c5';
disp(tableA);
c=input('Enter Your Choice: ');