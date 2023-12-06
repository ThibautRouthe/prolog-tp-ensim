not(X,Y):-X=0,Y=1;X=1,Y=0.
nand(X,Y,Z):-X=1,Y\=1,Z\=1;X=0,Y=1,Z=1.
xor(X,Y,Z):-X=1,Y\=Z.
circuit(X,Y,Z):-not(Z,A),xor(A,B,C),not(B,X),nand(C,X,Y).