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

/* 10. Il nome dei musei di Londra che non hanno opere di Tiziano */
SELECT m.NomeMuseo
FROM Musei m
WHERE m.Citta='Londra'
AND EXISTS (SELECT * FROM Opere o WHERE o.NomeA='Tiziano' AND o.NomeMuseo=m.NomeMuseo)

/* 11. per ciascun artista, il nome dell'artista ed il numero di sue opere conservate alla "Galleria degli Uffizi" */
SELECT o.NomeA, COUNT(*) as NumeroOpere
FROM Opere o 
WHERE o.NomeMuseo='Galleria degli Uffizi'

/* 12. i musei che conservano almeno 20 opere di artisti italiani */
SELECT o.NomeMuseo
FROM Opere o, Artisti a
WHERE a.Nazionalita='IT'
AND o.NomeA=a.NomeA
HAVING COUNT()>19

/* 13. per le opere di artisti italiani che non hanno personaggi, 
il titolo dell'opera ed il nome dell'artista */
SELECT a.NomeA, o.Titolo
FROM Artisti a, Personaggi p, Opere o
WHERE a.Nazionalita='IT'
AND p.Personaggio=NULL
AND p.Codice=o.Codice 
AND a.NomeA=o.NomeA

/* 14. il nome dei musei di londra che non conservano opere di artisti italiani,
eccettuato Tiziano */
SELECT o.NomeMuseo
FROM Opere o, Musei m, Artisti a
WHERE m.Citta='Londra'
AND o.NomeMuseo=m.NomeMuseo
AND a.nazionalità<>'IT'
AND a.NomeA=o.NomeA
AND NOT EXISTS (SELECT * FROM Opere o WHERE o.NomeA='Tiziano' AND o.NomeA=a.NomeA)

/* 15. per ogni museo, il numero di opere divise per nazionalità della'artista */