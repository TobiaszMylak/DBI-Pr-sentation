### Aufgaben für 'NULL', Anti-Patterns und Pagging ###

# Aufgabe: Datenbankkonzepte und SQL in Oracle

## Einführung
In dieser Aufgabe werden Sie grundlegende Datenbankkonzepte und SQL-Operationen im Kontext einer Oracle-Datenbank erkunden. Sie werden sich darauf konzentrieren, NULL-Werte, NULL-Indizierung, NOT NULL-Constraints und das Emulieren von partiellen Indizes mithilfe von SQL-Abfragen zu verstehen.

## Anweisungen

### Aufgabe 1: Verständnis von NULL-Werten
1. Erstellen Sie eine neue Tabelle mit dem Namen "Employees" und den folgenden Spalten:
   - `EmployeeID` (NUMBER)
   - `FirstName` (VARCHAR2)
   - `LastName` (VARCHAR2)
   - `Salary` (NUMBER)

```
SELECT * FROM Employees WHERE Salary IS NULL;
```

2. Fügen Sie mindestens fünf Zeilen mit Beispieldaten in die "Employees"-Tabelle ein. Einige Zeilen sollten NULL-Werte in der "Salary"-Spalte enthalten, während andere tatsächliche Gehaltswerte haben sollten.

```
-- Inserting sample data with NULL salaries
INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary)
VALUES (1, 'John', 'Doe', NULL);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary)
VALUES (2, 'Jane', 'Smith', NULL);

-- Inserting sample data with actual salaries
INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary)
VALUES (3, 'Alice', 'Johnson', 50000);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary)
VALUES (4, 'Bob', 'Williams', 60000);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary)
VALUES (5, 'Eva', 'Brown', 55000);
```

3. Schreiben Sie SQL-Abfragen, um:
   - Alle Mitarbeiter mit NULL-Gehältern auszuwählen.
   - Alle Mitarbeiter mit nicht NULL-Gehältern auszuwählen.
   - Erklären Sie den Unterschied zwischen NULL und einer leeren Zeichenkette ('') in SQL.

### Aufgabe 2: NULL-Indizierung in Oracle
1. Erstellen Sie eine neue Tabelle mit dem Namen "Products" und den folgenden Spalten und fügen Sie eine NOT NULL-Constraint zur Spalte "ProductName" hinzu:
   - `ProductID` (NUMBER)
   - `ProductName` (VARCHAR2)
   - `Price` (NUMBER)
```
-- 1. Creating the "Products" Table
CREATE TABLE Products (
    ProductID NUMBER,
    ProductName VARCHAR2(100) NOT NULL,
    Price NUMBER
);

```

2. Erstellen Sie einen Index auf der Spalte "Price".

3. Fügen Sie mehrere Zeilen in die "Products"-Tabelle ein, einschließlich einiger NULL-Werte in der "Price"-Spalte.

```
-- Inserting sample data into the "Products" table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (1, 'Product A', 10.99);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES (2, 'Product B', 15.49);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES (3, 'Product C', NULL); -- NULL price for Product C

INSERT INTO Products (ProductID, ProductName, Price)
VALUES (4, 'Product D', 7.99);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES (5, 'Product E', NULL); -- NULL price for Product E
```

4. Schreiben Sie SQL-Abfragen, um zu zeigen, dass Zeilen mit NULL-Werten in der "Price"-Spalte nicht in den Index aufgenommen werden. Erklären Sie die Auswirkungen der NULL-Indizierung in Oracle.

### Aufgabe 3: Implementierung von NOT NULL-Constraints
1. Erstellen Sie eine neue Tabelle mit dem Namen "Customers" und den folgenden Spalten und fügen Sie NOT NULL-Constraints zu den Spalten "CustomerID" und "CustomerName" hinzu:
   - `CustomerID` (NUMBER)
   - `CustomerName` (VARCHAR2)
   - `Email` (VARCHAR2)

```
-- 1. Creating the "Customers" Table
CREATE TABLE Customers (
    CustomerID NUMBER NOT NULL,
    CustomerName VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100)
);
```

2. Versuchen Sie, eine Zeile in die "Customers"-Tabelle einzufügen, ohne einen Wert für die Spalte "CustomerName" anzugeben. Dokumentieren Sie die erhaltene Fehlermeldung und erklären Sie, warum sie auftrat.

### Aufgabe 4: Emulation von partiellen Indizes
1. Erstellen Sie eine Tabelle mit dem Namen "Orders" und den folgenden Spalten:
   - `OrderID` (NUMBER)
   - `CustomerID` (NUMBER)
   - `OrderDate` (DATE)
   - `Status` (VARCHAR2)
```
-- 1. Creating the "Orders" Table
CREATE TABLE Orders (
    OrderID NUMBER,
    CustomerID NUMBER,
    OrderDate DATE,
    Status VARCHAR2(50)
);
```

2. Fügen Sie mehrere Zeilen in die "Orders"-Tabelle ein, einschließlich Bestellungen mit unterschiedlichen Status (z. B. 'Versendet,' 'Bearbeitung,' 'Storniert').
```
-- 2. Inserting Sample Data into the "Orders" Table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, Status)
VALUES (1, 101, TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'Shipped');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Status)
VALUES (2, 102, TO_DATE('2023-10-18', 'YYYY-MM-DD'), 'Processing');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Status)
VALUES (3, 103, TO_DATE('2023-10-20', 'YYYY-MM-DD'), 'Cancelled');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Status)
VALUES (4, 104, TO_DATE('2023-10-22', 'YYYY-MM-DD'), 'Shipped');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Status)
VALUES (5, 105, TO_DATE('2023-10-25', 'YYYY-MM-DD'), 'Processing');
```

3. Emulieren Sie einen partiellen Index für Bestellungen mit dem Status 'Versendet', indem Sie einen funktionsbasierten Index erstellen. Erklären Sie, wie Sie dies erreicht haben.

4. Schreiben Sie SQL-Abfragen, um zu zeigen, dass Ihr funktionsbasierter Index nur Zeilen mit dem Status 'Versendet' enthält.

### Anti-Pattern 5: Falsche Verwendung von Datums-Typen (Date Type Mismatch)

1. Erstellen Sie eine Oracle-Tabelle namens "Travel" mit folgenden Spalten:
   - `TravelID` (NUMBER)
   - `TravelDate` (VARCHAR2)
   - `Destination` (VARCHAR2)
```
CREATE TABLE Reisen (
    ReiseID NUMBER,
    ReiseDatum VARCHAR2(10),
    Reiseziel VARCHAR2(50)
);
```

2. Fügen Sie mindestens fünf Beispieldatensätze in die "Travel"-Tabelle ein, wobei das "TravelDate" als VARCHAR2-Zeichenfolge gespeichert wird.
```
-- Beispiel 1: Gültiges Datum
INSERT INTO Reisen (ReiseID, ReiseDatum, Reiseziel)
VALUES (1, '2023-10-15', 'Berlin');

-- Beispiel 2: Ungültiges Datum
INSERT INTO Reisen (ReiseID, ReiseDatum, Reiseziel)
VALUES (2, '2023-13-32', 'Paris');
```

3. Schreiben Sie SQL-Abfragen, um die Probleme bei der Verwendung von VARCHAR2 zur Speicherung von Datumsangaben zu demonstrieren:
   - Versuchen Sie, Datumsvergleiche oder -berechnungen auf der "TravelDate"-Spalte durchzuführen.
   - Zeigen Sie, wie ungültige Datumsangaben eingefügt werden können.

4. Diskutieren Sie die Probleme im Zusammenhang mit der Speicherung von Datumsangaben als VARCHAR2-Zeichenfolgen und schlagen Sie eine Lösung vor.

### Anti-Pattern 6: Speicherung numerischer Werte als Zeichenketten (Storing Numeric Values as Strings)

1. Erstellen Sie eine Oracle-Tabelle namens "Sales" mit folgenden Spalten:
   - `SalesID` (NUMBER)
   - `SalesAmount` (VARCHAR2)
   - `Product` (VARCHAR2)

```
CREATE TABLE Sales (
    SalesID NUMBER,
    SalesAmount VARCHAR2(20),
    Product VARCHAR2(50)
);
```

2. Fügen Sie mindestens fünf Beispieldatensätze in die "Sales"-Tabelle ein, wobei der "SalesAmount" als VARCHAR2-Zeichenfolge gespeichert wird.

```
-- Beispiel 1: Gültiger numerischer Wert
INSERT INTO Sales (SalesID, SalesAmount, Product)
VALUES (1, '250.75', 'Produkt A');

-- Beispiel 2: Nicht-numerischer Wert
INSERT INTO Sales (SalesID, SalesAmount, Product)
VALUES (2, 'Nicht-eine-Zahl', 'Produkt B');
```


3. Schreiben Sie SQL-Abfragen, um die Probleme bei der Verwendung von VARCHAR2 zur Speicherung von numerischen Werten zu demonstrieren:
   - Versuchen Sie, arithmetische Operationen (z. B. Addition) auf der "SalesAmount"-Spalte durchzuführen.
   - Zeigen Sie, wie Nicht-Zahlenwerte in dieser Spalte gespeichert werden können.

4. Diskutieren Sie die Probleme im Zusammenhang mit der Speicherung von numerischen Werten als VARCHAR2-Zeichenfolgen und schlagen Sie eine Lösung vor.


## Zusammenfassung
- Aufgabe 1: Verständnis von NULL-Werten 
- Aufgabe 2: NULL-Indizierung in Oracle 
- Aufgabe 3: Implementierung von NOT NULL-Constraints 
- Aufgabe 4: Emulation von partiellen Indizes 
- Aufgabe 5: Anti-Pattern - Falsche Verwendung von Datums-Typen (Date Type Mismatch)
- Aufgabe 6: Anti-Pattern - Speicherung numerischer Werte als Zeichenketten (Storing Numeric Values as Strings)

### Part Pagging ###

CREATE SEQUENCE Lieferungen_Seq
START WITH 1 
INCREMENT BY 1;

CREATE TABLE Lieferungen (
    LieferungsID NUMBER DEFAULT Lieferungen_Seq.NEXTVAL PRIMARY KEY,
    LebensmittelName VARCHAR2(255),
    Lebensmittelgruppe VARCHAR2(255),
    Menge NUMBER,
    Lieferdatum DATE
);

INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Äpfel', 'Obst', 500, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Bananen', 'Obst', 400, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Kartoffeln', 'Gemuese', 300, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Karotten', 'Gemuese', 400, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Orangen', 'Obst', 300, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Erdbeeren', 'Obst', 200, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Kartoffelchips', 'Snacks', 150, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Gurken', 'Gemuese', 250, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Eier', 'Milchprodukte', 300, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Milch', 'Milchprodukte', 200, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Hühnereier', 'Milchprodukte', 400, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Joghurt', 'Milchprodukte', 300, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Avocados', 'Gemuese', 150, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Ananas', 'Obst', 100, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Erdnüsse', 'Snacks', 300, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Kiwi', 'Obst', 100, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Pfirsiche', 'Obst', 200, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Erdbeermarmelade', 'Süßigkeiten', 150, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Pflaumen', 'Obst', 100, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Birnen', 'Obst', 150, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Kirschen', 'Obst', 100, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Blumenkohl', 'Gemuese', 200, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Brot', 'Nudeln und Getreide', 150, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Tomaten', 'Gemuese', 250, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Karotten', 'Gemuese', 150, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Granatäpfel', 'Obst', 150, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Mangos', 'Obst', 100, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Schwarzwurzeln', 'Gemuese', 200, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Erdnussbutter', 'Snacks', 150, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Kirschen', 'Obst', 100, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Pasta', 'Nudeln und Getreide', 300, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Reis', 'Nudeln und Getreide', 250, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Nudeln', 'Nudeln und Getreide', 400, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Spaghetti', 'Nudeln und Getreide', 350, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Brot', 'Nudeln und Getreide', 150, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Tomatensoße', 'Gemuese', 200, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Mehl', 'Nudeln und Getreide', 350, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Haferflocken', 'Nudeln und Getreide', 200, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Butter', 'Milchprodukte', 250, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Käse', 'Milchprodukte', 200, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Schinken', 'Fleisch und Fisch', 150, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Quinoa', 'Nudeln und Getreide', 150, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Makkaroni', 'Nudeln und Getreide', 200, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Erdnussbutter', 'Snacks', 250, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Pfirsichmarmelade', 'Süßigkeiten', 100, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Brokkoli', 'Gemuese', 200, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Spinat', 'Gemuese', 150, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Müsli', 'Nudeln und Getreide', 100, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Kartoffelbrei', 'Gemuese', 150, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Blaubeermarmelade', 'Süßigkeiten', 100, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Hummus', 'Snacks', 150, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Nudeln', 'Nudeln und Getreide', 200, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Ketchup', 'Gemuese', 100, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Orangen', 'Obst', 200, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Zucchini', 'Gemuese', 150, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Pilze', 'Gemuese', 100, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Kichererbsen', 'Nudeln und Getreide', 200, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Erdnussbutter', 'Snacks', 150, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Blumenkohl', 'Gemuese', 100, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Kirschen', 'Obst', 150, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Schweinefleisch', 'Fleisch und Fisch', 250, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Thunfischdosen', 'Fleisch und Fisch', 150, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Linsen', 'Nudeln und Getreide', 100, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Hühnchenbrust', 'Fleisch und Fisch', 200, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Rinderhackfleisch', 'Fleisch und Fisch', 150, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Lachsfilet', 'Fleisch und Fisch', 100, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Hähnchenschenkel', 'Fleisch und Fisch', 300, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Forellenfilet', 'Fleisch und Fisch', 100, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Garnelen', 'Fleisch und Fisch', 200, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Chinakohl', 'Gemuese', 150, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Ananas', 'Obst', 100, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Paprika', 'Gemuese', 200, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Erdnüsse', 'Snacks', 300, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Schokolade', 'Süßigkeiten', 400, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Kirschtomaten', 'Gemuese', 150, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Blaubeeren', 'Obst', 100, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Studentenfutter', 'Snacks', 300, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Avocadoöl', 'Öle', 100, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Erdnussöl', 'Öle', 150, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Kokosnussöl', 'Öle', 100, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Tomatenmark', 'Gemuese', 200, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Griechischer Joghurt', 'Milchprodukte', 100, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Fruchtjoghurt', 'Milchprodukte', 150, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Tofu', 'Milchprodukte', 100, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Chinakohl', 'Gemuese', 150, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Paprika', 'Gemuese', 100, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Erdnüsse', 'Snacks', 200, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Anchovis', 'Fleisch und Fisch', 150, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Räucherlachs', 'Fleisch und Fisch', 100, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Lieferungen (LebensmittelName, Lebensmittelgruppe, Menge, Lieferdatum)
VALUES
    ('Champignons', 'Gemuese', 100, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
    
-- Erstelle einen Index der am besten zu der Tabelle passt.

-- Schreibe ein Statement, das die ersten fünf Ergebnisse genau vor dem 20.10.2023(Sprich 5 ersten Ergebnisse der Lieferung vor dem 20.10.2023) ausgibt.
    
-- Schreibe ein Statement, das zehn Lieferungen ausgibt, die am 20.10.2023 angeliefert wurden und deren ID kleiner ist als 85 abwärts also die IDs: 84, 83, 82,...

-- Schreibe ein Statement das die Rownums von 80 bis 71 ausgibt