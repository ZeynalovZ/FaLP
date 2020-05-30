/*****************************************************************************

		Copyright (c) My Company

 Project:  TESTGOAL
 FileName: TESTGOAL.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/


domains
       lastName, phoneNumber, city, street,
       brend, color, bank, bankAccount = symbol.
       building, flat, price = integer.
       summ = integer.
       address = adr(city, street, building, flat).

predicates 
    phoneBook(lastName, phoneNumber, address).
    investors(lastName, bank, bankAccount, summ).
    autos(lastName, brend, color, price).
    getInfoByMarkColour(brend, color, lastname, city, phoneNumber, bank).
clauses 

    

    autos(sanginov, mersedesbenssclass, mateblack, 55).
    autos(pupkin, lada, white, 10).
    autos(pupkin, mersedesbenssclass, mateblack, 10).
    autos(ivanov, pezho, black, 12).
    autos(ivanov, porshe, black, 12).
    
    investors(sanginov, sber, "1588", 20).
    investors(pupkin, tinkoff, "1088", 12).
    investors(ivanov, alpha, "1588", 19).
    investors(ivanov, otkritie, "1588", 19).
    
    phoneBook(sanginov, "6", adr(moscow, mayakovskaya, 6, 26)).
    phoneBook(pupkin, "5", adr(moscow, mayakovskaya, 7, 27)).
    phoneBook(ivanov, "7", adr(urengoy, mayakovskaya, 8, 28)).
    phoneBook(ivanov, "8", adr(moscow, tulchinskaya, 8, 28)).
    
    getInfoByMarkColour(Mark, Colour, Surname, City, PhoneNumber, Bank) :-
        autos(Surname, Mark, Colour, _), phoneBook(Surname, PhoneNumber, adr(City, _, _, _)),
        investors(Surname, Bank, _, _).
    	

goal
	%getInfoByPhone("6", Lastname, Brend, Price).
	%getInfoByPhone("6",_, Brend, _).
	%getInfoByLastNameAndCity(ivanov, urengoy, Street, Bank, PhoneNumber).
	%getInfoByLastNameAndCity(ivanov, moscow, Street, Bank, PhoneNumber).
	getInfoByMarkColour(lada, white, Surname, City, PhoneNumber, Bank).
	
	
	
    