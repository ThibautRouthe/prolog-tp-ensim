%%
%% Le programme enigme
%%

%%
%% Base de faits
%%

alibi_pour_le_donne_par(luc, mardi, bernard).
alibi_pour_le_donne_par(paul, mardi, bernard).
alibi_pour_le_donne_par(louis, mardi, luc).
alibi_pour_le_donne_par(alain, jeudi, luc).

personnage_douteux(alain).

desire_se_venger_de(paul, jean).
desire_se_venger_de(luc, jean).

est_heritier_de(bernard, jean).
est_heritier_de(jean, louis).

doit_de_largent_a(louis, jean).
doit_de_largent_a(luc, jean).

a_vu_commettre_un_crime(jean, alain).

possede_une_arme(luc).
possede_une_arme(louis).
possede_une_arme(alain).

%%
%% Base de règles
%%

a_tue(X, Y, J) :-
	peut_desirer_tuer(X, Y),
	possede_une_arme(X),
	pas_alibi_pour(X, J).

pas_alibi_pour(X, J) :-
	not(alibi_pour_le_donne_par(X, J, _));
	alibi_pour_le_donne_par(X, J, Y),
	personnage_douteux(Y).

peut_desirer_tuer(X, Y) :-
	a_interet_a_tuer(X, Y);
	desire_se_venger_de(X, Y).

a_interet_a_tuer(X, Y) :-
	est_heritier_de(X, Y);
	doit_de_largent_a(X, Y);
	a_vu_commettre_un_crime(Y, X).

%%
%% But a atteindre
%%

but :-
	a_tue(X, jean, mardi),
	write('Le coupable est '),
	write(X),
	nl.

%%
%% Fin du fichier
%%
