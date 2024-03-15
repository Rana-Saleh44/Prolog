size([],0).
size([_|T],N):- size(T,N1), N is N1+1.
%this is a recursive call so the stack will be made
% singleton variable means that the variable is used once in the entire
% program
