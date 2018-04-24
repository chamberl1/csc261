% Lab: First-Order Logic
% CSC 261 
%
% File
%   grandpa.pl
%
% Summary
%   some rules for familial relationships
%   and implementation of "I'm My Own Grandpa"
%

male(n).
male(f).
male(s1).
male(s2).
female(w).
female(d).
child(d,w).
child(n,f).
child(s1,w).
child(s2,d).
married(n,w).
married(f,d).
parent(P,C) :- child(C,P). %Part A
parent(P,C) :- married(P,X), child(C,X). %Part B
parent(P,C) :- married(X,P), child(C,X). 
father(F,C) :- male(F), parent(F,C). %Part A
mother(M,C) :- female(M), parent(M,C).
son(S,P) :- male(S), parent(P,S).
daughter(D,P) :- female(D), parent(P,D).
grandfather(G,C) :- father(G,P), parent(P,C).
grandmother(G,C) :- mother(G,P), parent(P,C).
grandson(S,G) :- son(S,P), parent(G,P).
granddaughter(D,G) :- daughter(D,P), parent(G,P).
wife(W, H) :- married(H,W).
husband(H,W) :- married(H,W).
sibling(X,Y) :- parent(P,X), parent(P,Y).
brother(B,X) :- male(B), sibling(B,X).
sister(S,X) :- female(S), sibling(S,X).
uncle(U,X) :- brother(U,P), parent(P,X).
aunt(A,X) :- sister(A,P), parent(P,X).



%Part B
soninlaw(S,P) :- husband(S,X), parent(P,X).



