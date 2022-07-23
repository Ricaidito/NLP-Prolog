% op(500,xfy,->).
% op(500,xfy,&).

sentence(P) --> noun_phrase(X,P1,N,P), verb_phrase(X,N,P1).

noun_phrase(X,P1,N,P) --> determiner(X,P2,P1,N,P), noun(X,N,P3), rel_clause(X,P3,N,P2).

% verb_phrase(X,N,P) --> trans_verb(X,Y,P1), noun_phrase(Y,P1,N,P).

verb_phrase(X,N,P) --> intrans_verb(X,N,P).

rel_clause(X, P1, N, (P1&P2)) --> [that], verb_phrase(X,N,P2).

rel_clause(_,P,_,P) --> [].

determiner(X, P1, P2, plural, all(X,(P1 -> P2))) --> ['All'].

determiner(X, P1, P2, plural, all(X,(P1 -> P2))) --> [all].

determiner(X, P1, P2, singular, exists(X, (P1 & P2))) --> ['Some'].

determiner(X, P1, P2, singular, exists(X, (P1 & P2))) --> [some].

noun(X, singular, boy(X)) --> [boy].

noun(X, plural, boys(X)) --> [boys].

% noun(X, woman(X)) --> [woman].

% trans_verb(X, Y, loves(X,Y)) --> [loves].

intrans_verb(X,plural,run(X)) --> [run].

intrans_verb(X,singular,runs(X)) --> [runs].
