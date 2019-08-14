% Alan Elliott - alme2

:- use_module(library(clpfd)).

%1 distances([Bs,B,Ds])
distances([],_,[]).
distances([H|T],Y,[D|S]) :- 
	D #= abs(Y-H),
	distances(T,Y,S).
	
%2 triangle(Bs,Ds)
triangle([],[]).
triangle([X|Y],Ds) :-  
	distances(Y,X,L),
	append(L,N,Ds), 
	triangle(Y,N).
	
%3 bananas(Bs)
bananas(Bs) :- 						   
	length(Bs,4),
	Bs ins 1..10,
	triangle(Bs,X),
	all_different(X),	
	labeling([],Bs).
	
%4 main(Solns)
main(Solns) :-
	findall(R,bananas(R),Results),
	length(Results,Solns).	

	
