append([],L2,L2). % by appending an empty list with L2 that will result L2
append([H|T],L2,[H|L3]):- append(T,L2,L3). % by appending a non-empty list with L2 that will result the head of the 1st lisit and the tail of 1st list with the 2nd list "format of the list [H|T]"
