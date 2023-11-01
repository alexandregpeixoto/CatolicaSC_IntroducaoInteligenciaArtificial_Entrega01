progenitor(jose, joao).
progenitor(jose, ana).
progenitor(maria, joao).
progenitor(maria, ana).
progenitor(ana, helena).
progenitor(ana, joana).
progenitor(joao, mario).
progenitor(helena, carlos).
progenitor(mario, carlos).
sexo(jose, masculino).
sexo(maria, feminino).
sexo(ana, feminino).
sexo(joao, masculino).
sexo(mario, masculino).
sexo(helena, feminino).
sexo(joana, feminino).
sexo(carlos, masculino).

mae(X, Y) :- progenitor(X, Y), sexo(X, feminino).
pai(X, Y) :- progenitor(X, Y), sexo(X, masculino).

tia(X, Y) :- irmao(X, Z), progenitor(Z, Y), sexo(X, feminino).
tio(X, Y) :- irmao(X, Z), progenitor(Z, Y), sexo(X, masculino).

avó(X, Y) :- progenitor(Z, Y), progenitor(X, Z), sexo(X, feminino).
avô(X, Y) :- progenitor(Z, Y), progenitor(X, Z), sexo(X, masculino).

irmao(X, Y) :- progenitor(Z, X), progenitor(Z, Y), X \= Y, sexo(X, masculino).
primaPartePai(X, Y) :- progenitor(Z, X), progenitor(W, Y), irmao(Z, W), sexo(Y, feminino).
primoPartePai(X, Y) :- progenitor(Z, X), progenitor(W, Y), irmao(Z, W), sexo(Y, masculino).

irma(X, Y) :- progenitor(Z, X), progenitor(Z, Y), X \= Y, sexo(X, feminino).
primaParteMae(X, Y) :- progenitor(Z, X), progenitor(W, Y), irma(Z, W), sexo(Y, feminino).
primoParteMae(X, Y) :- progenitor(Z, X), progenitor(W, Y), irma(Z, W), sexo(Y, masculino).

sobrinho(X,Y) :- sexo(X,masculino), progenitor(P,Y), irmao(P,X).
sobrinha(X,Y) :- sexo(X,feminino), progenitor(P,Y), irma(P,X).

descendente(X, Y) :- progenitor(Y, X).
