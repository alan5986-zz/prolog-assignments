%encodelist
encode_list([],_,[]) :- !.
encode_list([H|T],N,[U|V]) :- U is mod(H+N,128),
							  encode_list(T,N,V).
%encodestring
encode_string(S,N,X) :- string_codes(S,L),
					    encode_list(L,N,M),
						string_codes(X,M). 	
%decodelist
decode_list([],_,[]) :- !.
decode_list([H|T],N,[U|V]) :- U is mod(H-N,128),
							  decode_list(T,N,V).	  
%decodestring
decode_string(S,N,X) :- string_codes(S,L),
					    decode_list(L,N,M),
						string_codes(X,M). 					     
%shiftdistance
shift_distance(C,T,X) :- string_codes(C,[A|B]),
						 string_codes(T,[Y|Z]),
						 X is A-Y,
						 decode_list([A|B],X,[Y|Z]).
						 		
%caesarcandidate
caesar_candidate([],_,_,_) :- false,!.
caesar_candidate([L|I],C,N,PT) :- shift_distance(C,L,N), PT = L;	
								  caesar_candidate(I,C,N,PT).									