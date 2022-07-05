
-- Creo il database 
create database db_universita;

-- uso il database
use db_universita;

-- Creo la tabella dipartimenti
create table dipartimenti (
	id INT not null auto_increment,
	nome varchar(50) not null,
	anno_fondazione YEAR,
	primary key(id)
 );
 
-- Creo la tabella corsi di laurea
create table corsi_di_laurea (
	id INT not null auto_increment,
	nome varchar(50) not null,
	durata INT,
	primary key(id)
 );

-- Setto la foreign key per collegare Dipartimenti e corsi di laurea
	
alter table corsi_di_laurea add column dipartimenti_id INT ;
alter table corsi_di_laurea add foreign KEY(dipartimenti_id) references dipartimenti(id);

-- Creo la tabella corsi
create table corsi (
	id INT not null auto_increment,
	nome varchar(50) not null,
	CFU int,
	primary key(id)
 );

-- Setto la foreign key per collegare Corsi di laurea e corsi
	
alter table corsi add column corsi_di_laurea_id INT ;
alter table corsi add foreign KEY(corsi_di_laurea_id) references corsi_di_laurea(id);

-- Creo la tabella Alunni
create table studenti (
	id INT not null auto_increment,
	nome varchar(50) not null,
	cognome varchar(50) not null,
	data_di_nascita date not null,
	primary key(id)
 );

-- Setto la foreign key per collegare studenti e corso di laurea
	
alter table studenti add column corsi_di_laurea_id INT ;
alter table studenti add foreign KEY(corsi_di_laurea_id) references corsi_di_laurea(id);

-- Creo la tabella Insegnanti
create table insegnanti (
	id INT not null auto_increment,
	nome varchar(50) not null,
	cognome varchar(50) not null,
	materia varchar(50) not null,
	primary key(id)
 );

-- Setto la foreign key per collegare insegnanti e corsi
	
alter table corsi add column insegnanti_id INT ;
alter table corsi add foreign KEY(insegnanti_id) references insegnanti(id);


--  inserisco valori nella tabella dipartimenti
INSERT INTO dipartimenti
(nome, anno_fondazione)
VALUES('Dipartimento di Ingegneria', 1945);

INSERT INTO dipartimenti
(nome, anno_fondazione)
VALUES('Dipartimento di Economia', 1946);

INSERT INTO dipartimenti
(nome, anno_fondazione)
VALUES('Dipartimento di Informatica', 1950);

--  inserisco valori nella tabella corsi di laurea
INSERT INTO corsi_di_laurea
(nome, durata, dipartimenti_id)
VALUES('Ingegneria Meccanica', 100, 1);

INSERT INTO corsi_di_laurea
(nome, durata, dipartimenti_id)
VALUES('Economia Aziendale', 90, 2);

INSERT INTO corsi_di_laurea
(nome, durata, dipartimenti_id)
VALUES('Corso di Programmazione', 80, 3);

--  inserisco valori nella tabella corsi

INSERT INTO corsi
(nome, CFU, corsi_di_laurea_id)
VALUES('Corso 1', 12, 1);

INSERT INTO corsi
(nome, CFU, corsi_di_laurea_id)
VALUES('Corso 2', 10, 2);

INSERT INTO corsi
(nome, CFU, corsi_di_laurea_id)
VALUES('Corso 3', 6, 3);

--  inserisco valori nella tabella Studenti
INSERT INTO studenti
(nome, cognome, data_di_nascita, corsi_di_laurea_id)
VALUES('Mario', 'Rossi', '1996-05-07', 1);

INSERT INTO studenti
(nome, cognome, data_di_nascita, corsi_di_laurea_id)
VALUES('Mario', 'Bianchi', '1997-10-06', 1);

INSERT INTO studenti
(nome, cognome, data_di_nascita, corsi_di_laurea_id)
VALUES('Mario', 'Verdi', '1993-12-12', 2);

INSERT INTO studenti
(nome, cognome, data_di_nascita, corsi_di_laurea_id)
VALUES('Mario', 'Rossi', '1994-01-03', 2);

INSERT INTO studenti
(nome, cognome, data_di_nascita, corsi_di_laurea_id)
VALUES('Mario', 'Gialli', '1995-11-23', 3);

--  inserisco valori nella tabella Insegnanti

INSERT INTO insegnanti
(nome, cognome, materia)
VALUES('Giuseppe', 'Garibaldi', 'Java');

INSERT INTO insegnanti
(nome, cognome, materia)
VALUES('Armando', 'Bello', 'Diritto');
