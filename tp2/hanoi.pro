deplacer(A,B):-write("on déplace de "),write(A),write(' vers '),write(B),nl.

transferer(1,A,B,_) :- deplacer(A,B).
transferer(N,A,B,I) :- N>1,M is N-1,transferer(M,A,I,B),deplacer(A,B),transferer(M,I,B,A).