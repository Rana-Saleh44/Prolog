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
%cutoff ! it prevent the backtrack
