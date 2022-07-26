:- op(500,xfy,&).
:- op(600,xfy,=>).

go(Out):-
    read(C),
    name(C,L),
    tokenize(L,Out).

tokenize([],[]):-!.
tokenize(L,[Word|Out]):-
    L\==[],
    tokenize(L,Rest,WordChs),
    name(Word,WordChs),
    tokenize(Rest,Out).

tokenize([],[],[]):- !.
tokenize([46|_],[],[]):- !.
tokenize([32|T],T,[]):- !.

tokenize([H|T],Rest,[H|List]):-
    tokenize(T,Rest,List).

dcg(Out) :-
    go(C),
    write(C),
    s(Out, C, []).

s(X1) --> np(N, X, X1, C), vp(N, X, C).

np(N, X, X2, C) --> det(N, X1, X, X2, C), noun(N, X1, C).
np(N, X, X2, C) --> det(N, X3, X1, X2, C), noun(N, X3, C), relCl(N, X, X1, C).
np(N, X, (X2, X), C) --> noun(N, X2, C).

vp(N, X2, C) --> verb(N, X2, C).
vp(N, X2, C) --> verb(N, X1, C), np(_, X1, X2, C).
vp(N, (X1, X2), C) --> beVerb(N, X1, C), adj(X2, C).

relCl(N, X, (X1, X), C) --> rel, vp(N, X1, C).
relCl(N, X, (X1, X), C) --> rel, np(N, X, X1, C), verb(N, X1, C).

verb(s, eats(C), C) --> [eats].
verb(p, conscripts(C), C) --> [conscripts].
verb(p, run(C), C) --> [run].
verb(p, like(C), C) --> [like].
verb(p, contain(C), C) --> [contain].

verb(s, runs(C), C) --> [runs].
verb(p, eat(C), C) --> [eat].

noun(s, boy(C), C) --> [boy].
noun(s, apple(C), C) --> [apple].
noun(_, government(C), C) --> [government].
noun(s, flavor(C), C) --> [flavor].
noun(p, boys(C), C) --> [boys].
noun(p, people(C), C) --> [people].
noun(p, watermelons(C), C) --> [watermelons].
noun(p, girls(C), C) --> [girls].

beVerb(p, are(C), C) --> [are].

rel --> [that].

adj(evil(C), C) --> [evil].
adj(divine(C), C) --> [divine].
adj(pacifist(C), C) --> [pacifist].

det(_, X, X1, all(C, (X => X1)), C) --> [all].
det(_, X, X1, exists(C, (X & X1)), C) --> [some].
det(_, X1, X2, exists(C, (X1 & X2)), C) --> [a].
