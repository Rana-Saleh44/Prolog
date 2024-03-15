parent(X,Y):- child(Y,X).
child(A,B):- parent(B,A).
%the previous is creating deadlock and the local stack will be full
person(adam).
person(X):- person(Y),mother(X,Y).
% the previous will return true with adam but with the rest will create
% infinite loop,  in the tree it will only brach in the left hand side

%the previous these are the 2 case that mostly infinite loop occur
