female(scarlet).
female(white).
female(peacock).
female(orchid).

male(plum).
male(mustard).
male(green).

hates(scarlet, green).

hates(green, white).
hates(white, green).

hates(plum, white).
hates(white, plum).

hates(mustard, X ) :- female(X).
hates(mustard, plum).


likes(scarlet, orchid).

likes(peacock, orchid).
likes(orchid, peacock).

likes(scarlet, white).
likes(scarlet, plum).

likes(plum, X) :- hates(mustard, X).

enemies(X, Y) :- hates(X, Y), hates(Y, X).
friends(X, Y) :- likes(X, Y), likes(Y, X).
friends(S, Z):- enemies(S, Y) , enemies(Y, Z).


