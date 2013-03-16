function[K,M]=assem_n(nodes,k,m)
K=zeros(nodes); %preallocating the arrays K and M to increase speed and
M=zeros(nodes); %performance
for p=1:(nodes-1)
    K(p,p)    = K(p,p)    +k(1,1);
    disp(K);
    K(p+1,p)  = K(p+1,p)  +k(2,1);
    disp(K);
    K(p,p+1)  = K(p,p+1)  +k(1,2);
    disp(K);
    K(p+1,p+1)= K(p+1,p+1)+k(2,2);
    disp(K);
    M(p,p)    = M(p,p)    +m(1,1);
    disp(M);
    M(p+1,p)  = M(p+1,p)  +m(2,1);
    disp(M);
    M(p,p+1)  = M(p,p+1)  +m(1,1+1);
    disp(M);
    M(p+1,p+1)= M(p+1,p+1)+m(1+1,1+1);
    disp(M);
end