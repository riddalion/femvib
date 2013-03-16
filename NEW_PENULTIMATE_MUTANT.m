syms L
k = [12 6*L -12 6*L; 6*L 4*L^2 -6*L 2*L^2; -12 -6*L 12 -6 *L; 6*L 2*L^2 -6*L 4*L^2];
m = [156 22*L 54 -13*L;22*L 4*L^2 13*L -3*L^2; 54 13*L 156 -22*L;-13*L -3*L^2 -22*L 4*L^2];
elements = 3;
%assemble stiffness matrix
K = k;
add_row = zeros(2,length(K));
K = [K; add_row];
add_col = zeros(length(K),2);
K = [K add_col];
add_loc = 2; %keep it one less than the actual loc
assm_time = elements-1;
for loop = 1:assm_time
    for row = 1:length(k)
        for col = 1:length(k)
            K(row+add_loc,col+add_loc) = K(row+add_loc,col+add_loc) + k(row,col)
        end
    end
    add_loc = add_loc+2;
    add_row = zeros(2,length(K));
K = [K; add_row]
add_col = zeros(length(K),2);
K = [K add_col]
end
picker =(length(K)-2)
K = K(1:picker,1:picker)
%for mass matrix now
M = m;
add_row = zeros(2,length(M));
M = [M; add_row];
add_col = zeros(length(M),2);
M = [M add_col];
add_loc = 2; %Meep it one less than the actual loc
assm_time = elements-1;
for loop = 1:assm_time
    for row = 1:length(k)
        for col = 1:length(k)
            M(row+add_loc,col+add_loc) = M(row+add_loc,col+add_loc) + m(row,col);
        end
    end
    add_loc = add_loc+2;
    add_row = zeros(2,length(M));
M = [M; add_row];
add_col = zeros(length(M),2);
M = [M add_col];
end
picker =(length(M)-2);
M = M(1:picker,1:picker);
%begin elimination after this;