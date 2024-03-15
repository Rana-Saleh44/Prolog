father(ahmed,ali).
father(ali,rana).
father(ahmed,amr).
run:-father(X,Y),write(X," is the father of ",Y),ln,fail.
%the operator are fail, not, cutoff
%fail is for backtracking
%it should print:
%ahmed is the father of ali
%ali is the father of rana
%ahmed is the father of amr
%no
%if I want to print yes not no
%run.    !! again
%not is for the opposite of the answer
%ex: test.
%not(test)
% cutoff ! it prevent the backtrack in the previous if the both
% conditions was true
% cond:-!------,------
% it will backtrack but if there was a cond. after it, it won't preform
% X\=Y "not equal"to make sure that each person will not play with
% himself if this case it will make the x fixed and will backtrack in y
% what will happen if I added a cutoff:
% play(X,Y):-age(X,Z),age(Y,Z),X\=Y,!. one sol {and can't complete the
% lines after it}
% play(X,Y):-age(X,Z),!,age(Y,Z),X\=Y. 2 sol with ahmed
% play(X,Y):-age(X,Z),age(Y,Z),!,X\=Y. no sol
% play(X,Y):-!,age(X,Z),age(Y,Z),X\=Y. all solutions

age(ahmed,10).
age(ali,9).
age(ibrahim,10).
age(rana,10).
age(kamel,9).
play(X,Y):-age(X,Z),age(Y,Z),X\=Y.

a(1).
b(1).
b(2).
c(2).
d(2).
e(2).
f(3).
p(X):-a(X).
p(X):-b(X),c(X),d(X),e(X).
p(X):-f(X).

max(X,Y,Z):-X>=Y,!,Z=X.
max(_,Y,Z):-Z=Y.

