CREATE TABLE Musei(
	NomeMuseo VARCHAR(30) NOT NULL PRIMARY KEY,
	Citta VARCHAR(30)
)

CREATE TABLE Artisti(
	NomeA varchar(20) PRIMARY KEY NOT NULL,
	Nazionalita varchar(3) NOT NULL
);

CREATE TABLE Opere(
	Codice int PRIMARY KEY NOT NULL,
	Titolo varchar(30) NOT NULL,
	NomeMuseo varchar(30) NOT NULL,
	NomeA varchar(20) NOT NULL,
	CONSTRAINT [FK_Opere_ToTable] FOREIGN KEY ([NomeMuseo]) REFERENCES [Musei]([NomeMuseo]),
	CONSTRAINT [FK_Opere_ToTable_1] FOREIGN KEY ([NomeA]) REFERENCES [Artisti]([NomeA])
);

CREATE TABLE Personaggi (
	Personaggio varchar(30) PRIMARY KEY NOT NULL,
	Codice int NOT NULL,
	CONSTRAINT [FK_Opere_ToTable_2] FOREIGN KEY ([Codice]) REFERENCES [Opere]([Codice])
);