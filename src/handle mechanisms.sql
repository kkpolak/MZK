create procedure DodajPracownika
(
    @id_typu_pracownika int,
    @imie nvarchar(30),
    @nazwisko nvarchar(30),
    @data_urodzenia date,
    @plec char,
    @data_zatrudnienia date,
    @pensja_podstawowa money,

    @var1 nvarchar(255) = null,
    @var2 nvarchar(255) = null,
    @var3 nvarchar(255) = null
)
as 
begin tran
    insert into Pracownicy values
    (
        @id_typu_pracownika, @imie, @nazwisko, @data_urodzenia,
        @plec, @data_zatrudnienia, @pensja_podstawowa
    )
        if @@error <> 0
            begin
            RAISERROR('Dodanie pracownika nie powiodlo sie', 16, 1)
            rollback
            end

        if @id_typu_pracownika = 1
            begin
            insert into PracownicyAdministracji values
            (SCOPE_IDENTITY(), convert(int, @var1))
            end

        else if @id_typu_pracownika = 2
            begin
            insert into Kierowcy values
            (SCOPE_IDENTITY(), convert(date, @var1), convert(bit, @var2))
            end

        else if @id_typu_pracownika = 3
            begin
            insert into Motorniczowie values
            (SCOPE_IDENTITY(), convert(date, @var1))
            end

        else if @id_typu_pracownika = 4
            begin
            insert into Serwisanci values
            (SCOPE_IDENTITY())
            end

        else if @id_typu_pracownika = 5
            begin
            insert into SerwisSprzatajacy values
            (SCOPE_IDENTITY(), convert(int, @var1))
            end

        if @@error <> 0
            begin
            RAISERROR('Dodanie pracownika nie powiodlo sie', 16, 1)
            rollback
            end
        else
            print 'Dodanie pracownika powiodlo sie'
commit


go
create trigger odpowiednieUprawnienia on Kursy
after insert
as 
begin
    declare @id int
    declare @wymagane int
    set @id = (select id_pracownika from inserted)
    set @wymagane = (select id_wymaganych_uprawnien from pojazdy
                     where id_pojazdu = (select id_pojazdu from inserted))


    if exists (select * from UprawnieniaKierujacychPojazdami
               where (id_pracownika = @id and @wymagane = id_uprawnien))
        commit
    else
    begin
        print('Kierowca nie posiada odpowiednich uprawnien')
        rollback
    end
end

go
create trigger wazneUprawnienia on Kursy
after insert 
as 
begin
    
    declare @id int
    declare @typ int
    declare @termin date

    set @id = (select id_pracownika from inserted)
    set @typ = (select id_typu_pracownika from inserted)

    if @typ = 2 --kierowca
    begin 
        set @termin = (select do_kiedy_badania from kierowcy
                       where id_pracownika = @id)
    end

    else if @typ = 3
    begin 
        set @termin = (select do_kiedy_badania from kierowcy
                       where id_pracownika = @id)
    end

    if @termin < (select data_wykonanania_kursu from inserted)
    begin
        print('Kierowca ma niewazne badania!')
        rollback
    end
    
end 


CREATE PROCEDURE DodajPojazdy
(
	@id_typu_pojazdu INT,
	@marka NVARCHAR(30),
	@model NVARCHAR(30),
	@rok_produkcji INT,
	@liczba_miejsc INT,
	@maksymalna_predkosc INT,
	@przebieg INT,
	@id_wymaganych_uprawnien INT,

    @var1 nvarchar(255) = null,
    @var2 nvarchar(255) = null,
    @var3 nvarchar(255) = null,
	@var4 nvarchar(255) = null
)
AS
BEGIN TRAN
    insert into Pojazdy values
    (
        @id_typu_pojazdu, @marka, @model, @rok_produkcji,
        @liczba_miejsc, @maksymalna_predkosc, @przebieg,
		@id_wymaganych_uprawnien
    )

        if @id_typu_pojazdu = 1
            begin
            print 'Dodanie pojazdu powiodlo sie'
            insert into Autobusy values
            (SCOPE_IDENTITY(), convert(int, @var1), convert(bit, @var2), convert(bit, @var3), convert(nvarchar(30), @var4))
            end

        else if @id_typu_pojazdu = 2
            begin
            print 'Dodanie pojazdu powiodlo sie'
            insert into Tramwaje values
            (SCOPE_IDENTITY(), convert(int, @var1), convert(BIT, @var2), convert(bit, @var3))
            end

        else if @id_typu_pojazdu = 3
            begin
            print 'Dodanie pojazdu powiodlo sie'
            insert into Trolejbusy values
            (SCOPE_IDENTITY(), convert(int, @var1), convert(int, @var2))
            end

        if @@error <> 0
		BEGIN
            RAISERROR('Dodanie pojazdu nie powiodlo sie', 16, 1)
			ROLLBACK
		END
COMMIT

DROP PROC DodajPojazdy

CREATE PROCEDURE UsunPojazd
(
	@id_pojazdu INT
)
AS
BEGIN TRAN
	DECLARE @type INT
	SET @type = (SELECT id_typu_pojazdu FROM Pojazdy WHERE id_pojazdu = @id_pojazdu)
	IF @type = 1
		DELETE FROM Autobusy WHERE id_pojazdu = @id_pojazdu
	ELSE IF @type = 2
		DELETE FROM Tramwaje WHERE id_pojazdu = @id_pojazdu
	ELSE IF @type = 3
		DELETE FROM Trolejbusy WHERE id_pojazdu = @id_pojazdu

	DELETE FROM Pojazdy WHERE id_pojazdu = @id_pojazdu
COMMIT

DROP PROC UsunPojazd

CREATE PROCEDURE ZmodyfikujPojazd
(
	@id_pojazdu INT,
	@marka NVARCHAR(30) = NULL,
	@model NVARCHAR(30) = NULL,
	@rok_produkcji INT = NULL,
	@liczba_miejsc INT = NULL,
	@maksymalna_predkosc INT = NULL,
	@przebieg INT = NULL,
	@id_wymaganych_uprawnien INT = NULL,

    @var1 nvarchar(255) = null,
    @var2 nvarchar(255) = null,
    @var3 nvarchar(255) = null,
	@var4 nvarchar(255) = null
)
AS
BEGIN TRAN
	DECLARE @type INT
	SET @type = (SELECT id_typu_pojazdu FROM Pojazdy WHERE id_pojazdu = @id_pojazdu)

	IF @marka IS NOT NULL
		UPDATE Pojazdy SET marka = @marka WHERE id_pojazdu = @id_pojazdu
	IF @model IS NOT NULL
		UPDATE Pojazdy SET model = @model WHERE id_pojazdu = @id_pojazdu
	IF @rok_produkcji IS NOT NULL
		UPDATE Pojazdy SET rok_produkcji = @rok_produkcji WHERE id_pojazdu = @id_pojazdu
	IF @liczba_miejsc IS NOT NULL
		UPDATE Pojazdy SET liczba_miejsc = @liczba_miejsc WHERE id_pojazdu = @id_pojazdu
	IF @maksymalna_predkosc IS NOT NULL
		UPDATE Pojazdy SET maksymlana_predkosc = @maksymalna_predkosc WHERE id_pojazdu = @id_pojazdu
	IF @przebieg IS NOT NULL
		UPDATE Pojazdy SET przebieg = @przebieg WHERE id_pojazdu = @id_pojazdu
	IF @id_wymaganych_uprawnien IS NOT NULL
		UPDATE Pojazdy SET id_wymaganych_uprawnien = @id_wymaganych_uprawnien WHERE id_pojazdu = @id_pojazdu

	IF @type = 1
		IF @var1 IS NOT NULL
			UPDATE Autobusy SET dlugosc = convert(int, @var1) WHERE id_pojazdu = @id_pojazdu
		IF @var2 IS NOT NULL
			UPDATE Autobusy SET czy_przegubowy = convert(bit, @var2) WHERE id_pojazdu = @id_pojazdu
		IF @var3 IS NOT NULL
			UPDATE Autobusy SET czy_pietrowy = convert(bit, @var3) WHERE id_pojazdu = @id_pojazdu
		IF @var4 IS NOT NULL
			UPDATE Autobusy SET wysokosc_podlogi = convert(nvarchar(30), @var4) WHERE id_pojazdu = @id_pojazdu
	ELSE IF @type = 2
		IF @var1 IS NOT NULL
			UPDATE Tramwaje SET ilosc_wagonow = convert(int, @var1) WHERE id_pojazdu = @id_pojazdu
		IF @var2 IS NOT NULL
			UPDATE Tramwaje SET miejsce_dla_rowerow = convert(BIT, @var2) WHERE id_pojazdu = @id_pojazdu
		IF @var3 IS NOT NULL
			UPDATE Tramwaje SET miejsce_dla_wozkow = convert(bit, @var3) WHERE id_pojazdu = @id_pojazdu
	ELSE IF @type = 3
		IF @var1 IS NOT NULL
			UPDATE Trolejbusy SET ilosc_miejsc_na_bagaze = convert(int, @var1) WHERE id_pojazdu = @id_pojazdu
		IF @var2 IS NOT NULL
			UPDATE Trolejbusy SET pojemnosc_baterii = convert(int, @var2) WHERE id_pojazdu = @id_pojazdu

	if @@error <> 0
		BEGIN
            RAISERROR('Modyfkowanie pojazdu nie powiodlo sie', 16, 1)
			ROLLBACK
		END
COMMIT

DROP PROC ZmodyfikujPojazd


DELETE FROM Autobusy
DELETE FROM Tramwaje
DELETE FROM Trolejbusy
DELETE FROM Pojazdy

SELECT * FROM Uprawnienia

INSERT INTO Parkingi VALUES (30, 'Czerwone Maki', 1)

SELECT * FROM Pojazdy
SELECT * FROM Autobusy
SELECT * FROM Tramwaje
SELECT * FROM Trolejbusy

DELETE FROM Pojazdy
DELETE FROM Autobusy

DROP TABLE Autobusy
DROP TABLE Tramwaje
DROP TABLE Trolejbusy
DROP TABLE Naprawy
DROP TABLE Pojazdy
DROP TABLE TypyPojazdow

CREATE FUNCTION calkowiteZarobki(@profesja NVARCHAR(30))
RETURNS INT
AS
BEGIN
	DECLARE @suma INT
	SET @suma = 0
	IF @profesja = convert(NVARCHAR(30), 'Administracja')
		BEGIN
			SELECT @suma = SUM(pensja_podstawowa) FROM Pracownicy WHERE id_typu_pracownika = 1
		END
	ELSE IF @profesja = convert(NVARCHAR(30), 'Kierowcy')
		BEGIN
			SELECT @suma = SUM(pensja_podstawowa) FROM Pracownicy WHERE id_typu_pracownika = 2
		END
	ELSE IF @profesja = convert(NVARCHAR(30), 'Motorniczowie')
		BEGIN
			SELECT @suma = SUM(pensja_podstawowa) FROM Pracownicy WHERE id_typu_pracownika = 3
		END
	ELSE IF @profesja = convert(NVARCHAR(30), 'Serwisanci')
		BEGIN
			SELECT @suma = SUM(pensja_podstawowa) FROM Pracownicy WHERE id_typu_pracownika = 4
		END
	ELSE IF @profesja = convert(NVARCHAR(30), 'Serwis')
		BEGIN
			SELECT @suma = SUM(pensja_podstawowa) FROM Pracownicy WHERE id_typu_pracownika = 5
		END

	RETURN @suma
END

CREATE FUNCTION srednieZarobki(@profesja NVARCHAR(30))
RETURNS INT
AS
BEGIN
	DECLARE @srednia INT
	SET @srednia = 0
	IF @profesja = convert(NVARCHAR(30), 'Administracja')
		BEGIN
			SELECT @srednia = AVG(pensja_podstawowa) FROM Pracownicy WHERE id_typu_pracownika = 1
		END
	ELSE IF @profesja = convert(NVARCHAR(30), 'Kierowcy')
		BEGIN
			SELECT @srednia = AVG(pensja_podstawowa) FROM Pracownicy WHERE id_typu_pracownika = 2
		END
	ELSE IF @profesja = convert(NVARCHAR(30), 'Motorniczowie')
		BEGIN
			SELECT @srednia = AVG(pensja_podstawowa) FROM Pracownicy WHERE id_typu_pracownika = 3
		END
	ELSE IF @profesja = convert(NVARCHAR(30), 'Serwisanci')
		BEGIN
			SELECT @srednia = AVG(pensja_podstawowa) FROM Pracownicy WHERE id_typu_pracownika = 4
		END
	ELSE IF @profesja = convert(NVARCHAR(30), 'Serwis')
		BEGIN
			SELECT @srednia = AVG(pensja_podstawowa) FROM Pracownicy WHERE id_typu_pracownika = 5
		END

	RETURN @srednia
END

CREATE FUNCTION calkowityPrzebieg(@pojazd NVARCHAR(30))
RETURNS INT
AS
BEGIN
	DECLARE @przebieg INT
	SET @przebieg = 0
	IF @pojazd = convert(NVARCHAR(30), 'Autobusy')
		BEGIN
			SELECT @przebieg = SUM(przebieg) FROM Pojazdy WHERE id_typu_pojazdu = 1
		END
	ELSE IF @pojazd = convert(NVARCHAR(30), 'Tramwaje')
		BEGIN
			SELECT @przebieg = SUM(przebieg) FROM Pojazdy WHERE id_typu_pojazdu = 2
		END
	ELSE IF @pojazd = convert(NVARCHAR(30), 'Trolejbusy')
		BEGIN
			SELECT @przebieg = SUM(przebieg) FROM Pojazdy WHERE id_typu_pojazdu = 3
		END

	RETURN @przebieg
END

CREATE FUNCTION sredniPrzebieg(@pojazd NVARCHAR(30))
RETURNS INT
AS
BEGIN
	DECLARE @przebieg INT
	SET @przebieg = 0
	IF @pojazd = convert(NVARCHAR(30), 'Autobusy')
		BEGIN
			SELECT @przebieg = AVG(przebieg) FROM Pojazdy WHERE id_typu_pojazdu = 1
		END
	ELSE IF @pojazd = convert(NVARCHAR(30), 'Tramwaje')
		BEGIN
			SELECT @przebieg = AVG(przebieg) FROM Pojazdy WHERE id_typu_pojazdu = 2
		END
	ELSE IF @pojazd = convert(NVARCHAR(30), 'Trolejbusy')
		BEGIN
			SELECT @przebieg = AVG(przebieg) FROM Pojazdy WHERE id_typu_pojazdu = 3
		END

	RETURN @przebieg
END

DROP FUNCTION calkowiteZarobki
DROP FUNCTION srednieZarobki
DROP FUNCTION calkowityPrzebieg
DROP FUNCTION sredniPrzebieg

PRINT dbo.calkowiteZarobki('Kierowcy')
PRINT dbo.srednieZarobki('Kierowcy')
PRINT dbo.calkowityPrzebieg('Autobusy')
PRINT dbo.sredniPrzebieg('Autobusy')

CREATE VIEW [Pracownicy Powyzej Sredniej] AS
SELECT * FROM Pracownicy
WHERE pensja_podstawowa > (SELECT AVG(pensja_podstawowa) FROM Pracownicy)

CREATE VIEW [Pojazdy Powyzej Sredniej] AS
SELECT * FROM Pojazdy
WHERE przebieg > (SELECT AVG(przebieg) FROM Pojazdy)

SELECT * FROM [Pracownicy Powyzej Sredniej]
SELECT * FROM [Pojazdy Powyzej Sredniej]

CREATE TRIGGER przebiegPojazdu
ON Pojazdy
AFTER UPDATE
AS
	DECLARE @wczesniejszyPrzebieg INT
	DECLARE @nowyPrzebieg INT
	SET @wczesniejszyPrzebieg = (SELECT przebieg FROM deleted)
	SET @nowyPrzebieg = (SELECT przebieg FROM inserted)
	IF @nowyPrzebieg < @wczesniejszyPrzebieg
		ROLLBACK

DROP TRIGGER przebiegPojazdu

CREATE TRIGGER zlyTypPojazdu
ON Pojazdy
INSTEAD OF INSERT
AS
	SELECT * FROM inserted
	DECLARE @insertedType INT
	SET @insertedType = (SELECT id_typu_pojazdu FROM inserted)
	IF @insertedType >= 3
		ROLLBACK

DROP TRIGGER zlyTypPojazdu





go
create procedure DodajPracownika
(
    @id_typu_pracownika int,
    @imie nvarchar(30),
    @nazwisko nvarchar(30),
    @data_urodzenia date,
    @plec char,
    @data_zatrudnienia date,
    @pensja_podstawowa money,

    @var1 nvarchar(255) = null,
    @var2 nvarchar(255) = null,
    @var3 nvarchar(255) = null
)
as 
begin
    insert into Pracownicy values
    (
        @id_typu_pracownika, @imie, @nazwisko, @data_urodzenia,
        @plec, @data_zatrudnienia, @pensja_podstawowa
    )

        if @id_typu_pracownika = 1
            begin
            print 'Dodanie pracownika powiodlo sie'
            insert into PracownicyAdministracji values
            (SCOPE_IDENTITY(), convert(int, @var1))
            end

        else if @id_typu_pracownika = 2
            begin
            print 'Dodanie pracownika powiodlo sie'
            insert into Kierowcy values
            (SCOPE_IDENTITY(), convert(int, @var1), convert(date, @var2), convert(bit, @var3))
            end

        else if @id_typu_pracownika = 3
            begin
            print 'Dodanie pracownika powiodlo sie'
            insert into Motorniczowie values
            (SCOPE_IDENTITY(), convert(date, @var1))
            end

        else if @id_typu_pracownika = 4
            begin
            print 'Dodanie pracownika powiodlo sie'
            insert into Serwisanci values
            (SCOPE_IDENTITY(), convert(int, @var1))
            end

        else if @id_typu_pracownika = 5
            begin
            print 'Dodanie pracownika powiodlo sie'
            insert into SerwisSprzatajacy values
            (SCOPE_IDENTITY(), convert(int, @var1))
            end

        if @@error <> 0
            RAISERROR('Dodanie pracownika nie powiodlo sie', 16, 1)
end



--PROCEDURY
go
create procedure DodajGodzineDoLinii
(
	@id_linii int,
	@id_przystanku int,
	@godzina1 int,
	@godzina2 int,
	@minuty varchar(3)
)
as 
begin tran
		declare @godzina time
		declare @tmp varchar(5)

        if (@godzina1 < 0 OR @godzina1 >24)
            begin
            print 'Dodanie do rozkladu nie powiodlo sie'
			rollback
            end

        else if (@godzina2 < 0 OR @godzina2 > 24)
            begin
            print 'Dodanie do rozkladu nie powiodlo sie'
			rollback
            end

        else if @godzina2 < @godzina1
            begin
			print 'Dodanie do rozkladu nie powiodlo sie'
			rollback
            end

        else
            begin
			while (@godzina1 <= @godzina2)
				begin
				 set @tmp = CONVERT(varchar(8), @godzina1)+@minuty
				 --print @tmp
				 insert into Linie values (@id_linii, @id_przystanku,CAST(@tmp as time))
				 set @godzina1 = @godzina1 + 1
				end
				print 'Dodanie do rozkladu powiodlo sie'
            end
commit
go
drop procedure DodajGodzineDoLinii
