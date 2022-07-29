% Carlos Collado - 10138713
% Ricardo Ramirez - 10139152

:- ensure_loaded('./tokenizer.pl').
:- ensure_loaded('./grammar.pl').

dcg(X) :- go(List), s(X,List,[]).


% Casos Prueba:
% 1. 'All boys run'.
% 2. 'All boys like all watermelons that contain some divine flavor'.
% 3. 'Some boy eats some apple'.
% 4. 'Some government conscripts some pacifist people'.
% 5. 'All government that conscripts pacifist people are evil'.
