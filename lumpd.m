function[K,M]=lumpd(P,A,L,k)
m=P*A*L;
nodes=input('Enter the number of nodes for lumped evaluation');
m_lumped=m/(2);
m_matrix=eye(nodes);
m_matrix_lumped=m_lumped*m_matrix;
K=zeros(nodes);
M=zeros(nodes);
p=1;
for p=1:(nodes-1)
    K(p,p)    = K(p,p)    +k(1,1);
    disp(K);
    K(p+1,p)  = K(p+1,p)  +k(1+1,1);
    disp(K);
    K(p,p+1)  = K(p,p+1)  +k(1,1+1);
    disp(K);
    K(p+1,p+1)= K(p+1,p+1)+k(1+1,1+1);
    disp(K);
end
for p=1:(nodes-1)
    M(p,p)=M(p,p)+m_matrix_lumped(1,1);
    disp(M);
    M(p+1,p+1)= M(p+1,p+1)+m_matrix_lumped(1+1,1+1);
    disp(M);
end