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