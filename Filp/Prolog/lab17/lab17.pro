include "testgoal.inc"

domains
	num = integer.

predicates 
	max2(num, num, num).
    	max2ot(num, num, num).
    	
    	max3(num, num, num, num).
    	max3ot(num, num, num, num).
clauses 
	max2(A, B, A) :- A >= B.
	max2(A, B, B) :- B > A.
	
	max2ot(A, B, A) :- A >= B, !. 
	max2ot(_, B, B).
	
	
	max3(A, B, C, A) :- A >= B, A >= C.
	max3(A, B, C, B) :- B >= C, B >= A.
	max3(A, B, C, C) :- C >= A, C >= B.
	
	max3ot(A, B, C, A) :- A >= B, A >= C, !.
	max3ot(_, B, C, B) :- B >= C, !.
	max3ot(_, _, C, C).
	
	
goal
	%max2(5, 4, RES).
	%max2ot(4, 41, RES).
	%max3(4, 5, 1, RES).
	max3ot(4, 12, 24, RES).