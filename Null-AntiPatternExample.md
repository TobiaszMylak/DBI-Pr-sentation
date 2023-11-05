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

2. Fügen Sie mindestens fünf Zeilen mit Beispieldaten in die "Employees"-Tabelle ein. Einige Zeilen sollten NULL-Werte in der "Salary"-Spalte enthalten, während andere tatsächliche Gehaltswerte haben sollten.

3. Schreiben Sie SQL-Abfragen, um:
   - Alle Mitarbeiter mit NULL-Gehältern auszuwählen.
   - Alle Mitarbeiter mit nicht NULL-Gehältern auszuwählen.
   - Erklären Sie den Unterschied zwischen NULL und einer leeren Zeichenkette ('') in SQL.

### Aufgabe 2: NULL-Indizierung in Oracle
1. Erstellen Sie eine neue Tabelle mit dem Namen "Products" und den folgenden Spalten:
   - `ProductID` (NUMBER)
   - `ProductName` (VARCHAR2)
   - `Price` (NUMBER)

2. Fügen Sie eine NOT NULL-Constraint zur Spalte "ProductName" hinzu.

3. Erstellen Sie einen Index auf der Spalte "Price".

4. Fügen Sie mehrere Zeilen in die "Products"-Tabelle ein, einschließlich einiger NULL-Werte in der "Price"-Spalte.

5. Schreiben Sie SQL-Abfragen, um zu zeigen, dass Zeilen mit NULL-Werten in der "Price"-Spalte nicht in den Index aufgenommen werden. Erklären Sie die Auswirkungen der NULL-Indizierung in Oracle.

### Aufgabe 3: Implementierung von NOT NULL-Constraints
1. Erstellen Sie eine neue Tabelle mit dem Namen "Customers" und den folgenden Spalten:
   - `CustomerID` (NUMBER)
   - `CustomerName` (VARCHAR2)
   - `Email` (VARCHAR2)

2. Fügen Sie NOT NULL-Constraints zu den Spalten "CustomerID" und "CustomerName" hinzu.

3. Versuchen Sie, eine Zeile in die "Customers"-Tabelle einzufügen, ohne einen Wert für die Spalte "CustomerName" anzugeben. Dokumentieren Sie die erhaltene Fehlermeldung und erklären Sie, warum sie auftrat.

### Aufgabe 4: Emulation von partiellen Indizes
1. Erstellen Sie eine Tabelle mit dem Namen "Orders" und den folgenden Spalten:
   - `OrderID` (NUMBER)
   - `CustomerID` (NUMBER)
   - `OrderDate` (DATE)
   - `Status` (VARCHAR2)

2. Fügen Sie mehrere Zeilen in die "Orders"-Tabelle ein, einschließlich Bestellungen mit unterschiedlichen Status (z. B. 'Versendet,' 'Bearbeitung,' 'Storniert').

3. Emulieren Sie einen partiellen Index für Bestellungen mit dem Status 'Versendet', indem Sie einen funktionsbasierten Index erstellen. Erklären Sie, wie Sie dies erreicht haben.

4. Schreiben Sie SQL-Abfragen, um zu zeigen, dass Ihr funktionsbasierter Index nur Zeilen mit dem Status 'Versendet' enthält.

### Anti-Pattern 5: Falsche Verwendung von Datums-Typen (Date Type Mismatch)

1. Erstellen Sie eine Oracle-Tabelle namens "Travel" mit folgenden Spalten:
   - `TravelID` (NUMBER)
   - `TravelDate` (VARCHAR2)
   - `Destination` (VARCHAR2)

2. Fügen Sie mindestens fünf Beispieldatensätze in die "ReiTravelsen"-Tabelle ein, wobei das "TravelDate" als VARCHAR2-Zeichenfolge gespeichert wird.

3. Schreiben Sie SQL-Abfragen, um die Probleme bei der Verwendung von VARCHAR2 zur Speicherung von Datumsangaben zu demonstrieren:
   - Versuchen Sie, Datumsvergleiche oder -berechnungen auf der "TravelDate"-Spalte durchzuführen.
   - Zeigen Sie, wie ungültige Datumsangaben eingefügt werden können.

4. Diskutieren Sie die Probleme im Zusammenhang mit der Speicherung von Datumsangaben als VARCHAR2-Zeichenfolgen und schlagen Sie eine Lösung vor.

### Anti-Pattern 6: Speicherung numerischer Werte als Zeichenketten (Storing Numeric Values as Strings)

1. Erstellen Sie eine Oracle-Tabelle namens "Sales" mit folgenden Spalten:
   - `SalesID` (NUMBER)
   - `SalesAmount` (VARCHAR2)
   - `Product` (VARCHAR2)

2. Fügen Sie mindestens fünf Beispieldatensätze in die "Sales"-Tabelle ein, wobei der "SalesAmount" als VARCHAR2-Zeichenfolge gespeichert wird.

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