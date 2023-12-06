/* les entrées */
entree(crudites).
entree(terrine).
entree(melon).

/* les viandes (avec légumes associés) */
viande(steack).
viande(poulet).
viande(gigot).

/* les poissons (avec légumes associés) */
poisson(bar).
poisson(saumon).

/* les desserts */
dessert(sorbet).
dessert(creme).
dessert(tarte).

/* composition d'un menu simple : une entrée ET un plat ET un dessert */
menu_simple(E, P, D) :- entree(E), plat(P), dessert(D).

/* le plat de résistance : viande OU poisson */
plat(P) :- viande(P).
plat(P) :- poisson(P).

/* Rajoutez un prédicat menu(E,P,S) où le 3ième argument correspond à la fin de repas 
qui peut-être un dessert ou un fromage. Vous pouvez rajouter d’autres prédicats si 
nécessaires. */
/*solution 1*/
menu1(E,P,S):-entree(E),plat(P),sortie(S).
sortie(S):-dessert(S).
sortie(S):-fromage(S).

/* solution 2 */
menu2(E,P,S):-menu_simple(E,P,S).
menu2(E,P,S):-entree(E),plat(P),fromage(S).

/* avec le plateau de fromage */
fromage(chevre).
fromage(brie).
fromage(roquefort).

/* Rajoutez les prédicats nécessaires pour inclure la boisson dans un repas 
(un repas étant lui-même un menu et une boisson). */
boisson(eau_carafe).
boisson(eau_bouteille).
boisson(vin).
boisson(biere).

/* solution 1 */
repas1(E,P,D,B):-entree(E), plat(P), dessert(D), boisson(B).

/* solution 2 */
repas2(E,P,D,B):-menu1(E,P,D), boisson(B).
