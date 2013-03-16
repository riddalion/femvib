function [ans_c, sq_ans_c]=disper(K,M,x)
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