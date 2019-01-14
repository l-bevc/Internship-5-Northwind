--BAZA PODATAKA ZA BANKU
CREATE TABLE Titule(
	ID INT IDENTITY(1,1),
	Titula nvarchar(50)
)
INSERT INTO Titule
(Titula)
VALUES
('Direktor'),('Potpredsjednik'),('Investicijski suradnik'),(N'Investicijski analiti�ar')

SELECT * FROM Titule

CREATE TABLE Korisnici(
	ID INT IDENTITY(1,1),
	Ime nvarchar(25),
	Prezime nvarchar(25),
	OIB varchar(11),
	BrojMobitela varchar(15),
	Adresa nvarchar(50),
	Grad nvarchar(25),
	Dr�ava nvarchar(25),
	Po�tanskiBroj varchar(10)
)

INSERT INTO Korisnici
(Ime, Prezime, OIB, BrojMobitela, Adresa, Grad, Dr�ava, Po�tanskiBroj)
VALUES
('Laura','Bevc','11111111111','0987654321','Janka Rodina 10',N'Ka�tela','Hrvatska','21215'),
('Ana',N'Ani�','12345678910','0987654321','Velebitska 10','Split','Hrvatska','20000'),
('Maja',N'Maji�','55555555555','0987654322','Adresa 5','Zagreb','Hrvatska','10000')

SELECT * FROM Korisnici

CREATE TABLE Transakcije(
	ID INT IDENTITY(1,1),
	DatumObrade DATE,
	StatusIsporuke BIT
)

INSERT INTO Transakcije
(DatumObrade, StatusIsporuke)
VALUES
('2018/12/05', 1),('2019/01/10',0)

SELECT * FROM Transakcije

CREATE TABLE Zaposlenici(
	ID INT IDENTITY(1,1),
	Ime nvarchar(20),
	Prezime nvarchar(20),
	Titula nvarchar(50),
	Email  nvarchar(320),
)

INSERT INTO Zaposlenici
(Ime, Prezime, Titula, Email)
VALUES
('Ivo',N'Ivi�','Direktor','ivoivic@gmail.com'),
('Laura',N'Ivi�','Potpredsjednik','lauraivic@gmail.com')

SELECT * FROM Zaposlenici

--Zaposlenici s imenima a-g
SELECT * FROM Zaposlenici
WHERE Ime LIKE '[A-G]%'

--Dodavanje opisa u Transakcije
ALTER TABLE Transakcije
ADD Opis nvarchar(100)

UPDATE Transakcije
SET 
	Opis='Opis prve transakcije'
WHERE
	ID=1

UPDATE Transakcije
SET 
	Opis='Opis druge transakcije'
WHERE
	ID=2
--Dodavanje bilje�ki u Zaposlenici
ALTER TABLE Zaposlenici
ADD Bilje�keZaZaposlenike nvarchar(100)

UPDATE Zaposlenici
SET 
	Bilje�keZaZaposlenike='Bilje�ka'
WHERE
	ID IN (1,2)

ALTER TABLE Korisnici
ADD CONSTRAINT UX_Constraint UNIQUE(OIB)

--DRUGI ZADATAK, BAZA NORTHWIND
--1.
SELECT TOP 50 CompanyName, ContactName, ContactTitle, Address, City, Phone  FROM Customers
--2.
SELECT COUNT(CustomerID) CountCustomers FROM Customers
WHERE Fax IS NOT NULL AND Region IS NOT NULL
--3.
SELECT TOP 2 FirstName, LastName, Title FROM Employees
ORDER BY BirthDate 
--4.
SELECT * FROM Customers
WHERE Address LIKE '[0-9]%' AND CompanyName LIKE '__a%'
ORDER BY Country
--5.
SELECT TOP 1 COUNT(ProductID) CountOrders, QuantityPerUnit FROM Products
GROUP BY QuantityPerUnit
ORDER BY CountOrders DESC
--6.
SELECT CustomerID FROM Customers
WHERE CustomerID NOT IN (SELECT DISTINCT(CustomerID) FROM Orders)


