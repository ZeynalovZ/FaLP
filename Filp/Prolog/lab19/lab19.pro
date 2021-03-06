/*****************************************************************************

		Copyright (c) My Company

 Project:  TESTGOAL
 FileName: TESTGOAL.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/


include "testgoal.inc"

domains
	numlist = integer*.
	num = integer.
predicates 
	listLen(numlist, num, num).
	len(numlist, num).
	
	listSum(numlist, num, num).
	sum(numlist, num).
	
	listOddSum(numlist, num, num).
	
	sumOdd(numlist, num).
clauses 
	listLen([], NUM, NUM) :- !.
	listLen([_|T], NUM, RES):-
		Res1 = NUM + 1,
		listLen(T, Res1, RES).	
		
	len(LIST, RES) :-
		listLen(LIST, 0, RES).
		
	
	listSum([], SUM, SUM) :- !.
		
	listSum([H|T], SUM, RES) :-
		TmpSum = SUM + H,
		listSum(T, TmpSum, RES).
		
	sum(LIST, RES) :-
		listSum(LIST, 0, RES).
		
		
	listOddSum([], SUM, SUM) :- !.
	listOddSum([_], SUM, SUM) :- !.
	
	listOddSum([_, X|T], SUM, RES) :- 
		S = SUM + X,
		listOddSum(T, S, RES).	
	
	sumOdd(LIST, RES) :-
		listOddSum(LIST, 0, RES).
	
goal
	%len([1,2, 1, 2], RES).
	%sum([1, 2, 3], RES).
	sumOdd([1, 2, 3, 4, 5, 2], RES).
    	%sumOdd([1, 2, 3, 4, 5, 18], RES).