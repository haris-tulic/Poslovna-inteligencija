USE Tecajevi_Ispit
GO

ALTER TABLE odrzavanje
ADD god_pocetka AS YEAR(DatumPocetka) PERSISTED 
GO
SELECT *
FROM odrzavanje
GO

ALTER TABLE polaznik
ADD god_rodjenja AS YEAR(DatumRodjenja) PERSISTED
GO
SELECT *
FROM polaznik
GO

CREATE TABLE polaznik_detalji (
	PolaznikID int NOT NULL,
	Spol nvarchar(1),
	DatumRodjenja date,
	UstanovaID int,
	NazivGrada nvarchar(50),
	NazivZupanije nvarchar(50),
	NazivTipaPolaznika nvarchar(50),
	CONSTRAINT PK_polaznik_detalji PRIMARY KEY (PolaznikID),
	CONSTRAINT FK_polaznik_detalji_polaznik FOREIGN KEY (PolaznikID)
		REFERENCES polaznik (PolaznikID)
)
GO

INSERT INTO polaznik_detalji
SELECT p.PolaznikID, p.Spol, p.DatumRodjenja, p.UstanovaID,
		g.NazivGrada, z.NazivZupanije, tp.NazivTipaPolaznika
FROM polaznik p
JOIN grad g ON p.GradID = g.GradID
JOIN zupanija z ON g.ZupanijaID = z.ZupanijaID
JOIN tip_polaznika tp ON  p.TipPolaznikaID = tp.TipPolaznikaID
GO
SELECT *
FROM polaznik_detalji
GO
