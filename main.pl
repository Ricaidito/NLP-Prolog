:- ensure_loaded('./tokenizer.pl').
:- ensure_loaded('./NPL.pl').

dcg(X) :- go(List), sentence(X,List,[]).
