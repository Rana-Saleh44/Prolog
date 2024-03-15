sumlist([],0).
sumlist([H|T],N):- sumlist(T,N1),N is N1+H.
