/*****************************************************************************

		Copyright (c) My Company

 Project:  TESTGOAL
 FileName: TESTGOAL.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/


domains
	num = integer.

predicates 
	factorial(num, num).
	factorialRes(num, num, num).
	
	fibonacciRes(num, num, num, num).
	fibonacci(num, num).
clauses 
	factorialRes(0, ResTmp, ResTmp) :- !.
		
	factorialRes(NUM, RES, ResTmp) :-
		R = ResTmp * NUM,
		N1 = NUM - 1,
		factorialRes(N1, RES, R).
	
	factorial(NUM, RES) :- factorialRes(NUM, RES, 1).
	
	fibonacciRes(0, N1, _, N1) :- !.
	
	fibonacciRes(N, N1, N2, RES) :-
        	S1 = N2,
        	S2 = N2 + N1,
        	NRes = N - 1,
        	fibonacciRes(NRes, S1, S2, RES).
		
	fibonacci(NUM,RES) :-
		fibonacciRes(NUM, 0, 1, RES).
goal
	factorial(4, RES).
	%fibonacci(6, RES).

	