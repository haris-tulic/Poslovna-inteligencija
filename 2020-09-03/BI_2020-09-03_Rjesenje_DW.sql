CREATE DATABASE Ispit_2020_09_03
GO
USE Ispit_2020_09_03
GO

CREATE TABLE dim_polaznik_detalji (
	dim_polaznik_detalji_key int IDENTITY(1, 1),
	polaznikID int NOT NULL,
	spol nvarchar(1),
	datumRodjenja date,
	ustanovaID int,
	nazivGrada nvarchar(50),
	nazivZupanije nvarchar(50),
	nazivTipaPolaznik nvarchar(50),
	CONSTRAINT PK_dim_polaznik_detalji PRIMARY KEY (dim_polaznik_detalji_key)
)
GO

CREATE TABLE dim_ocjena (
	dim_ocjena_key int IDENTITY(1, 1),
	polaznikID int NOT NULL,
	ocjenaPohadjanja int,
	nazivTecaja nvarchar(100),
	datumPocetka date,
	god_pocetka int,
	CONSTRAINT PK_dim_ocjena PRIMARY KEY (dim_ocjena_key)
)
GO

CREATE TABLE dim_redovnost (
	dim_redovnost_key int IDENTITY(1, 1),
	polaznikID int,
	datumPohadjanja date,
	prisutan int,
	CONSTRAINT PK_dim_redovnost PRIMARY KEY (dim_redovnost_key)
)
GO

CREATE TABLE fact_polaznik (
	fact_polaznik_key int IDENTITY(1, 1),
	polaznikID int,
	dim_polaznik_detalji_key int,
	dim_ocjena_key int,
	dim_redovnost_key int,
	CONSTRAINT PK_fact_polaznik PRIMARY KEY (fact_polaznik_key),
	CONSTRAINT FK_fact_polaznik_dim_polaznik_detalji FOREIGN KEY (dim_polaznik_detalji_key)
		REFERENCES dim_polaznik_detalji (dim_polaznik_detalji_key),
	CONSTRAINT FK_fact_polaznik_dim_ocjena FOREIGN KEY (dim_ocjena_key)
		REFERENCES dim_ocjena (dim_ocjena_key),
	CONSTRAINT FK_fact_polaznik_dim_redovnost FOREIGN KEY (dim_redovnost_key)
		REFERENCES dim_redovnost (dim_redovnost_key)
)
GO

SELECT *
FROM dim_polaznik_detalji
GO

SELECT *
FROM dim_ocjena
GO

SELECT * 
FROM dim_redovnost
GO

SELECT *
FROM fact_polaznik
GO
