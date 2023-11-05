# Lösungen: Datenbankkonzepte und SQL in Oracle

## Aufgabe 1: Verständnis von NULL-Werten

**SQL-Abfragen:**

1. Alle Mitarbeiter mit NULL-Gehältern auswählen:
```
SELECT * FROM Employees WHERE Salary IS NULL;
```

2. Alle Mitarbeiter mit nicht NULL-Gehältern auswählen:
```
SELECT * FROM Employees WHERE Salary IS NOT NULL;
```

3. Erklärung des Unterschieds zwischen NULL und einer leeren Zeichenkette ('') in SQL:
   - NULL repräsentiert das Fehlen eines Wertes oder unbekannte Daten.
   - Eine leere Zeichenkette ('') repräsentiert eine absichtlich leere Zeichenfolge oder einen Wert.

## Aufgabe 2: NULL-Indizierung in Oracle

**SQL-Abfragen:**
```
-- 1. Creating the "Products" Table
CREATE TABLE Products (
    ProductID NUMBER,
    ProductName VARCHAR2(100) NOT NULL,
    Price NUMBER
);
```

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

4. SQL-Abfrage zur Überprüfung der Nicht-Indizierung von NULL-Werten in Oracle:
-- Erstelle einen Index auf der Spalte "Price"

```
CREATE INDEX idx_preis ON Products (Price);
```

-- Füge Zeilen mit NULL-Werten in die "Price"-Spalte ein
```
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (1, 'Produkt A', NULL);
```
-- Überprüfe, ob die Zeile mit NULL-Wert im Index enthalten ist
-- (Die Ergebnismenge sollte keine Zeilen zurückgeben)

```
SELECT * FROM Products WHERE Price IS NULL;
```

5. Erklärung der Auswirkungen der NULL-Indizierung in Oracle:
   - Zeilen mit NULL-Werten in allen indizierten Spalten werden nicht in den Index aufgenommen.
   - Dadurch können Abfragen, die den Index verwenden, diese Zeilen nicht effizient abrufen.

## Aufgabe 3: Implementierung von NOT NULL-Constraints

**SQL-Abfragen:**

1. Versuch, eine Zeile ohne Wert für die "CustomerName"-Spalte einzufügen:
-- Dieser Befehl sollte einen Fehler auslösen, da die "CustomerName"-Spalte NOT NULL ist.
```
INSERT INTO Customers (CustomerID, CustomerName, Email)
VALUES (1, NULL, 'kunde@example.com');
```

```
   - Fehlermeldung: "ORA-01400: Einfügen von NULL in ("IHR_SCHEMA"."CUSTOMERS"."CustomerName") nicht möglich"
```

2. Erklärung des Fehlers:
   - Der Fehler tritt auf, weil die NOT NULL-Constraint-Anforderung verletzt wurde. Es wurde versucht, eine Zeile ohne Wert für die "CustomerName"-Spalte einzufügen, was aufgrund der Constraint nicht erlaubt ist.

## Aufgabe 4: Emulation von partiellen Indizes

**SQL-Abfragen:**
```
-- 1. Creating the "Orders" Table
CREATE TABLE Orders (
    OrderID NUMBER,
    CustomerID NUMBER,
    OrderDate DATE,
    Status VARCHAR2(50)
);
```

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


1. SQL-Befehl zur Emulation eines partiellen Index für Bestellungen mit dem Status 'Versendet':
-- Erstelle einen funktionsbasierten Index, der nur Zeilen mit dem Status 'Versendet' indiziert

```
CREATE INDEX idx_versandte_bestellungen ON Orders (CASE WHEN Status = 'Versendet' THEN Status ELSE NULL END);
```

2. SQL-Abfrage zum Überprüfen des funktionsbasierten Index:
-- Überprüfe, ob der funktionsbasierte Index nur Zeilen mit dem Status 'Versendet' enthält

```
SELECT * FROM Orders WHERE Status = 'Versendet';
```

## Anti-Pattern 5: Falsche Verwendung von Datums-Typen
1. Erstellung der "Reisen"-Tabelle:
```
CREATE TABLE Reisen (
    ReiseID NUMBER,
    ReiseDatum VARCHAR2(10),
    Reiseziel VARCHAR2(50)
);
```

2. Einfügen von Beispieldaten:
```
-- Beispiel 1: Gültiges Datum
INSERT INTO Reisen (ReiseID, ReiseDatum, Reiseziel)
VALUES (1, '2023-10-15', 'Berlin');

-- Beispiel 2: Ungültiges Datum
INSERT INTO Reisen (ReiseID, ReiseDatum, Reiseziel)
VALUES (2, '2023-13-32', 'Paris');
```

3. SQL-Abfrage zur Demonstration von Problemen:

```
-- Problem 1: Ungültige Datumsberechnung
SELECT ReiseID, ReiseDatum, Reiseziel
FROM Reisen
WHERE TO_DATE(ReiseDatum, 'YYYY-MM-DD') > TO_DATE('2023-10-20', 'YYYY-MM-DD');

-- Problem 2: Einfügen eines ungültigen Datums
INSERT INTO Reisen (ReiseID, ReiseDatum, Reiseziel)
VALUES (3, 'Nicht-ein-Datum', 'London');
```

4. Lösung und Diskussion:

Das Problem beim Speichern von Datumsangaben als VARCHAR2 ist, dass die Datenbank keine Datumsvalidierung durchführt.
Ungültige Datumsangaben können eingefügt werden, und Berechnungen erfordern die Konvertierung von Zeichenfolgen in Datumsdatentypen.

Lösung: Verwenden Sie den Datumsdatentyp DATE für die "ReiseDatum"-Spalte, um Datumsvalidierung und -berechnungen zu ermöglichen


## Anti-Pattern 6: Speicherung numerischer Werte als Zeichenketten

1. Erstellung der "Verkäufe"-Tabelle:
```
CREATE TABLE Verkäufe (
    VerkaufsID NUMBER,
    VerkaufsBetrag VARCHAR2(20),
    Produkt VARCHAR2(50)
);
```


2. Einfügen von Beispieldaten:
```
-- Beispiel 1: Gültiger numerischer Wert
INSERT INTO Verkäufe (VerkaufsID, VerkaufsBetrag, Produkt)
VALUES (1, '250.75', 'Produkt A');

-- Beispiel 2: Nicht-numerischer Wert
INSERT INTO Verkäufe (VerkaufsID, VerkaufsBetrag, Produkt)
VALUES (2, 'Nicht-eine-Zahl', 'Produkt B');
```
3. SQL-Abfrage zur Demonstration von Problemen:
```
-- Problem 1: Arithmetische Operation auf einer Zeichenkette
SELECT VerkaufsID, VerkaufsBetrag, Produkt, 
       TO_NUMBER(VerkaufsBetrag) * 2 AS VerdoppelterBetrag
FROM Verkäufe;

-- Problem 2: Einfügen einer nicht-numerischen Zeichenkette
INSERT INTO Verkäufe (VerkaufsID, VerkaufsBetrag, Produkt)
VALUES (3, 'Zweihundert', 'Produkt C');
```

4. Lösung und Diskussion:

* Das Speichern von numerischen Werten als VARCHAR2 führt zu Problemen bei arithmetischen Operationen und erlaubt die Einfügung nicht-numerischer Werte.

Lösung: Verwenden Sie den numerischen Datentyp NUMBER für die "VerkaufsBetrag"-Spalte, um numerische Berechnungen zu ermöglichen und Datenintegrität sicherzustellen.