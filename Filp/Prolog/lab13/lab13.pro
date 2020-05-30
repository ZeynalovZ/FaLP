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
       name, lastName, phoneNumber, city, street,
       brend, color, bank, bankAccount = symbol.
       flat, price, ownPrice, summ, house, sumVar = integer.
       
       address = adr(city, street, house, flat).
       clause = autos(name, price); 
       		building(name, price); 
       		ship(name, price);
       		area(name, price).

predicates 
	phoneBook(lastName, phoneNumber, address)
    	investors(lastName, bank, bankAccount, summ)
    	owner(lastName, clause) 
    	getInfoByLastNameAndCity(lastname, city, street, bank, phoneNumber)
    	ownership(lastName, name, price)
    	getSum(lastName, sumVar)
    
clauses 
	phoneBook(sanginov, "6", adr(moscow, mayakovskaya, 6, 26)).
	phoneBook(pupkin, "5", adr(moscow, mayakovskaya, 7, 27)).
	phoneBook(ivanov, "7", adr(urengoy, mayakovskaya, 8, 28)).
	phoneBook(ivanov, "8", adr(moscow, tulchinskaya, 8, 28)).
			
	investors(sanginov, sber, "1588", 20).
	investors(pupkin, tinkoff, "1088", 12).
	investors(ivanov, alpha, "1588", 19).
	investors(ivanov, otkritie, "1588", 19).
	
	owner(sanginov, autos(mersedesbenssclass, 55)).
	owner(ivanov, ship(mssclass, 67)).
	owner(ivanov, autos(mercedes, 21)).
	owner(sanginov, building(moscowCity, 160)).
    	owner(sanginov, area(derbentskiy, 12203)).
    	owner(ivanov, area(moscowskiy, 120)).
    	
    	getInfoByLastNameAndCity(Lastname, City, Street, Bank, PhoneNumber) :-
    		phoneBook(Lastname, PhoneNumber, adr(City, Street, _, _)),
    		investors(Lastname, Bank, _, _).
    	
    	ownership(Lastname, OwnName, OwnPrice) :-
    		owner(Lastname, autos(OwnName, OwnPrice))!,
    		owner(Lastname, ship(OwnName, OwnPrice))!,
    		owner(Lastname, building(OwnName, OwnPrice))!,
    		owner(Lastname, area(OwnName, OwnPrice)).
    		
    		
goal
	%getInfoByPhone("6", Lastname, Brend, Price).
	%getInfoByPhone("6",_, Brend, _).
	%getInfoByLastNameAndCity(ivanov, urengoy, Street, Bank, PhoneNumber).
	%getInfoByLastNameAndCity(ivanov, moscow, Street, Bank, PhoneNumber).
	%owner(sanginov, CLAUSE).
	%2) ownership(sanginov, OwnName, OwnPrice).
	ownership(sanginov, OwnName, _).
	
	
	
	
    