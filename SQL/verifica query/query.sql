/* 1 */
SELECT f.titolo
FROM Film f
WHERE f.regista = (SELECT f1.regista FROM Film f1 WHERE f1.titolo = 'Casablanca')

/* 2 */
SELECT DISTINCT f.titolo
FROM Film f, Recita r, Attori a
WHERE a.codAttore = r.codAttore 
AND r.codFilm=f.codFilm
AND a.nome='S. Loren' OR a.nome='M. Mastroianni'

/* 3 */
SELECT DISTINCT f.titolo, f.genere
FROM Film f, Sale s, Proiezioni p
WHERE f.codFilm = p.codFilm 
AND p.codSala = s.codSala
AND p.dataProiezione = '25-12-2004'

/* 4 */
SELECT f.titolo, f.regista
FROM Film f, Attori a, Recita r
WHERE a.codAttore=r.codAttore
AND f.codFilm=r.codFilm
GROUP BY f.titolo, f.regista
HAVING COUNT(*)<6

/* 5 */
SELECT f.titolo
FROM Film f, Proiezioni p
WHERE f.codFilm=p.codFilm
AND NOT EXISTS(SELECT * FROM Sale s	WHERE s.codSala=p.codFilm AND s.citta='Pisa')

/* 6 */
SELECT DISTINCT a.nome 
FROM Attori a, Recita r
WHERE a.codAttore=r.codAttore
AND a.nazionalita='IT'
AND NOT EXISTS(SELECT * FROM Film F WHERE f.codFilm=r.codFilm AND f.regista='Fellini')