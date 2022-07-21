go(Out) :-
    read(X),
    name(X, L),
    tokenize(L, Out).

tokenize([],[]) :- !.
tokenize(L, [Word|Out]) :-
    L \== [],
    tokenize(L, Rest, WordChs),
    name(Word, WordChs),
    tokenize(Rest, Out).

tokenize([], [], []) :- !.
tokenize([46|_], [], []) :- !.
tokenize([32|T], T, []) :- !.

tokenize([H|T], Rest, [H|List]) :-
    tokenize(T, Rest, List).
