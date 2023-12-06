/* Une base de fait familiale */
mere(marie_de_medicis, gaston_d_orleans) .  
mere(marie_de_medicis, louis_XIII) .
mere(marguerite_d_autriche, anne_d_autriche) .
mere(marguerite_d_autriche, philippe_IV) . 
mere(anne_d_autriche, louis_XIV) .
mere(anne_d_autriche, philippe_I_d_orleans) .
mere(jeanne_d_albret,henri_IV) .
pere(henri_IV, gaston_d_orleans) .
pere(henri_IV, louis_XIII) .
pere(philippe_III, anne_d_autriche) .
pere(philippe_III, philippe_IV) . 
pere(louis_XIII, louis_XIV) .
pere(louis_XIII, philippe_I_d_orleans) .
pere(louis_XIV, duc_d_anjou).
pere(antoire_de_bourbon, henri_IV).

/* Question b */
/* X est le parent de Y */
parent(X, Y) :- pere(X, Y).
parent(X, Y) :- mere(X, Y).

enfant(X,Y):- parent(Y,X).

/* Question c */
ancetre(X, Y) :- parent(X, Y). % X est ancetre de Y
ancetre(X, Y) :- parent(X, Z), ancetre(Z, Y).

% deuxième solution
ancetre2(X, Y) :- enfant(Y,X).
ancetre2(X, Y) :- enfant(Z, X), ancetre2(Z, Y).


% trosième solution
ancetre3(X, Y) :- parent(X,Y).
ancetre3(X, Y) :- parent(Z, Y), ancetre3(X, Z).




/* Compléments */
/* X est grand-pere de Y si X est père d'un parent de Y */
gd_pere(X, Y) :- pere(X, Z), parent(Z, Y).
gd_mere(X, Y) :- mere(X, Z), parent(Z, Y).
gd_parent(X, Y) :- parent(X, Z), parent(Z, Y).

/*en considérant qu ils ont un parent en commun*/
frere_ou_soeur(X, Y) :- parent(Z, X), parent(Z, Y), X\==Y.

oncle_ou_tante(X, Y) :- parent(Z,Y), frere_ou_soeur(X, Z).


/* utilisation du fail */
liste_pere :- pere(X,Y), write(X), writef('a pour pere'), write(Y), nl, fail .





