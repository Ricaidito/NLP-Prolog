:- op(500,xfy,=>).
:- op(500,xfy,&).

sentence(P) --> noun_phrase(X,P1,N,P), verb_phrase(X,N,P1).

noun_phrase(X,P1,N,P) --> determiner(X,P2,P1,N,P), adj_noun(X,N,P2).
noun_phrase(X,P1,N,P) --> determiner(X,P2,P1,N,P), adj_noun(X,N,P3), rel_clause(X,P3,N,P2).
noun_phrase(X,P1,N,(P2 & P1)) --> adj_noun(X,N,P2).

verb_phrase(X,N,P) --> trans_verb(X,Y,N,P1), noun_phrase(Y,P1,_,P).
verb_phrase(X,N,P) --> intrans_verb(X,N,P).
verb_phrase(X,_,P1) --> beVerb, adj(X,P1).

rel_clause(X, P1, N, (P1 => P2)) --> rel, verb_phrase(X,N,P2).

determiner(X, P1, P2, plural, all(X,(P1 => P2))) --> ['All'].
determiner(X, P1, P2, plural, all(X,(P1 => P2))) --> [all].
determiner(X, P1, P2, _, exists(X, (P1 & P2))) --> ['Some'].
determiner(X, P1, P2, _, exists(X, (P1 & P2))) --> [some].
determiner(X, P1, P2, singular, exists(X, (P1 & P2))) --> ['A'].
determiner(X, P1, P2, singular, exists(X, (P1 & P2))) --> [a].

adj_noun(X,N,(P1 & P2)) --> adj(X,P1) ,noun(X,N,P2).
adj_noun(X,N,P3) --> noun(X,N,P3).

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

trans_verb(X, Y, plural, like(X,Y)) --> [like].
trans_verb(X, Y, singular, likes(X,Y)) --> [likes].
trans_verb(X, Y, plural, contain(X,Y)) --> [contain].
trans_verb(X, Y, singular, contains(X,Y)) --> [contains].
trans_verb(X, Y, plural, eat(X,Y)) --> [eat].
trans_verb(X, Y, singular, eats(X,Y)) --> [eats].
trans_verb(X, Y, plural, conscript(X,Y)) --> [conscript].
trans_verb(X, Y, singular, conscripts(X,Y)) --> [conscripts].

intrans_verb(X,plural,run(X)) --> [run].
intrans_verb(X,singular,runs(X)) --> [runs].

beVerb --> [are].