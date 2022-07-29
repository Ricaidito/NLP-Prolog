% PDP1 - Mini-Proyecto Parcial - Procesamiento de Lenguaje Natural
% Carlos Collado - 10138713
% Ricardo Ramirez - 10139152

:- op(500,xfy,=>).
:- op(500,xfy,&).

s(P) --> np(X,P1,N,P), vp(X,N,P1).

np(X,P1,N,P) --> det(X,P2,P1,N,P), adjNoun(X,N,P2).
np(X,P1,N,P) --> det(X,P2,P1,N,P), adjNoun(X,N,P3), relCl(X,P3,N,P2).
np(X,P1,N,(P2 & P1)) --> adjNoun(X,N,P2).

vp(X,N,P) --> verb(X,Y,N,P1), np(Y,P1,_,P).
vp(X,N,P) --> verb(X,N,P).
vp(X,_,P1) --> beVerb, adj(X,P1).

relCl(X, P1, N, (P1 => P2)) --> rel, vp(X,N,P2).

det(X, P1, P2, plural, all(X,(P1 => P2))) --> ['All'].
det(X, P1, P2, plural, all(X,(P1 => P2))) --> [all].
det(X, P1, P2, _, exists(X, (P1 & P2))) --> ['Some'].
det(X, P1, P2, _, exists(X, (P1 & P2))) --> [some].
det(X, P1, P2, singular, exists(X, (P1 & P2))) --> ['A'].
det(X, P1, P2, singular, exists(X, (P1 & P2))) --> [a].

adjNoun(X,N,(P1 & P2)) --> adj(X,P1) ,noun(X,N,P2).
adjNoun(X,N,P3) --> noun(X,N,P3).

rel --> [that].

noun(X, singular, boy(X)) --> [boy].
noun(X, plural, boys(X)) --> [boys].
noun(X, singular, watermelon(X)) --> [watermelon].
noun(X, plural, watermelons(X)) --> [watermelons].
noun(X, singular, flavor(X)) --> [flavor].
noun(X, plural, flavors(X)) --> [flavors].
noun(X, singular, apple(X)) --> [apple].
noun(X, plural, apples(X)) --> [apples].
noun(X, singular, government(X)) --> [government].
noun(X, plural, governments(X)) --> [governments].
noun(X, _, people(X)) --> [people].

adj(X, divine(X)) --> [divine].
adj(X, pacifist(X)) --> [pacifist].
adj(X, evil(X)) --> [evil].

verb(X, Y, plural, like(X,Y)) --> [like].
verb(X, Y, singular, likes(X,Y)) --> [likes].
verb(X, Y, plural, contain(X,Y)) --> [contain].
verb(X, Y, singular, contains(X,Y)) --> [contains].
verb(X, Y, plural, eat(X,Y)) --> [eat].
verb(X, Y, singular, eats(X,Y)) --> [eats].
verb(X, Y, plural, conscript(X,Y)) --> [conscript].
verb(X, Y, singular, conscripts(X,Y)) --> [conscripts].
verb(X,plural,run(X)) --> [run].
verb(X,singular,runs(X)) --> [runs].

beVerb --> [are].
