%I will see(CUT)'always successed'... but I never see(fail)'never successed'aka we can't go to the following ..... both are barrier
even(X) :-
    0 is X mod 2,    % Check if X is divisible by 2 with no remainder
    !.               % Cut here to prevent backtracking

even(_).            % Fallback clause if the above condition fails
%!,fail means terminate 
