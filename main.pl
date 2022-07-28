:- ensure_loaded('./tokenizer.pl').
:- ensure_loaded('./grammar.pl').

dcg(X) :- go(List), sentence(X,List,[]).
