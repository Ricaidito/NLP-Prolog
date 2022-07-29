:- op(500,xfy,=>).
:- op(500,xfy,&).

s(P) --> np(X,P1,N,P), vp(X,N,P1).

np(X,P1,N,P) --> det(X,P2,P1,N,P), adjNoun(X,N,P2).
np(X,P1,N,P) --> det(X,P2,P1,N,P), adjNoun(X,N,P3), relCl(X,P3,N,P2).
np(X,P1,N,(P2 & P1)) --> adjNoun(X,N,P2).

vp(X,N,P) --> transVerb(X,Y,N,P1), np(Y,P1,_,P).
vp(X,N,P) --> intransVerb(X,N,P).
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

transVerb(X, Y, plural, like(X,Y)) --> [like].
transVerb(X, Y, singular, likes(X,Y)) --> [likes].
transVerb(X, Y, plural, contain(X,Y)) --> [contain].
transVerb(X, Y, singular, contains(X,Y)) --> [contains].
transVerb(X, Y, plural, eat(X,Y)) --> [eat].
transVerb(X, Y, singular, eats(X,Y)) --> [eats].
transVerb(X, Y, plural, conscript(X,Y)) --> [conscript].
transVerb(X, Y, singular, conscripts(X,Y)) --> [conscripts].

intransVerb(X,plural,run(X)) --> [run].
intransVerb(X,singular,runs(X)) --> [runs].

beVerb --> [are].
