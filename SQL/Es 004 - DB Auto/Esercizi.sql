-- 1- Targa e Marca delle Auto di cilindrata superiore a 2000 cc o di potenza superiore a 120 CV
SELECT a.Targa, a.Marca
FROM Autom a
WHERE (a.Cilindrata>2000 OR a.Potenza>120)

-- 2- Nome del proprietario e Targa delle Auto di cilindrata superiore a 2000 cc oppure di potenza superiore a 120 CV
SELECT p.Nome, a.Targa
FROM Autom a, Proprietari p
WHERE a.CodF=p.CodF
AND (a.Cilindrata>2000 OR a.Potenza>120)

-- 3- Targa e Nome del proprietario delle Auto di cilindrata superiore a 2000 cc oppure di potenza superiore a 120 CV, assicurate presso la “SARA”
SELECT * 
FROM Autom a, Proprietari p, Assicurazioni ass
WHERE a.CodF=p.CodF
AND a.CodAss=ass.CodAss
AND ass.Nome='SARA'
AND (a.Cilindrata>2000 OR a.Potenza>120)

-- 4- Targa e Nome del proprietario delle Auto assicurate presso la “SARA” e coinvolte in sinistri il 20/01/02
SELECT a.Targa, p.Nome
FROM Autom a, Proprietari p, Assicurazioni ass, Autocoinvolte ac, Sinistro s
WHERE a.CodF = p.CodF
AND a.CodAss = ass.CodAss
AND ass.Nome = 'SARA'
AND ac.CodS = s.CodS
AND s.DataS = '2002-01-20'


-- 5- Per ciascuna Assicurazione, il nome, la sede ed il numero di auto assicurate
SELECT ass.Nome, ass.Sede, COUNT(*) AS NumAutoAss
FROM Assicurazioni ass, Autom a
WHERE ass.CodAss=a.CodAss
GROUP BY ass.Nome, ass.Sede, a.CodAss