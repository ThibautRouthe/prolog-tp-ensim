afficheLigne([]).
afficheLigne([A,B,C]):-
	write(A),tab(3),
	write(B),tab(3),
	write(C),tab(3).
	
afficheGrille([]).
afficheGrille([T|Q]):- afficheLigne(T),nl,afficheGrille(Q).
afficheGrille([[A1,B1,C1],[A2,B2,C2],[A3,B3,B3]]):-
	afficheLigne([A1,B1,C1]),nl,
	afficheLigne([A2,B2,C2]),nl,
	afficheLigne([A3,B3,B3]).
	
succNum(1,2).
succNum(2,3).

succAlpha(a,b).
succAlpha(b,c).

ligneDeGrille(1,[Text|_],Text).
ligneDeGrille(NumLigne,[_|Reste],Text):-
	succNum(I,NumLigne),ligneDeGrille(I,Reste,Text).
	
caseDeLigne(1,[Valeur|_],Valeur).
caseDeLigne(Col,[_|Reste],Valeur) :-
    succNum(I, Col),
    caseDeLigne(I, Reste, Valeur).

caseDeGrille(NumCol,NumLigne,Grille,Case):-
	ligneDeGrille(NumLigne,Grille,Ligne),
	caseDeLigne(NumCol,Ligne,Case).

afficheCaseDeGrille(Colonne,Ligne,Grille):-
	caseDeGrille(Colonne,Ligne,Grille,Case),write(Case).
	
leCoupEstValide(Colonne,Ligne,Grille):-
	caseDeGrille(Colonne,Ligne,Grille,Case),Case=="-".

coupJoueDansLigne(a,Val,[-|L],[Val|L]).
coupJoueDansLigne(NumCol,Val,[T|Qd],[T|Qa]):-succAlpha(I,NumCol),coupJoueDansLigne(I,Val,Qd,Qa).

coupJoueDansGrille(NumCol,1,Val,[A|Reste],[B|Reste]):-coupJoueDansLigne(Numcol,Val,A,B).
coupJoueDansGrille(NumCol,NumLigne,Val,[L|Gd],[L|Ga]):-leCoupEstValide(C,NumLigne,[L|Gd]),succNum(I,NumLigne),coupJoueDansGrille(NumCol,I,Val,[Gd],[Ga]).

ligneFaite(Val,[A1,B1,C1]):-Val==A1,Val==B1,Val==C1.

ligneExiste(Val,[L|G],1):-ligneFaite(Val,L).
ligneExiste(Val,[L|G],NumLigne):-succNum(I,NumLigne),ligneExiste(Val,G,I).

colonneExiste(Val,[L|G],NumCol):-caseDeLigne(NumCol,L,Val),colonneExiste(Val,G,NumCol).

diagonaleGD(Val,[Val]).
diagonaleGD(Val,[L|G]):-caseDeLigne(a,L,Val),diagonaleGD(Val,G).

diagonaleDG(Val,[Val]).
diagonaleDG(Val,[L|G]):-caseDeLigne(a,L,Val),diagonaleDG(Val,G).

partieGagnee(Val,Grille):-diagonaleDG(Val,Grille);diagonaleGD(Val,Grille).
partieGagnee(Val,Grille):-member(I,[1,2,3]),ligneExiste(Val,Grille,I).
partieGagnee(Val,Grille):-member(I,[a,b,c]),colonneExiste(Val,Grille,I).