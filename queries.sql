|------------ Database Queries -------------|

-- 1.) Find all customers with postal code 1010
SELECT CustomerName FROM Customers WHERE PostalCode = 1010;

3 Records:
Cactus Comidas para llevar
Océano Atlántico Ltda.
Rancho grande

-- 2.) Find the phone number for the supplier with the id 11

SELECT Phone FROM Suppliers WHERE SupplierID = 11;

Phone Number: 
(010) 9984510

-- 3.) List first 10 orders placed, sorted descending by the order date

SELECT * FROM Orders ORDER BY OrderDate DESC LIMIT 10;

List of first 10 orders placed:
OrderID   CustomerID   EmployeeID   OrderDate   ShipperID
10443	    66	 	    8	 	    1997-02-12	 1
10442	    20	 	    3	 	    1997-02-11	 2
10440	    71	 	    4	 	    1997-02-10	 2
10441	    55	 	    3	 	    1997-02-10	 2
10439	    51	 	    6	 	    1997-02-07	 3
10438	    79	 	    3	 	    1997-02-06	 2
10436	    7	 	    3	 	    1997-02-05	 2
10437	    87	 	    8	 	    1997-02-05	 1
10435	    16	 	    8	 	    1997-02-04	 2
10433	    60		    3	 	    1997-02-03	 3

-- 4.) Find all customers that live in London, Madrid, or Brazil

SELECT * FROM Customers 
WHERE City = 'Madrid' 
OR City = 'London' 
OR Country = 'Brazil';

18 Records.

-- 5.) Add a customer record for "The Shire", the contact name is "Bilbo Baggins" the address is -"1 Hobbit-Hole" in "Bag End", postal code "111" and the country is "Middle Earth"

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('The Shire', 'Bilbo Baggins', '1 Hobbit-Hole', 'Bag End', '111', 'Middle Earth');

-- 6.) Update Bilbo Baggins record so that the postal code changes to "11122"

UPDATE Customers SET PostalCode = 11122 WHERE CustomerID = 93;

-- (Stretch) Find a query to discover how many different cities are stored in the Customers table. Repeats should not be double counted

SELECT Count(Distinct City) FROM Customers;

-- (Stretch) Find all suppliers who have names longer than 20 characters. You can use `length(SupplierName)` to get the length of the name

SELECT * FROM Suppliers WHERE length(SupplierName) > 20;
