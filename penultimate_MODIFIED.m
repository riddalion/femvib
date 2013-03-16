%solving matrix for vibration problem by symbolic variables and then
%accepting values from the user. this is a full fledged program and accepts
%user inputs to select the type of beam, type of cross section and number
%of nodes
clear all;
clc;
syms x
p=1;
%declaring the stiffness matrix for user info but not in the command prompt
%k = (E*I/(L^3))*[12 6*L -12*L 6*L;6*L 4*L*L -6*L 2*L*L;-12 -6*L 12 -6*L;6*L 2*L*L -6*L 4*L*L];
%m = (P*A*L)*[156 22*L 54 -13*L;22*L 4*L^2 13*L -3*L^2;54 13*L 156 -22*L;-13*L -3*L^2 -22*L 4*L^2];
format short;
disp('Please Enter the parameters with Caution');
disp('The program offers you solution for following cross section. \n Hit serial number to select');
disp('The type of area is :')
disp('1. Type "1" for constant circular cross section');
disp('2. Type "2" for constant rectangular cross section');
disp('NOTE: If you select stepped type of problem and prefer to have nodes in pos other than variation of c/s, Please select Type 5');
disp('3. Type "3" for stepped circular cross section ');
disp('4. Type "4" for stepped rectangular cross section');
disp('5. Type "5" for combination of above');
disp('For Example: circular-rectangular-circular etcetera');
t_area=input('Your Choice: ');
if(t_area==1)
    [E,l,P,r,nodes,A,I,c]=ip_user_c;
    L=l/(nodes-1);
    [k,m] = matdecide(c,E,P,A,L,I);
    disp(k)         %displays the status of k after deletion of rows and columns
    disp(m)         %displays the status of m after deletion of rows and columns
    format bank;    %this condition formats the output. *long eng* is preffered however if the program is run
    clc;
    [K,M]=assem_n(nodes,k,m);
    disper(K,M,x);
elseif(t_area==2)
    [E,l,P,b,h,nodes,A,I,c]=ip_user_s;
    L=l/(nodes-1);
    [k,m] = matdecide(c,E,P,A,L,I);
    disp(k)         %displays the status of k after deletion of rows and columns
    disp(m)         %displays the status of m after deletion of rows and columns
    format bank;    %this condition formats the output. *long eng* is preffered however if the program is run
    clc;
    [K,M]=assem_n(nodes,k,m);
    disper(K,M,x);
elseif(t_area==3);
    A=1;I=1;L=1; %defining  as unity to avoid confusion. this value is calculated in loop properly
    nodes=input('Enter number of nodes required      :   ');
    E=input('Enter The youngs modulus of the material:   ');
    P=input('The density of the material             :   ');
    disp('Enter the parameters for each element.' );
    K=zeros(nodes);
    M=zeros(nodes);
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
    for p=1:(nodes-1)
        [L,r,A,I]=ip_user_c_s;
        [k,m] = matdecide(c,E,P,A,L,I);
        disp(k)         %displays the status of k after deletion of rows and columns
        disp(m)         %displays the status of m after deletion of rows and columns
        format bank;    %this condition formats the output. *long eng* is preffered however if the program is run
        %matrix assembly or pick and place begins here. the following code
        %adds new elements to the existing ones. note that p and q are
        %already initialised to first row first column.
        K(p,p)    = K(p,p)    +k(1,1);
        disp(K);
        K(p+1,p)  = K(p+1,p)  +k(1+1,1);
        disp(K);
        K(p,p+1)  = K(p,p+1)  +k(1,1+1);
        disp(K);
        K(p+1,p+1)= K(p+1,p+1)+k(1+1,1+1);
        disp(K);
        M(p,p)    = M(p,p)    +m(1,1);
        disp(M);
        M(p+1,p)  = M(p+1,p)  +m(1+1,1);
        disp(M);
        M(p,p+1)  = M(p,p+1)  +m(1,1+1);
        disp(M);
        M(p+1,p+1)= M(p+1,p+1)+m(1+1,1+1);
        disp(M);
    end
    disper(K,M,x);
elseif(t_area==4)
    nodes=input('Enter number of nodes required      :   ');
    E=input('Enter The youngs modulus of the material:   ');
    P=input('The density of the material             :   ');
    disp('Enter the parameters for each element.' );
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
    K=zeros(nodes);
    M=zeros(nodes);
    A=1;I=1;L=1;  %defining A as unity
    [k,m] = matdecide(c,E,P,A,L,I);
    for p=1:(nodes-1)
        [L,b,h,A,I]=ip_user_s_s;
        [k,m] = matdecide(c,E,P,A,L,I);
        disp(k)         %displays the status of k after deletion of rows and columns
        disp(m)         %displays the status of m after deletion of rows and columns
        format bank;    %this condition formats the output. *long eng* is preffered however if the program is run
        clc;
        K(p,p)    = K(p,p)    +k(1,1);
        disp(K);
        K(p+1,p)  = K(p+1,p)  +k(1+1,1);
        disp(K);
        K(p,p+1)  = K(p,p+1)  +k(1,1+1);
        disp(K);
        K(p+1,p+1)= K(p+1,p+1)+k(1+1,1+1);
        disp(K);
        M(p,p)    = M(p,p)    +m(1,1);
        disp(M);
        M(p+1,p)  = M(p+1,p)  +m(1+1,1);
        disp(M);
        M(p,p+1)  = M(p,p+1)  +m(1,1+1);
        disp(M);
        M(p+1,p+1)= M(p+1,p+1)+m(1+1,1+1);
        disp(M);
    end
    disper(K,M,x);
elseif(t_area==5)
%source code to find natural frequencies with unequal distribution of node
%input length and area of cross section first and select number of elements
%in that particular length
syms x;
disp('Enter the properties of the beam. ');
E=input('Youngs Modulus(For the entire beam): ');
P=input('Density (For the entire beam)      : ');
%Selection of matrix based on the type of beam problem
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
K=zeros();
M=zeros();
% [k,m] = matdecide(c,E,P,A,L,I);
% fprintf('The stiffness matrix selected based on your input: \n %f',k);
% fprintf('The consistent mass matrix selected based on your input: \n %f',m);
disp('The following representation is what the node distribution offered to you in this section');
disp('consider a beam ||==========================|| like this, you will be asked to enter');
disp('a certain length and then asked to give number of elements in that length. ');
disp('The beam will look something like this, taking asterisks as the ending of an element. ');
disp('\t \t \t ||=*=*==*==*========*||');
disp('INSTRUCTION: Keep entering "y"(refers to Yes) to continue entering length of beam. ');
disp('Any other character would automatically terminate the input process and proceed to assembly of');
wish=input('matrices and producing of results. Now press "y" to begin.','s');
while wish=='y'
    L=input('Enter Length: ');
    disp('Enter "1" for rectangular cross section \n "2" for circular cross section. ');
    cs=input('Enter type of beam cross section: ');
    if cs == 1 
        b=input('Enter breadth : ');
        h=input('Enter Depth   : ');
        I=b*h^3/12;
        A=b*h;
    elseif cs==2
        r=input('Enter radius : ');
        A=pi*r^2;
        I=pi*(2*r)^4/64;
    end
    elements=input('Enter number of elements in the entered length: ');
    nodes=elements+1;
[k,m] = matdecide(c,E,P,A,L,I);
[K,M]=assem_cond_5(nodes,k,m,K,M);
wish=input('wish to continue entering length? "y" or "n"','s');
end
if wish=='n'
disp('The Stiffness matrix calculated according to the given input.');
disp(K);
disp('The Mass matrix calculated according to the given input.');
disp(M);
disp('The Eigeen value matrix calculated according to the given input.');
disp(K-x*M);
disp('The Determinant of the Eigen Value matrix.');
disp(det(K-x*M));
disp('The roots of the equation obtained by the determinant.');
ans_c=(solve(det(K-x*M)));
disp(ans_c);
disp('The natural frequency is the square root of solution of Eigen equation: ');
sq_ans_c=sqrt(ans_c);
disp(sq_ans_c);
disp('Thank You for using this program');
end
end