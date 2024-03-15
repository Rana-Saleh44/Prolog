
%listen([],0).
%listen([H|T],N):- listen(T,N1), N is N1+1.
% to store or accumulate the length of the list the previous in the
% general code(head recursion) without using the accumulator

listen(L,N):- lenacc(L,0,N). %N is only to store the value
lenacc([],A,A).
len([_|T],A,N):- A1 is A+1, lenacc(T,A1,N).%tail recursion

