:- ensure_loaded('./tokenizer.pl').
:- ensure_loaded('./npl.pl').

dcg(X) :- go(List), sentence(X,List,[]).
