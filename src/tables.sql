create table TypyPracownikow
(
    id_typu_pracownika int primary key,
    typ_pracownika nvarchar(50) not null
)

create table Pracownicy
(
    id_pracownika int primary key identity(1, 1),
    id_typu_pracownika int references TypyPracownikow(id_typu_pracownika),
    imie nvarchar(30) not null,
    nazwisko nvarchar(30)not null,
    data_urodzenia date not null,
    plec char not null,
    data_zatrudnienia date not null,
    pensja_podstawowa money not null,

    check (plec = 'M' or plec = 'K'),
    check (pensja_podstawowa >= 2500),
    check (year(getdate()) - year(data_urodzenia) >= 18),

    constraint typ_pracownika_cs unique (id_pracownika, id_typu_pracownika)
)

alter table pracownicy
add constraint pracownicy_pelnoletni_ck
check (datediff(year, data_urodzenia, data_zatrudnienia) >= 18)

create table PracownicyAdministracji
(
    id_pracownika int primary key,
    id_typu_pracownika as 1 persisted,

    id_biura int,

    foreign key (id_biura) references Biura(id_biura),
    foreign key (id_pracownika, id_typu_pracownika) references Pracownicy(id_pracownika, id_typu_pracownika)
)

create table Kierowcy
(
    id_pracownika int primary key,
    id_typu_pracownika as 2 persisted,

    do_kiedy_badania date,
    czy_wada_wzroku bit,

    foreign key (id_pracownika, id_typu_pracownika) references Pracownicy(id_pracownika, id_typu_pracownika)
)

create table Motorniczowie
(
    id_pracownika int primary key,
    id_typu_pracownika as 3 persisted,

    do_kiedy_badania date,

    foreign key (id_pracownika, id_typu_pracownika) references Pracownicy(id_pracownika, id_typu_pracownika)    
)

create table Serwisanci
(
    id_pracownika int primary key,
    id_typu_pracownika as 4 persisted,

    foreign key (id_pracownika, id_typu_pracownika) references Pracownicy(id_pracownika, id_typu_pracownika)
)

create table SerwisSprzatajacy
(
    id_pracownika int primary key,
    id_typu_pracownika as 5 persisted,

    id_obslugiwanego_biura int,

    foreign key (id_pracownika, id_typu_pracownika) references Pracownicy(id_pracownika, id_typu_pracownika)
)

create table Certyfikaty
(
    id_certyfikatu int primary key,
    opis_certyfikatu nvarchar(256)
)

create table CertyfikatySerwisantow
(
    id_pracownika int,
    id_certyfikatu int, 
    do_kiedy date

    primary key(id_pracownika, id_certyfikatu),
    foreign key (id_certyfikatu) references Certyfikaty(id_certyfikatu)
)


create table Uprawnienia
(
    id_uprawnien int primary key,
    kod_uprawnien nvarchar(10),
    opis_uprawnien nvarchar(50),
    wymagany_wiek int
)

create table Biura
(
    id_biura int primary key,
    adres nvarchar(50),
    telefon nvarchar(12),
)

create table UprawnieniaKierujacychPojazdami
(
    id_uprawnien int,
    id_pracownika int, 
    do_kiedy date,

    primary key(id_uprawnien, id_pracownika),
    foreign key (id_pracownika) references Pracownicy(id_pracownika),
    foreign key (id_uprawnien) references uprawnienia(id_uprawnien)
)

CREATE TABLE TypyPojazdow (id_typu_pojazdu INT PRIMARY KEY IDENTITY(1, 1), typ_pojazdu NVARCHAR(30))

INSERT INTO TypyPojazdow VALUES ('Autobus'), ('Tramwaj'), ('Trolejbus')

CREATE TABLE Pojazdy (
	id_pojazdu INT PRIMARY KEY IDENTITY(1, 1),
	id_typu_pojazdu INT REFERENCES TypyPojazdow(id_typu_pojazdu),
	marka NVARCHAR(30),
	model NVARCHAR(30),
	rok_produkcji INT,
	liczba_miejsc INT,
	maksymlana_predkosc INT,
	przebieg INT,
	id_wymaganych_uprawnien INT,

	FOREIGN KEY (id_wymaganych_uprawnien) REFERENCES Uprawnienia(id_uprawnien),
	CONSTRAINT typ_pojazdu_cs UNIQUE (id_pojazdu, id_typu_pojazdu)
)

CREATE TABLE Autobusy (
	id_pojazdu INT PRIMARY KEY,
	id_typu_pojazdu AS 1 PERSISTED,
	dlugosc INT,
	czy_przegubowy BIT,
	czy_pietrowy BIT,
	wysokosc_podlogi NVARCHAR(30),

	FOREIGN KEY (id_pojazdu, id_typu_pojazdu) REFERENCES Pojazdy(id_pojazdu, id_typu_pojazdu)
)

CREATE TABLE Tramwaje (
	id_pojazdu INT PRIMARY KEY,
	id_typu_pojazdu AS 2 PERSISTED,
	ilosc_wagonow INT,
	miejsce_dla_rowerow BIT,
	miejsce_dla_wozkow BIT,
	
	FOREIGN KEY (id_pojazdu, id_typu_pojazdu) REFERENCES Pojazdy(id_pojazdu, id_typu_pojazdu)
)

CREATE TABLE Trolejbusy (
	id_pojazdu INT PRIMARY KEY,
	id_typu_pojazdu AS 3 PERSISTED,
	ilosc_miejsc_na_bagaze INT,
	pojemnosc_baterii INT,

	FOREIGN KEY (id_pojazdu, id_typu_pojazdu) REFERENCES Pojazdy(id_pojazdu, id_typu_pojazdu)
)

CREATE TABLE Naprawy (
	id_naprawy INT PRIMARY KEY IDENTITY(1, 1),
	id_pojazdu INT,
	id_pracownika INT,
	czas_rozpoczecia_naprawy DATE,
	czas_zakonczenia_naprawy DATE,
	opis_usterki NVARCHAR(255),

	FOREIGN KEY (id_pojazdu) REFERENCES Pojazdy(id_pojazdu),
	FOREIGN KEY (id_pracownika) REFERENCES Serwisanci(id_pracownika)
)

CREATE TABLE TypyBiletow (
	id_typu_biletu INT PRIMARY KEY IDENTITY(1, 1),
	typ_biletu NVARCHAR(30),
	cena_biletu INT,
	czy_ulgowy BIT
)

CREATE TABLE Uzytkownicy (
	id_uzytkownika INT PRIMARY KEY IDENTITY(1, 1),
	nazwa_uzytkownina NVARCHAR(30),
	haslo_uzytkownika NVARCHAR(30),
	email_uzytkownika NVARCHAR(30),
	data_urodzenia DATE
)

CREATE TABLE SprzedazBiletow (
	id_sprzedazy INT PRIMARY KEY IDENTITY(1, 1),
	id_uzytkownika INT,
	id_typu_biletu INT,
	data_sprzedazy DATE,

	FOREIGN KEY (id_uzytkownika) REFERENCES Uzytkownicy(id_uzytkownika),
	FOREIGN KEY (id_typu_biletu) REFERENCES TypyBiletow(id_typu_biletu)
)

CREATE TABLE Parkingi (
	id_parkingu INT PRIMARY KEY IDENTITY(1, 1),
	ilosc_miejsc_postojowych INT,
	adres_parking NVARCHAR(30),
	id_strefy TINYINT,
	FOREIGN KEY (id_strefy) REFERENCES Strefy(id_strefy)
)

CREATE TABLE Postoje (
	id_parkingu INT,
	id_pojazdu INT,
	czas_rozpoczecia_postoju DATE,
	czas_zakonczenia_postoju DATE,

	FOREIGN KEY (id_parkingu) REFERENCES Parkingi(id_parkingu),
	FOREIGN KEY (id_pojazdu) REFERENCES Pojazdy(id_pojazdu),
	PRIMARY KEY (id_parkingu, id_pojazdu, czas_rozpoczecia_postoju),

	CONSTRAINT Czas_CK CHECK (czas_rozpoczecia_postoju < czas_zakonczenia_postoju)
)

create table TypyPracownikow
(
    id_typu_pracownika int primary key,
    typ_pracownika nvarchar(50) not null
)

create table Pracownicy
(
    id_pracownika int primary key identity(1, 1),
    id_typu_pracownika int references TypyPracownikow(id_typu_pracownika),
    imie nvarchar(30) not null,
    nazwisko nvarchar(30)not null,
    data_urodzenia date not null,
    plec char not null,
    data_zatrudnienia date not null,
    pensja_podstawowa money not null,

    check (plec = 'M' or plec = 'K'),
    check (pensja_podstawowa >= 2500),
    check (year(getdate()) - year(data_urodzenia) >= 18),

    constraint typ_pracownika_cs unique (id_pracownika, id_typu_pracownika)
)


create table PracownicyAdministracji
(
    id_pracownika int primary key,
    id_typu_pracownika as 1 persisted,

    id_biura int,

    foreign key (id_pracownika, id_typu_pracownika) references Pracownicy(id_pracownika, id_typu_pracownika)
)

create table Kierowcy
(
    id_pracownika int primary key,
    id_typu_pracownika as 2 persisted,

    id_uprawnien int,
    do_kiedy_badania date,
    czy_wada_wzroku bit,

    foreign key (id_uprawnien) references Uprawnienia(id_uprawnien),
    foreign key (id_pracownika, id_typu_pracownika) references Pracownicy(id_pracownika, id_typu_pracownika)
)

create table Motorniczowie
(
    id_pracownika int primary key,
    id_typu_pracownika as 3 persisted,

    do_kiedy_badania date,

    foreign key (id_pracownika, id_typu_pracownika) references Pracownicy(id_pracownika, id_typu_pracownika)    
)

create table Serwisanci
(
    id_pracownika int primary key,
    id_typu_pracownika as 4 persisted,

    id_uprawnienia int,

    foreign key (id_uprawnienia) references UprawnieniaSerwisantow(id_uprawnienia),
    foreign key (id_pracownika, id_typu_pracownika) references Pracownicy(id_pracownika, id_typu_pracownika)
)


create table SerwisSprzatajacy
(
    id_pracownika int primary key,
    id_typu_pracownika as 5 persisted,

    id_obslugiwanego_biura int,

    foreign key (id_pracownika, id_typu_pracownika) references Pracownicy(id_pracownika, id_typu_pracownika)
)

create table UprawnieniaSerwisantow
(
    id_uprawnienia int primary key,
    opis_uprawnienia nvarchar(256)
)

create table Uprawnienia
(
    id_uprawnien int primary key,
    kod_uprawnien nvarchar(10),
    opis_uprawnien nvarchar(50),
    wymagany_wiek int
)

CREATE TABLE Przystanki(
	id_przystanku int primary key identity (1,1),
	id_strefy tinyint,
	foreign key (id_strefy) references Strefy(id_strefy),
    nazwa_przystanku nvarchar(75),
    adres_przystnaku nvarchar(75)
	)

CREATE TABLE Biletomaty(
	id_biletomatu int primary key identity (1,1),
	id_przystanku int,
	czy_pusty bit,
	foreign key (id_przystanku) References Przystanki(id_przystanku),
	)

CREATE TABLE Komunikaty(
	id_komunikatu int primary key identity (1,1),
	id_przystanku int, 
	tresc_komunikatu nvarchar(255),
	foreign key (id_przystanku) References Przystanki(id_przystanku),
	)
 
CREATE TABLE LinieInfo(
	id_linii int primary key,
	id_przystanek_poczatkowy int not null,
	id_przystanek_koncowy int not null,
	)

CREATE TABLE Strefy(
	id_strefy tinyint primary key,
	CONSTRAINT ck_id_strefy check(id_strefy = 1 OR id_strefy = 2)
)

CREATE TABLE Linie(
    id_linii int,
    id_przystanku int,
    godzina time,
	foreign key (id_linii) references LinieInfo(id_linii),
	Primary key(id_linii,id_przystanku,godzina),
	foreign key (id_przystanku) references Przystanki(id_przystanku)
	)

CREATE TABLE BiletyKrotkoTerminowe(
	id_biletu int,
	typ_biletu nvarchar(50),
	cena_bieltu int,
	ilosc_minut int
	--czas_trawania minutes
)
