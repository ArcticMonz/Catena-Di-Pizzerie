drop database if exists CatenaPizzeria;
create database CatenaPizzeria;
use CatenaPizzeria;

create table Pizzeria
(
    nome varchar(50) NOT NULL,
    citta varchar(20) NOT NULL,
    indirizzo varchar(30) NOT NULL,
    coperto float NOT NULL,
    PRIMARY KEY (nome)
);

create table BeniAlimentari
(
    nome varchar(50) NOT NULL,
    prezzo float NOT NULL,
    contenutoCalorico int,
    volume float,
    tipo varchar(10) NOT NULL,
    PRIMARY KEY (nome)
);

create table Cameriere
(
    CF char(16) NOT NULL,
    nome varchar(30) NOT NULL,
    cognome varchar(30) NOT NULL,
    PRIMARY KEY (CF)
);

create table Cliente
(
    CF char(16) NOT NULL,
    nome varchar(30) NOT NULL,
    cognome varchar(30) NOT NULL,
    telefono char(10) NOT NULL,
    PRIMARY KEY (CF)
);

create table Servizio
(
    data DATE NOT NULL,
    nome varchar(50) NOT NULL,
    ore int NOT NULL,
    CF char(16) NOT NULL,
    PRIMARY KEY (data,nome),
    FOREIGN KEY (nome) REFERENCES Pizzeria(nome) 
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (CF) REFERENCES Cameriere(CF)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);

create table Tavolo
(
    codice int NOT NULL,
    nome varchar(50) NOT NULL,
    numeroPosti int NOT NULL,
    CF char(16) NOT NULL,
    PRIMARY KEY (codice,nome),
    FOREIGN KEY (nome) REFERENCES Pizzeria(nome)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (CF) REFERENCES Cameriere(CF)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

create table Pasto
(
    codice int NOT NULL,
    data DATE NOT NULL,
    numeroCommensali int NOT NULL,
    nome varchar(50) NOT NULL,
    PRIMARY KEY (codice),
    FOREIGN KEY (nome) REFERENCES Tavolo(nome)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

create table Ha
(
    pizzeriaNome varchar(50) NOT NULL,
    alimentoNome varchar(50) NOT NULL,
    PRIMARY KEY (pizzeriaNome,alimentoNome),
    FOREIGN KEY (pizzeriaNome) REFERENCES Pizzeria(nome)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (alimentoNome) REFERENCES BeniAlimentari(nome)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

create table EComposto
(
    codice int NOT NULL,
    nome varchar(50) NOT NULL,
    quantita int NOT NULL,
    PRIMARY KEY (codice,nome),
    FOREIGN KEY (codice) REFERENCES Pasto(codice)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (nome) REFERENCES BeniAlimentari(nome)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

create table Consuma
(
    codice int NOT NULL,
    CF char(16) NOT NULL,
    PRIMARY KEY (codice,CF),
    FOREIGN KEY (codice) REFERENCES Pasto(codice)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (CF) REFERENCES Cliente(CF) 
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO Pizzeria VALUES
("Iris", "Milano", "Corso di Porta Romana",2),
("Da Michele", "Napoli", "Via Cesare Sersale",2),
("Sorbillo", "Napoli", "Via Partenope",2),
("Medison", "Salerno", "Corso Umberto I",2),
("Da Giovanni", "Roma", "Via Pisino",2);

INSERT INTO BeniAlimentari VALUES
("Margherita", 5, 700, NULL, "pietanza"),
("Capricciosa", 6, 900, NULL, "pietanza"),
("Ortolana", 6, 100, NULL, "pietanza"),
("Marinara", 4, 600, NULL, "pietanza"),
("Napoli", 4, 400, NULL, "pietanza"),
("Acqua Naturale", 1.50, NULL, 0.5, "bevanda"),
("Acqua Frizzante", 1.50, NULL, 0.5, "bevanda"),
("Coca-Cola", 2.50, NULL, 0.33, "bevanda"),
("Fanta", 2.50, NULL, 0.33, "bevanda"),
("Sprite", 2.50, NULL, 0.33, "bevanda");

INSERT INTO Cameriere VALUES
("RSSMRA98A23H703S", "Mario", "Rossi"),
("MNTFNC95E56C298T", "Francesca", "Monetti"),
("BNCMCH85B11A195F", "Michele", "Bianchi"),
("SNTPTR91H05M234K", "Pietro", "Santoro"),
("VRDSRA83C57H703P", "Sara", "Verdi"),
("RSSBND96D43A198F", "Benedetta", "Rossetti");

INSERT INTO Cliente VALUES
("NNNNTN75C23H703B", "Antonio", "Iannone", "3925678098"),
("LRCGSP89E12A765H", "Giuseppe", "La Rocca", "3314567329"),
("PLMNGL65M22L860J", "Angelo", "Palmieri", "3425678934"),
("MTTSRG77H08P687K", "Sergio", "Mattarella", "3436789054"),
("DLCVNC86E14D987L", "Vincenzo", "De Luca", "3456789021"),
("RSPGVN97A57D498N", "Giovanna", "Rispoli", "3312457689"),
("TRSNGL78A62H703L", "Angelina", "Tursie", "3459807657");

INSERT INTO Servizio VALUES
("2021-10-21", "Da Michele", 6, "MNTFNC95E56C298T"),
("2021-09-10", "Sorbillo", 5, "RSSMRA98A23H703S"),
("2021-01-27", "Sorbillo", 7, "RSSMRA98A23H703S"),
("2021-02-28", "Medison", 8, "RSSBND96D43A198F"),
("2021-03-05", "Iris", 5, "VRDSRA83C57H703P");

INSERT INTO Tavolo VALUES
(4, "Sorbillo", 2, "MNTFNC95E56C298T"),
(2, "Sorbillo", 5, "RSSMRA98A23H703S"),
(4, "Da Michele", 3, "VRDSRA83C57H703P"),
(7, "Da Michele", 6, "VRDSRA83C57H703P"),
(1, "Medison", 4, "RSSBND96D43A198F");

INSERT INTO Pasto VALUES
(432, "2021-10-21", 3, "Da Michele"),
(122, "2021-02-28", 4, "Medison"),
(98, "2021-03-05", 6, "Da Michele"),
(76, "2021-04-16", 5, "Sorbillo"),
(55, "2021-05-05", 2, "Sorbillo");

INSERT INTO Ha VALUES
("Sorbillo", "Margherita"),
("Sorbillo", "Capricciosa"),
("Sorbillo", "Napoli"),
("Sorbillo", "Acqua Naturale"),
("Da Michele", "Margherita"),
("Da Michele", "Ortolana"),
("Da Michele", "Marinara"),
("Da Michele", "Coca-Cola"),
("Medison", "Margherita"),
("Medison", "Capricciosa"),
("Medison", "Ortolana"),
("Medison", "Fanta");

INSERT INTO EComposto VALUES
(55, "Margherita", 2),
(55, "Acqua Naturale", 1),
(55, "Coca-Cola", 1),
(122, "Ortolana", 2),
(122, "Capricciosa", 2),
(122, "Acqua Frizzante", 4),
(76, "Marinara", 3),
(76, "Napoli", 2),
(76, "Fanta", 3),
(76, "Sprite", 2);

INSERT INTO Consuma VALUES
(55, "NNNNTN75C23H703B"),
(55, "LRCGSP89E12A765H"),
(122, "PLMNGL65M22L860J"),
(122, "MTTSRG77H08P687K"),
(122, "TRSNGL78A62H703L"),
(76, "DLCVNC86E14D987L"),
(76, "RSPGVN97A57D498N"),
(76, "NNNNTN75C23H703B"),
(76, "PLMNGL65M22L860J"),
(76, "MTTSRG77H08P687K");




