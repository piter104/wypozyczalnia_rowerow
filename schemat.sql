CREATE TABLE ROWERY
    (ID_ROWERU NUMBER(6) NOT NULL,
    ID_MODELU NUMBER(6) NOT NULL,
    CENA_WYPOZYCZENIA NUMBER(6,2) NOT NULL,
    STAN_ROWERU VARCHAR2(20),
    ID_SERWISU NUMBER(6),
    PRIMARY KEY(ID_ROWERU),
    CONSTRAINT FK_BIKE_MODEL FOREIGN KEY(ID_MODELU) REFERENCES MODELE(ID_MODELU),
    CONSTRAINT FK_SERWIS FOREIGN KEY(ID_SERWISU) REFERENCES SERWIS(ID_SERWISU)
);

CREATE TABLE MODELE
    (ID_MODELU NUMBER(6) NOT NULL, 
    NAZWA_MODELU VARCHAR2(15) NOT NULL, 
    NAZWA_MARKI VARCHAR2(15), 
    TYP VARCHAR2(15),
    PRIMARY KEY(ID_MODELU)
);

CREATE TABLE KLIENT
    (ID_KLIENTA NUMBER(6), 
    IMIE VARCHAR2(15), 
    NAZWISKO VARCHAR2(15), 
    WIEK NUMBER(6),
    PLEC VARCHAR2(15),
    ID_WYPOZYCZALNI NUMBER(6),
    PRIMARY KEY(ID_KLIENTA) REFERENCES REKLAMACJE(ID_KLIENTA),
    CONSTRAINT FK_CLIENT_RENT FOREIGN KEY (ID_WYPOZYCZALNI)
    REFERENCES WYPOZYCZALNIA(ID_WYPOZYCZALNI)
);

CREATE TABLE REGION
    (ID_REGIONU NUMBER(6) NOT NULL, 
    WOJEWODZTWO VARCHAR2(20) NOT NULL, 
    POWIAT VARCHAR2(20) NOT NULL, 
    PRIMARY KEY(ID_REGIONU)
);

CREATE TABLE WYPOZYCZALNIA
    (ID_WYPOZYCZALNI NUMBER(6) NOT NULL, 
    MIASTO VARCHAR2(15) NOT NULL, 
    KOD_POCZTOWY VARCHAR2(15), 
    ADRES VARCHAR2(6),
    ID_REGIONU NUMBER(6),
    PRIMARY KEY(ID_WYPOZYCZALNI),
    CONSTRAINT FK_RENT_REGION FOREIGN KEY (ID_REGIONU)
    REFERENCES REGION(ID_REGIONU)

);

CREATE TABLE WYPOZYCZENIA
    (ID_WYPOZYCZENIA NUMBER(6) NOT NULL, 
    DATA_ROZPOCZECIA DATE NOT NULL,
    DATA_ZAKONCZENIA DATE,
    CENA NUMBER(6) NOT NULL,
    ID_ROWERU NUMBER(6) NOT NULL,
    ID_KLIENTA NUMBER(6) NOT NULL,
    ID_WYPOZYCZALNI NUMBER(6),
    PRIMARY KEY(ID_WYPOZYCZENIA),
    CONSTRAINT FK_RENT_BIKE FOREIGN KEY (ID_ROWERU)
    REFERENCES ROWERY(ID_ROWERU),
    CONSTRAINT FK_RENT_CLIENT FOREIGN KEY (ID_KLIENTA)
    REFERENCES KLIENCI(ID_KLIENTA),
    CONSTRAINT FK_RENT_RENTPLACE FOREIGN KEY (ID_WYPOZYCZALNI)
    REFERENCES WYPOZYCZALNIA(ID_WYPOZYCZALNI)
);

CREATE TABLE SERWIS
    (ID_SERWISU NUMBER(6) NOT NULL, 
    ID_SERWISANTA NUMBER(6) NOT NULL, 
    ROZPOCZECIE_SERWISU DATE NOT NULL, 
    PRIMARY KEY(ID_SERWISU),
    CONSTRAINT FK_SERWIS FOREIGN KEY (ID_SERWISANTA)
    REFERENCES SERWISANT(ID_SERWISANTA)
);

CREATE TABLE SERWISANT
    (ID_SERWISANTA NUMBER(6) NOT NULL, 
    IMIE VARCHAR2(20) NOT NULL, 
    NAZWISKO VARCHAR2(20) NOT NULL, 
    PRIMARY KEY(ID_SERWISANTA)
);

CREATE TABLE REKLAMACJE
    (ID_REKLAMACJI NUMBER(6), 
    ID_KLIENTA NUMBER(6), 
    TYTU?_REKLAMACJI VARCHAR2(20),
    TRESC_REKLAMACJI VARCHAR2(100),
    PRIMARY KEY(ID_REKLAMACJI),
    CONSTRAINT FK_ID_KLIENTA FOREIGN KEY (ID_KLIENTA) REFERENCES KLIENT(ID_KLIENTA)
);

CREATE TABLE REZERWACJE
    (ID_REZERWACJI NUMBER(6) NOT NULL, 
    ID_KLIENTA VARCHAR2(20) NOT NULL, 
    ID_ROWERU VARCHAR2(20) NOT NULL, 
    PRIMARY KEY(ID_REZERWACJI),
    CONSTRAINT FK_REZERWACJI FOREIGN KEY (ID_KLIENTA) REFERENCES KLIENT(ID_KLIENTA)
);

CREATE TABLE CZARNA_LISTA
    (ID_KLIENTA NUMBER(6) NOT NULL, 
    POWOD VARCHAR2(100), 
    PRIMARY KEY(ID_KLIENTA)
);