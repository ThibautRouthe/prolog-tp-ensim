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
parent(X,Y):-pere(X,Y);mere(X,Y).
enfant(X,Y):-parent(Y,X).
ancetre(X,Y):-parent(X,Y).
ancetre(X,Y):-parent(X,Z),ancetre(Z,Y).