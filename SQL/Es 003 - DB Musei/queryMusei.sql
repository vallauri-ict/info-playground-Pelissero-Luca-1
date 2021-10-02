/* 8. Per ogni museo di Londra il numero di opere di artisti ivi conservate */
SELECT m.NomeMuseo, COUNT(*) as NumeroOpere
FROM Artisti a, Opere o, Musei m
WHERE a.Nazionalita='IT'
AND a.NomeA=o.NomeA
AND m.NomeMuseo=o.NomeMuseo
AND m.Citta='Londra'
GROUP BY m.NomeMuseo

/* 9. Il nome dei musei di Londra che non hanno opere di Tiziano */
SELECT m.NomeMuseo
FROM Musei m
WHERE m.Citta='Londra'
AND NOT EXISTS (SELECT * FROM Opere o WHERE o.NomeA='Tiziano' AND o.NomeMuseo=m.NomeMuseo)
/* oppure */
SELECT *
FROM Musei m
WHERE m.Citta='Londra'
AND 'Tiziano' NOT IN (SELECT o.NomeA FROM Opere o WHERE o.NomeMuseo=m.NomeMuseo)

/* 10. Il nome dei musei di Londra che non hanno opere di Tiziano */
SELECT m.NomeMuseo
FROM Musei m
WHERE m.Citta='Londra'
AND NOT EXISTS (SELECT * FROM Opere o WHERE o.NomeA<>'Tiziano' AND o.NomeMuseo=m.NomeMuseo)
/* oppure */
SELECT *
FROM Musei m
WHERE m.Citta='Londra'
AND 'Tiziano'=ALL (SELECT o.NomeA FROM Opere o WHERE o.NomeMuseo=m.NomeMuseo)

/* 11. per ciascun artista, il nome dell'artista ed il numero di sue opere conservate alla "Galleria degli Uffizi" */
SELECT o.NomeA, COUNT(*) as NumeroOpere
FROM Opere o
WHERE o.NomeMuseo='Galleria degli Uffizi'
GROUP BY o.NomeA

/* 12. i musei che conservano almeno 20 opere di artisti italiani */
SELECT o.NomeMuseo, COUNT(*) as n
FROM Opere o, Artisti a
WHERE a.Nazionalita='IT'
AND o.NomeA=a.NomeA
GROUP BY o.NomeMuseo
HAVING COUNT(*)>1
/* oppure */
SELECT *
FROM Opere o, Artisti a
WHERE 2<=(SELECT COUNT(*) FROM Opere o, Artisti a WHERE o.NomeA=a.NomeA AND a.Nazionalita='IT' AND m.NomeMuseo=o.NomeMuseo)

/* 13. per le opere di artisti italiani che non hanno personaggi, 
il titolo dell'opera ed il nome dell'artista */
SELECT a.NomeA, o.Titolo
FROM Artisti a, Opere o
WHERE a.Nazionalita='IT'
AND p.Codice=o.Codice 
AND a.NomeA=o.NomeA
AND NOT EXISTS (SELECT * FROM Personaggi p WHERE p.Codice=o.Codice)

/* 14- Il nome dei musei di Londra che non conservano opere di artisti italiani, eccettuato Tiziano */
SELECT *
FROM Opere o, Musei m
WHERE o.NomeMuseo=m.NomeMuseo
AND m.Citta='Londra'
AND NOT EXISTS(SELECT *
            FROM Artisti a
            WHERE a.NomeArtista=o.NomeArtista
            AND a.NomeArtista<>'Tiziano' 
            AND a.Nazionalita='IT')


/* 15- Per ogni museo, il numero di opere divise per la nazionalità dell'artista */
SELECT o.NomeMuseo,a.Nazionalita, COUNT() AS nOpere
FROM Artisti a, Opere o
WHERE a.NomeArtista=o.NomeArtista
GROUP BY o.NomeMuseo,a.Nazionalita
ORDER BY o.NomeMuseo

UPDATE Artisti
SET Nazionalita='ES'
WHERE NomeArtista='Picasson'