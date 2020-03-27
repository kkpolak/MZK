insert into TypyPracownikow VALUES
(1, 'administracja'),
(2, 'kierowca'),
(3, 'motorniczy'),
(4, 'serwisant'),
(5, 'serwis sprzatajacy')

insert into Uprawnienia values 
(1, 'B', 'samochody osobowe do 3,5 tony', 18),
(2, 'B+E', 'samochody osobowe z przyczepa do 3,5 tony lacznie', 18),
(3, 'C', 'samochody ciezarowe powyzej 3,5 tony', 21),
(4, 'D', 'autobus', 24),
(5, 'D+E', 'autobus + przyczepa', 24),
(6, 'T', 'tramwaj', 21),
(7, 'TB', 'Trolejbus', 24)

insert into Biura values
(1, 'Pogodna 15', '372819473'),
(2, 'Zwirowa 19', '635213792')

insert into TypyPracownikow VALUES
(1, 'administracja'),
(2, 'kierowca'),
(3, 'motorniczy'),
(4, 'serwisant'),
(5, 'serwis sprzatajacy')


insert into uprawnienia values 
(1, 'B', 'samochody osobowe do 3,5 tony', 18),
(2, 'B+E', 'samochody osobowe z przyczepa do 3,5 tony lacznie', 18),
(3, 'C', 'samochody ciezarowe powyzej 3,5 tony', 21),
(4, 'D', 'autobus', 24),
(5, 'D+E', 'autobus + przyczepa', 24),
(6, 'T', 'tramwaj', 21)


INSERT INTO Naprawy VALUES (10, 21, '2012-10-25', '2012-10-27', 'Wymiana opon')
INSERT INTO Naprawy VALUES (12, 20, '2014-10-25', '2014-10-27', 'Wymiana oleju silnikowego')
INSERT INTO Naprawy VALUES (14, 22, '2016-10-25', '2016-10-27', 'Naprawa poduszki powietrza')

INSERT INTO Postoje VALUES(1, 12, '2016-10-25', '2016-10-27')
INSERT INTO Postoje VALUES(2, 14, '2017-10-25', '2017-10-27')
INSERT INTO Postoje VALUES(1, 16, '2018-10-25', '2018-10-27')
INSERT INTO Postoje VALUES(2, 18, '2019-10-25', '2019-10-27')
INSERT INTO Postoje VALUES(1, 20, '2020-10-25', '2020-10-27')


exec DodajPracownika 1, 'Janina', 'Nowak', '1977-09-13', 'K', '1999-10-11', 2800, 1
exec DodajPracownika 1, 'Stanislaw', 'Kowalski', '1965-11-10', 'M', '2003-11-10', 3500, 1
exec DodajPracownika 1, 'Pawel', 'Baran', '1983-03-19', 'M', '2007-11-15', 8700, 2
exec DodajPracownika 1, 'Gawel', 'Gwozdz', '1978-10-23', 'M', '1997-02-01', 3800, 2

exec DodajPracownika 2, 'Marian', 'Pazdzioch', '1964-06-01', 'M', '1986-06-03', 4500, '2030-01-01', 1
exec DodajPracownika 2, 'Jan', 'Widera', '1990-10-10', 'M', '2008-11-07', 3400, '2020-01-01', 0
exec DodajPracownika 2, 'Maria', 'Polak', '1998-05-08', 'K', '2019-02-03', 2500, '2025-01-01', 0  
exec DodajPracownika 2, 'Stanislaw', 'Bujakowski', '1975-03-30', 'M', '2000-02-03', 2600, '2025-01-01', 1  
exec DodajPracownika 2, 'Marta', 'Niemiec', '1977-05-08', 'K', '2005-02-03', 4000, '2030-01-01', 1 
exec DodajPracownika 2, 'Jozef', 'Janusz', '2001-04-18', 'M', '2020-01-20', 2500, '2025-01-01', 0  
exec DodajPracownika 2, 'Eustachy', 'Piorun', '1968-09-12', 'M', '2004-09-11', 6800, '2028-01-01', 1  
exec DodajPracownika 2, 'Wieslaw', 'Walczak', '2000-01-02', 'M', '2018-05-03', 2500, '2030-01-01', 0  
exec DodajPracownika 2, 'Zofia', 'Kasprzak', '1979-11-18', 'K', '1998-01-15', 4500, '2035-01-01', 1  

exec DodajPracownika 3, 'Karol', 'Krawczyk', '1969-12-18', 'M', '1990-03-19', 4500, '2035-01-01'
exec DodajPracownika 3, 'Tadeusz', 'Norek', '1970-05-20', 'M', '1992-04-10', 4000, '2040-01-01'
exec DodajPracownika 3, 'Stanislaw', 'Wesolowski', '1957-01-10', 'M', '1982-04-10', 5000, '2025-01-01'
exec DodajPracownika 3, 'Marian', 'Szkatulka', '1970-04-13', 'M', '1989-06-19', 4700, '2030-01-01'


exec DodajPracownika 4, 'Zenon', 'Krasnal', '1999-03-25', 'M', '2019-04-15', 2700
exec DodajPracownika 4, 'Jozef', 'Panek', '1970-08-13', 'M', '1989-02-15', 4700
exec DodajPracownika 4, 'Mariusz', 'Autobusowy', '1990-09-30', 'M', '2011-09-11', 4000

exec DodajPracownika 5, 'Genowefa', 'Stara', '1950-03-01', 'K', '1970-04-18', 2700, 1
exec DodajPracownika 5, 'Stanislaw', 'Stary', '1951-07-29', 'M', '1970-04-18', 2700, 2

EXEC DodajPojazdy 1, 'Solaris', 'Urbino 18', 2010, 30, 90, 100000, 4, 18, 1, 0, 'niska'
EXEC DodajPojazdy 1, 'Solibus', 'N4522', 2012, 45, 100, 120000, 4, 20, 1, 0, 'srednia'
EXEC DodajPojazdy 1, 'Kapena', 'Agora S', 2015, 70, 110, 90000, 4, 19, 1, 0, 'wysoka'
EXEC DodajPojazdy 1, 'Ikarus', '280', 2001, 40, 80, 230000, 4, 25, 0, 0, 'niska'
EXEC DodajPojazdy 1, 'Opatre', 'Solo', 2014, 50, 70, 300000, 4, 21, 0, 0, 'srednia'

EXEC DodajPojazdy 2, 'Alstom', 'K20', 2007, 100, 50, 270000, 6, 2, 1, 1
EXEC DodajPojazdy 2, 'Pesa', 'Pm36', 2004, 90, 40, 410000, 6, 2, 0, 0
EXEC DodajPojazdy 2, 'Rastatt', 'GT8', 2011, 110, 60, 310000, 6, 2, 1, 1
EXEC DodajPojazdy 2, 'Modertrans', '500', 2015, 100, 60, 245000, 6, 1, 1, 1
EXEC DodajPojazdy 2, 'Newag', 'Swing', 2017, 120, 70, 110000, 6, 2, 1, 1

EXEC DodajPojazdy 3, 'Solingen', '120MT', 2005, 50, 100, 170000, 7, 20, 150
EXEC DodajPojazdy 3, 'Solaris', 'Trollino', 2016, 70, 110, 70000, 7, 50, 200
EXEC DodajPojazdy 3, 'Jelcz', 'PR110E', 2000, 40, 40, 370000, 7, 30, 120
EXEC DodajPojazdy 3, 'Linz', 'ER100H', 2012, 60, 60, 190000, 7, 40, 160
EXEC DodajPojazdy 3, 'Irisbus', 'Berlieta', 2010, 50, 60, 210000, 7, 60, 240

INSERT INTO TypyBiletow VALUES
('miesieczny', 30, 1),
('miesieczny', 70, 0),
('kwartalny', 80, 1),
('kwartalny', 150, 0),
('semestralny', 300, 1),
('roczny', 350, 0)

insert into UprawnieniaKierujacychPojazdami values
(1, 5, '2030-01-01'),
(1,	6, '2020-01-01'),
(1,	7, '2025-01-01'),
(1,	8, '2025-01-01'),
(1,	9, '2030-01-01'),
(1,	10, '2025-01-01'),
(1,	11, '2028-01-01'),
(1,	12, '2030-01-01'),
(1,	13, '2035-01-01'), 
(1,	14, '2030-01-01'),
(1,	15, '2030-01-01'),
(1,	16, '2030-01-01'), --prawo jazdy B dla wszystkich

(4, 5, '2030-01-01'),
(4,	6, '2020-01-01'),
(4,	7, '2025-01-01'),
(5,	8, '2025-01-01'),
(5,	9, '2030-01-01'),
(7,	10, '2025-01-01'),
(7,	11, '2028-01-01'),
(7,	12, '2030-01-01'),
(7,	13, '2035-01-01'),  --autobusy + trolejbusy

(6, 14, '2035-01-01'),
(6, 15, '2040-01-01'),
(6, 16, '2025-01-01'),
(6, 17, '2030-01-01') --motornicznowie


select * from pracownicy 
select * from Kierowcy
select * from Motorniczowie

select * from Uprawnienia
select * from UprawnieniaKierujacychPojazdami
select * from Kierowcy

DBCC CHECKIDENT ('Pracownicy', RESEED, 21); 

--PRZYSTANKI
insert into Przystanki values
--STREFA 1
(1,'Pod Fortem', 'Sloneczna 21'),
(1,'Kliny Zacisze', 'Sloneczna 43'),
(1,'Borkowska', 'Borkowska 11'),
(1,'Komuny Paryskiej', 'Zawila 13'),
(1,'Skosna', 'Skosna 1'),
(1,'Lubostron', 'Skosna 48'),
(1,'Torfowa', 'Torfowa 3'),
(1,'Zachodnia', 'Zachodnia 40'),
(1, 'Rostworowskiego', 'Rostworowskiego 2'),
(1, 'Grota-Roweckiego', 'Generała Stefana Grota-Roweckiego 3'),
(1, 'Lipińskiego', 'Generała Stefana Grota-Roweckiego 99'),
(1, 'Kobierzyńska', 'Kobierzyńska 27'),
(1, 'Slomiana', 'Kapelanka 12'),
(1, 'Szwedzka', 'Szwedzka 23'),
(1, 'Jubilat', 'Aleja Zygmunta Krasinskiego 4'),
(1, 'Muzeum Narodowe', 'Marszałka Jozefa Pilsudskiego 1'),
(1, 'Czarnowiejska' , 'Czarnowiejska 56'),
(1, 'Kawiory', 'Kawiory 21'),
(1, 'Przybyszewskiego', 'Armii Krajowej 1'),
(1, 'Piaskowa', 'Ulica Jozefa Chelmobskiego 5'),
(1,'Bieżanowska','Aleja Adolfa Dygasinskiego'),
(1,'Malborska','Malborska 6'),
(1,'Makowa','Makowa 9'),
(1,'Kamienskiego','Kamienskiego 13'),
(1,'Rondo Matecznego','Kalwaryjska 96'),
(1,'Biprostal','Krolewska 55'),
(1,'Stachiewicza','Piotra Stachiewicza 45a'),
(1,'Pradnik Bialy Zachod','Adama Vetulaniego 101'),
--STREFA 2
(2,'Nalkowskiej','Nalkowskiej 2'),
(2,'Warchalowskiego','Mieczyslawa Wrony 52'),
(2,'Petrazyckiego','Leona Petrazyckiego 61'),
(2,'Libertowska','Leona Petrazyckiego 48'),
(2,'Petrazyckiego Osiedle','Leona Petrazyckiego 14'),
(2,'Podgaje','Wladyslawa Taklinskiego 46'),
(2,'Opatkowice Zadworze','Jerzego Smolenskiego 48'),
(2,'Judyma','Zakopianska 138'),
(2,'Borek Falecki','Zakopianska 120'),
(2,'Bogucianka','Juranda ze Spychowa 1a'),
(2,'Kostrze Kapliczka','Tyniecka 138'),
(2,'Kostrze Szkola','Tyniecka 126a'),
(2,'Winnicka','Winnicka 28'),
(2,'Czerwone Maki P+R','Czerwone Maki 61')

select * from Przystanki

--BILETOMATY
insert into Biletomaty values(7,'false')
insert into Biletomaty values(39,'false'),
(17,'true'),
(21,'true'),
(42,'false'),
(31,'true'),
(25,'true'),
(9,'true'),
(37,'false'),
(11,'false')

select * From Biletomaty, Przystanki
where Biletomaty.id_przystanku = Przystanki.id_przystanku

--KOMUNIKATY
insert into Komunikaty values(3,'Imieniny Kacpra i Mateusza!'),
(7,'Zmarl Kobe Bryant 😞'),
(10, 'Wykolejony tramwaj przy ulicy Generala Stefana Grota-Roweckiego 99!'),
(22, 'Imieniny Joanny!'),
(28, 'Uwaga! 22.02.19 zmiana cen biletow ulgowych.')

select * from Komunikaty LEFT JOIN Przystanki
on Komunikaty.id_przystanku = Przystanki.id_przystanku

--LINIE

select * from Linie, LinieInfo
where Linie.id_linii = LinieInfo.id_linii and Linie.id_linii=203

drop table Linie
drop table LinieInfo

--TRAMWAJE
insert into LinieInfo values(2,1,11)
exec DodajGodzineDoLinii 2,1,5,23,':01'
exec DodajGodzineDoLinii 2,2,5,23,':03'
exec DodajGodzineDoLinii 2,3,5,23,':04'
exec DodajGodzineDoLinii 2,4,5,23,':08'
exec DodajGodzineDoLinii 2,5,5,23,':11'
exec DodajGodzineDoLinii 2,6,5,23,':14'
exec DodajGodzineDoLinii 2,7,5,23,':16'
exec DodajGodzineDoLinii 2,8,5,23,':19'
exec DodajGodzineDoLinii 2,9,5,23,':21'
exec DodajGodzineDoLinii 2,10,5,23,':22'
exec DodajGodzineDoLinii 2,11,5,23,':24'

insert into LinieInfo values(8,11,22)
exec DodajGodzineDoLinii 8,11,5,23,':05'
exec DodajGodzineDoLinii 8,12,5,23,':06'
exec DodajGodzineDoLinii 8,13,5,23,':08'
exec DodajGodzineDoLinii 8,14,5,23,':12'
exec DodajGodzineDoLinii 8,15,5,23,':15'
exec DodajGodzineDoLinii 8,16,5,23,':18'
exec DodajGodzineDoLinii 8,17,5,23,':19'
exec DodajGodzineDoLinii 8,18,5,23,':21'
exec DodajGodzineDoLinii 8,19,5,23,':24'
exec DodajGodzineDoLinii 8,20,5,23,':27'
exec DodajGodzineDoLinii 8,21,5,23,':28'
exec DodajGodzineDoLinii 8,22,5,23,':31'

--TROLEJNUSY
insert into LinieInfo values(12,18,28)
exec DodajGodzineDoLinii 12,18,5,23,':00'
exec DodajGodzineDoLinii 12,19,5,23,':02'
exec DodajGodzineDoLinii 12,20,5,23,':03'
exec DodajGodzineDoLinii 12,21,5,23,':06'
exec DodajGodzineDoLinii 12,22,5,23,':09'
exec DodajGodzineDoLinii 12,23,5,23,':11'
exec DodajGodzineDoLinii 12,24,5,23,':12'
exec DodajGodzineDoLinii 12,25,5,23,':14'
exec DodajGodzineDoLinii 12,26,5,23,':17'
exec DodajGodzineDoLinii 12,27,5,23,':20'
exec DodajGodzineDoLinii 12,28,5,23,':23'

insert into LinieInfo values(71,7,19)
exec DodajGodzineDoLinii 71,7,5,23,':02'
exec DodajGodzineDoLinii 71,8,5,23,':05'
exec DodajGodzineDoLinii 71,9,5,23,':07'
exec DodajGodzineDoLinii 71,10,5,23,':10'
exec DodajGodzineDoLinii 71,11,5,23,':13'
exec DodajGodzineDoLinii 71,12,5,23,':15'
exec DodajGodzineDoLinii 71,13,5,23,':19'
exec DodajGodzineDoLinii 71,14,5,23,':21'
exec DodajGodzineDoLinii 71,15,5,23,':24'
exec DodajGodzineDoLinii 71,16,5,23,':28'
exec DodajGodzineDoLinii 71,17,5,23,':31'
exec DodajGodzineDoLinii 71,18,5,23,':34'
exec DodajGodzineDoLinii 71,19,5,23,':37'

--AUTOBUSY
insert into LinieInfo values(203,25,35)
exec DodajGodzineDoLinii 203,25,5,23,':05'
exec DodajGodzineDoLinii 203,26,5,23,':07'
exec DodajGodzineDoLinii 203,27,5,23,':09'
exec DodajGodzineDoLinii 203,28,5,23,':12'
exec DodajGodzineDoLinii 203,29,5,23,':15'
exec DodajGodzineDoLinii 203,30,5,23,':18'
exec DodajGodzineDoLinii 203,31,5,23,':19'
exec DodajGodzineDoLinii 203,32,5,23,':21'
exec DodajGodzineDoLinii 203,33,5,23,':24'
exec DodajGodzineDoLinii 203,34,5,23,':24'
exec DodajGodzineDoLinii 203,35,5,23,':28'

insert into LinieInfo values(743,31,42)
exec DodajGodzineDoLinii 743,31,5,23,':00'
exec DodajGodzineDoLinii 743,32,5,23,':01'
exec DodajGodzineDoLinii 743,33,5,23,':03'
exec DodajGodzineDoLinii 743,34,5,23,':05'
exec DodajGodzineDoLinii 743,35,5,23,':09'
exec DodajGodzineDoLinii 743,36,5,23,':13'
exec DodajGodzineDoLinii 743,37,5,23,':17'
exec DodajGodzineDoLinii 743,38,5,23,':20'
exec DodajGodzineDoLinii 743,39,5,23,':24'
exec DodajGodzineDoLinii 743,41,5,23,':28'
exec DodajGodzineDoLinii 743,42,5,23,':31'



