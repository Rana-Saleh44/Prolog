apples_are_fruits.
fruit(apples).
%fruits_include_apples.
%fruit(grapes).
%● In the third example, we entered a statement that has the same meaning
%as the first two statements. However, unlike humans, Prolog doesn’t
% understand this, and it doesn't recognize or find this goal in (or
% infer it from) the knowledge base. That is why it shows an error
% message. ● In the last example, Prolog recognizes that "fruit()"
% exists in the knowledge base, however it is only true when its
% argument is "apples" (otherwise it will be false). That is why Prolog
% prints "false" not an error in this example.
%* We will use a very popular logic programming language called Prolog
% that has its roots in first-order logic (FOL).
%* Variables can be used
% in facts and rules to make them generic, and they can be used in
% queries to manipulate Prolog into returning actual answers/values
% instead of just "true" and "false" * Anonymous variables: When a
% variable appears in a clause only once, we don't have to give it a
% name, we can just use underscore instead. Each time an underscore
% occurs in a clause it represents a new anonymous variable. * in
% structures The number of components (arguments) in the predicate is
% called the arity. thing(X). % A predicate called “thing” that is true
% for any argument as it is defined with a variable in the KB.
fruit(apples).
fruit(apples, grapes, oranges).
% Although these two predicates have the same name, they
% are different because their arity is different.
% we can manipulate Prolog into actuallyevaluating the expression by using variables
%* Notice that we used the operator "is" because it is the operator that performs
% arithmetic operations on the right hand side (unlike "=" which doesn’t perform
% arithmetic operations).
% ?- X is (3 + 1) / 2 * 8.
%X = 16.
% Integer division:
%?- X is 9 // 2.
%X = 4.
% “is” only evaluates what is on its right.
%?- 3 + 1 is 2 + 2.
%false.
% =:= evaluates expressions both on its right and left.
%?- 3 + 1 =:= 2 + 2.
%true.
% \= checks that the terms on its sides can’t be unified.
%?- 4 \= 4.
%false.
% \= evaluates the expression on its right.
%?- 4 \= 2+2.
%true.
% =\= evaluates both expressions on its right and its left.
%?- 4 =\= 2+2.
%false.
% == returns true if its operands are identical without unifying them.
%?- X == 2.
%false.
% \== returns true if terms aren’t identical even if they can be unified.
%?- X \== 2.
%true.
%?- X \= 2.
%false.
%Notice the difference between =, is and =:=, the difference between = and ==, and
%the difference between \= and \==.
male(ali).
male(amr).
male(omar).
male(fady).
female(nour).
female(maha).
female(camilia).
parent(nour,amr).
parent(ali,amr).
parent(ali,maha).
parent(amr,camilia).
parent(amr,omar).
parent(omar,fady).
offspring(Y, X):- % ":-" means if.
parent(X, Y).
grandparent(X, Y):- parent(X, Z), parent(Z, Y).
father(X, Y):- male(X), parent(X, Y).
sister(X, Y):- female(X), parent(Z, X), parent(Z, Y), X \= Y. %!!!!!!!
aunt(X, Y):- parent(Z, Y), sister(X, Z).
% Note: The lexical scope of variable names is one clause. This means
% that if the name X occurs in two clauses, then it signifies two
% different variables. However,the occurrence of X within the same
% clause means the same variable.
predecessor(X, Y):- parent(X, Y).
predecessor(X, Y):- parent(X, Z), predecessor(Z, Y).
% the previous two rules is for the predecessor relation
% The first rule will define the direct predecessor
% and the second rule for the indirect predecessors.recursive rule!
% ● If we enter the trace mode using the query "?- trace.", we will see
% that Prolog finds the proof sequence in the inverse order (i.e. in a
% goal driven manner). Prolog starts with the goal and, using rules,
% substitutes the current goals with new sub goals, until new goals
% happen to be simple facts. If some goal fails, Prolog backtracks to
% try another alternative way to derive the top goal until it either
% succeeds or fails to find an adequate substitution.
% Exercise: Open the trace mode and observe the trace of the previous
% queries. You can close the trace mode using "?- notrace."
hold_party(X):-
birthday(X),
happy(X).
birthday(amr).
birthday(ali).
birthday(nada).
happy(maha).
happy(mai).
happy(nada).
% LAB1 ##

%Recursion in Prolog
% Recursion is usually slower(than iteration) and requires more memory,
% however it simplifies the problem a lot which makes it a powerful tool
% in Prolog.
% Notice that a recursive rule must never call itself with the same
% arguments! If that happens, the program will never end.

%define the predicate hasIntArg(Expression) that checks that the final
%argument of the expression is an integer.
hasIntArg(f(X)):- integer(X).
hasIntArg(Expression):- Expression = f(X), hasIntArg(X).

%! var uppercase
power(N, 0, 1).
power(N, P, Result):- NewP is P - 1, power(N, NewP, TmpRes),
    Result is N * TmpRes.

% Another solution could be as follows:
% N^10 is (N^5)*(N^5) and N^5 is (N)*(N^2)*(N^2)
% Base case
power(N,0,1).
% If the power is even
power(N, P, Result):- 0 is P mod 2, NewP is P / 2,
    power(N, NewP, TmpRes),
    Result is TmpRes * TmpRes.
% If the power is odd
power(N, P, Result):- Ptmp is P - 1,NewP is Ptmp / 2,
    power(N, NewP, TmpRes),Result is N * TmpRes * TmpRes.

%factorial
factorial(0, 1).
factorial(N, Result):- NewN is N - 1,factorial(NewN, TmpRes),
    Result is N * TmpRes.

%Tail recursion in Prolog:
% Tail recursion is a special case of recursion in which the last
% operation of the function is the recursive call. Tail recursive
% functions store information while computing the recursive call that is
% independent of the number of recursive calls.
%Factorial problem using tail recursion:

factorial(N, Result):- factorial(N, 1, Result).
factorial(0, Result, Result).
factorial(N, Acc, Result):- NewN is N - 1, NewAcc is N * Acc,
    factorial(NewN, NewAcc, Result).
%LAB2##

%Lists and Backtracking
%The terms can be any Prolog data type including structures
%and other lists.
%L = [ann, X, sport(tennis), [tom,skiing]]

member(X, [X|_]).
member(X, [_|Tail]):- member(X, Tail).

%?- member([c], [a, b|[c]]).
%false. % the list is [a,b,c], so c is a member while [c] isn’t.

delete(X, [X|Y], Y).  %the 3rd param aka Y the res and I will put as var
delete(X, [Y|Tail1], [Y|Tail2]):- delete(X, Tail1, Tail2).

before_last([X, _], X).
before_last([_|T], X):- before_last(T, X).

%(these problems may have more than one correct answer)the following

% suffix (Suffixed, List), where both arguments are lists
suffix(Suffixed, List):- append(_, Suffixed, List).
% append(List1, List2, List3), where List3 is the result of appending
% List2 to List1
% Notice that we implemented append/3 from scratch, but append exists as
% built-in predicate in Prolog.
append([], L, L).
append([H|T], L2, [H|NT]):- append(T, L2, NT).

% prefix(Prefixed, List), where both arguments are list
prefix(Prefixed, List):- append(Prefixed, _, List).
% append(List1, List2, List3), where List3 is the result of appending
% List2 to List1
% Notice that we implemented append/3 from scratch, but append exists as
% built-in predicate in Prolog.
append([], L, L).
append([H|T], L2, [H|NT]):- append(T, L2, NT).

% last(Last, List), where Last is an element and List is a list
last(Element, List):- append(_, [Element], List).
% Notice that we use the built-in append/3

