reconnu(M):-initial(Q0),chemin(Q0,M,Qf),final(Qf).

chemin(Qd,[],Qd).
chemin(Qd,[T|L],Qa):-transition(Qd,T,Qi),chemin(Qi,L,Qa).

initial(q1).
final(q0).

transition(q0,0,q0).
transition(q0,1,q1).
transition(q1,0,q0).
transition(q1,1,q1).