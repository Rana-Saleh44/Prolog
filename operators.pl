father(ahmed, ali).
father(ali, rana).
father(ahmed, mona).

run :-
    father(X, Y),
    write(X), write(' is the father of '), write(Y), nl.
