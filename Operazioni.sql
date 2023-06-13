-- Operazione 1:
INSERT INTO BeniAlimentari(nome, prezzo, contenutoCalorico,tipo)
VALUES
(
    ?,?,?,pietanza
);

-- Operazione 2:
INSERT INTO Cliente(CF, nome, cognome, telefono)
VALUES
(
    ?,?,?,?
);

-- Operazione 3:
INSERT INTO Pizzeria(nome, citta, indirizzo, coperto)
VALUES
(
    ?,?,?,?
);

-- Operazione 4:
INSERT INTO Tavolo(codice, nome, numeroPosti, CF)
VALUES
(
    ?,?,?,?
);

-- Operazione 5:
INSERT INTO Pasto(codice, data, numeroCommensali, nome) 
VALUES (
?,?,?,?
);

-- Operazione 6:
UPDATE Pizzeria SET coperto = ? WHERE nome = ?;

-- Operazione 7:
DELETE 
FROM BeniAlimentari  
WHERE tipo="bevanda" AND nome = ?;

-- Operazione 8:
SELECT *
FROM Pasto AS p 
WHERE p.data = ?;

-- Operazione 9:
INSERT INTO Cameriere(CF, nome, cognome)
VALUES
(
    ?,?,?
);

-- Operazione 10:
SELECT nome, prezzo
FROM BeniAlimentari
WHERE tipo='pietanza' AND prezzo >= ALL(SELECT b2.prezzo
										FROM BeniAlimentari AS b2
										WHERE b2.nome=nome);


-- Operazione 11
SELECT nome, prezzo
FROM BeniAlimentari
WHERE tipo='bevanda' AND prezzo <= ALL(SELECT b2.prezzo
									   FROM BeniAlimentari AS b2
									   WHERE b2.nome=nome);
                                            
     
	
					 


-- Operazione 12: 
   SELECT b.nome
   FROM BeniAlimentari AS b
   WHERE NOT EXISTS(SELECT *
					FROM EComposto AS e
  				    WHERE e.nome = b.nome);


-- Operazione 13:
SELECT c.nome, c.cognome
FROM Cameriere AS c, Servizio AS s 
WHERE s.CF=c.CF 
GROUP BY c.CF
HAVING SUM(s.ore) > 500;

-- Operazione 14:
UPDATE BeniAlimentari SET prezzo = ? WHERE tipo="Pietanza" AND nome = ?;

-- Operazione 15:
SELECT p.numeroCommensali
FROM Pasto AS p 
WHERE p.codice = ?;

-- Operazione 16:
SELECT t.codice, t.nome
FROM Pasto AS p, Tavolo AS t   
WHERE p.numeroCommensali > 4 AND p.nome=t.nome;

-- Operazione 17:
SELECT c.nome, c.cognome
FROM Cameriere AS c
WHERE NOT EXISTS(SELECT *
				 FROM Pizzeria AS p
                 WHERE NOT EXISTS(SELECT *
								  FROM Servizio AS s, Cameriere AS c1
								  WHERE s.CF=c1.cf AND s.nome=p.nome AND c1.CF=c.CF));


