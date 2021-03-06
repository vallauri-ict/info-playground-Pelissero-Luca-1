CREATE TABLE Proprietari (
	CodF INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Nome VARCHAR(20) NOT NULL,
	Residenza VARCHAR(30) NOT NULL
);

CREATE TABLE Assicurazioni (
	CodAss INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Nome VARCHAR(20) NOT NULL,
	Sede VARCHAR(20) NOT NULL
);

CREATE TABLE Sinistro (
	CodS INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Localita VARCHAR(30) NOT NULL,
	DataS VARCHAR(30) NOT NULL
);

CREATE TABLE Autom (
	Targa INT PRIMARY KEY NOT NULL,
	Marca VARCHAR(10) NOT NULL,
	Cilindrata INT NOT NULL,
	Potenza INT NOT NULL,
	CodF INT NOT NULL,
	FOREIGN KEY (CodF) REFERENCES Proprietari (CodF),
	CodAss INT NOT NULL,
    FOREIGN KEY (CodAss) REFERENCES Assicurazioni (CodAss)
);

CREATE TABLE AutoCoinvolte (
	CodS INT NOT NULL,
	Targa VARCHAR(7) NOT NULL,
	PRIMARY KEY(CodS, Targa),
	FOREIGN KEY (CodS) REFERENCES Sinistro (CodS),
	FOREIGN KEY (Targa) REFERENCES Autom (Targa),
	ImportoDelDanno INT NOT NULL
);