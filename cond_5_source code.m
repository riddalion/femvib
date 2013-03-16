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