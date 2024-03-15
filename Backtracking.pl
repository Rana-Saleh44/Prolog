% in prolog the ; is different because it trigger the solution not like the other programming language once it find the solution it will stop
possible_pair(X,Y):- boy(X),girl(Y).
%tree like structure 1st the left part will be traversed
boy(john).
boy(harry).
girl(alisa).
girl(maya).

is_integer(0).% this is the stopping cond.
is_integer(X):- is_integer(Y), X is Y+1.
