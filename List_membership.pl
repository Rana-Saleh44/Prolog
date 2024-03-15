success(rana,saleh).
% there could be list of list [[1,2],3,4]
% the list [H|T] the head in the previous example is [1,2] and the rest
% is the tail ,whatever in the first position is the head
% [X,Y,Z]=[john,likes,mary].
% [[the,Y]|Z]=[[X,mine],[is,here]].
% |  is the separator
% to find if given element is present in list or not aka list membership

member(X,[X|_]).
member(X,[_|T]):- member(X,T).
% member(3,[1,2,3,4]).
