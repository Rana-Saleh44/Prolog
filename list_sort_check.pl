is_sorted([]).
is_sorted([_]). %I have only one element in the list
is_sorted([X,Y|T]):- X=<Y, is_sorted([Y|T]).
