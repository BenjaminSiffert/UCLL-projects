CREATE SCHEMA IF NOT EXISTS r1111746_dierenartspraktijk;

CREATE  TABLE r1111746_dierenartspraktijk.consultatie ( 
	id                   char(5)  NOT NULL  ,
	"procedure"          varchar(50)    ,
	consultatie_prijs    decimal(8,2)  NOT NULL  ,
	starttijd            time  NOT NULL  ,
	datum                date  NOT NULL  ,
	diagnose             varchar(70)    ,
	CONSTRAINT consultatie_pkey PRIMARY KEY ( id )
 );

CREATE  TABLE r1111746_dierenartspraktijk.eigenaar ( 
	id                   char(5)  NOT NULL  ,
	gsm                  varchar(15)  NOT NULL  ,
	naam                 varchar(50)  NOT NULL  ,
	adres                varchar(100)  NOT NULL  ,
	CONSTRAINT eigenaar_pkey PRIMARY KEY ( id )
 );

CREATE  TABLE r1111746_dierenartspraktijk.eigenaar_email ( 
	eigenaar_id          char(5)  NOT NULL  ,
	email                varchar(50)  NOT NULL  ,
	CONSTRAINT eigenaar_email_pkey PRIMARY KEY ( eigenaar_id, email )
 );

CREATE  TABLE r1111746_dierenartspraktijk.factuur ( 
	id                   char(5)  NOT NULL  ,
	datum                date  NOT NULL  ,
	totaal_prijs         decimal(8,2)  NOT NULL  ,
	btw_details          varchar(20)    ,
	consultatie_id       char(5)  NOT NULL  ,
	CONSTRAINT factuur_pkey PRIMARY KEY ( id )
 );

CREATE  TABLE r1111746_dierenartspraktijk.kliniekverblijf ( 
	id                   char(5)  NOT NULL  ,
	van                  date  NOT NULL  ,
	tot                  date  NOT NULL  ,
	verblijfhok          smallint  NOT NULL  ,
	consultatie_id       char(5)    ,
	CONSTRAINT kliniekverblijf_pkey PRIMARY KEY ( id ),
	CONSTRAINT kliniekverblijf_consultatie_unique UNIQUE ( consultatie_id ) 
 );

CREATE  TABLE r1111746_dierenartspraktijk.magazijn ( 
	id                   char(5)  NOT NULL  ,
	besteld              varchar(3)  NOT NULL  ,
	aantal               integer  NOT NULL  ,
	CONSTRAINT magazijn_pkey PRIMARY KEY ( id )
 );

CREATE  TABLE r1111746_dierenartspraktijk.product ( 
	id                   char(5)  NOT NULL  ,
	"type"               varchar(50)    ,
	naam                 varchar(50)  NOT NULL  ,
	prijs                decimal(8,2)  NOT NULL  ,
	magazijn_id          char(5)    ,
	CONSTRAINT product_pkey PRIMARY KEY ( id )
 );

CREATE  TABLE r1111746_dierenartspraktijk.voorschrift ( 
	product_id           char(5)  NOT NULL  ,
	consultatie_id       char(5)  NOT NULL  ,
	CONSTRAINT voorschrift_pkey PRIMARY KEY ( product_id, consultatie_id )
 );

CREATE  TABLE r1111746_dierenartspraktijk.werkschema ( 
	id                   varchar(5)  NOT NULL  ,
	werkdagen            varchar(14)  NOT NULL  ,
	werkuren             varchar(20)  NOT NULL  ,
	CONSTRAINT werkschema_pkey PRIMARY KEY ( id )
 );

CREATE  TABLE r1111746_dierenartspraktijk.dier ( 
	id                   char(5)  NOT NULL  ,
	geboortedatum        date  NOT NULL  ,
	soort                varchar(50)  NOT NULL  ,
	naam                 varchar(50)    ,
	ras                  varchar(50)    ,
	eigenaar_id          char(5)    ,
	CONSTRAINT dier_pkey PRIMARY KEY ( id )
 );

CREATE  TABLE r1111746_dierenartspraktijk.koopt ( 
	eigenaar_id          char(5)  NOT NULL  ,
	product_id           char(5)  NOT NULL  ,
	CONSTRAINT koopt_pkey PRIMARY KEY ( eigenaar_id, product_id )
 );

CREATE  TABLE r1111746_dierenartspraktijk.personeelslid ( 
	id                   char(5)  NOT NULL  ,
	adres                varchar(50)  NOT NULL  ,
	naam                 varchar(50)  NOT NULL  ,
	gsm                  varchar(15)  NOT NULL  ,
	specialisatie        varchar(50)    ,
	ervaring             varchar(30)    ,
	functie              varchar(30)    ,
	schema_id            varchar(5)  NOT NULL  ,
	CONSTRAINT personeelslid_pkey PRIMARY KEY ( id )
 );

CREATE  TABLE r1111746_dierenartspraktijk.personeelslid_email ( 
	personeelslid_id     char(5)  NOT NULL  ,
	email                varchar(50)  NOT NULL  ,
	CONSTRAINT personeelslid_email_pkey PRIMARY KEY ( personeelslid_id, email )
 );

CREATE  TABLE r1111746_dierenartspraktijk.afspraak ( 
	id                   char(5)  NOT NULL  ,
	gepland_tijdstip     date  NOT NULL  ,
	locatie              varchar(50)  NOT NULL  ,
	probleem             varchar(50)    ,
	bezoek_type          varchar(50)  NOT NULL  ,
	dier_id              char(5)    ,
	consultatie_id       char(5)  NOT NULL  ,
	CONSTRAINT afspraak_pkey PRIMARY KEY ( id ),
	CONSTRAINT afspraak_consultatie_id_key UNIQUE ( consultatie_id ) ,
	CONSTRAINT afspraak_consultatie_unique UNIQUE ( consultatie_id ) ,
	CONSTRAINT unique_consultatie_per_afspraak UNIQUE ( consultatie_id ) 
 );

CREATE  TABLE r1111746_dierenartspraktijk.maakt ( 
	personeelslid_id     char(5)  NOT NULL  ,
	consultatie_id       char(5)  NOT NULL  ,
	CONSTRAINT maakt_pkey PRIMARY KEY ( personeelslid_id, consultatie_id )
 );

ALTER TABLE r1111746_dierenartspraktijk.afspraak ADD CONSTRAINT afspraak_consultatie_id_fkey FOREIGN KEY ( consultatie_id ) REFERENCES r1111746_dierenartspraktijk.consultatie( id );

ALTER TABLE r1111746_dierenartspraktijk.afspraak ADD CONSTRAINT afspraak_dier_id_fkey FOREIGN KEY ( dier_id ) REFERENCES r1111746_dierenartspraktijk.dier( id );

ALTER TABLE r1111746_dierenartspraktijk.dier ADD CONSTRAINT dier_eigenaar_id_fkey FOREIGN KEY ( eigenaar_id ) REFERENCES r1111746_dierenartspraktijk.eigenaar( id );

ALTER TABLE r1111746_dierenartspraktijk.eigenaar_email ADD CONSTRAINT eigenaar_email_eigenaar_id_fkey FOREIGN KEY ( eigenaar_id ) REFERENCES r1111746_dierenartspraktijk.eigenaar( id );

ALTER TABLE r1111746_dierenartspraktijk.factuur ADD CONSTRAINT factuur_consultatie_id_fkey FOREIGN KEY ( consultatie_id ) REFERENCES r1111746_dierenartspraktijk.consultatie( id );

ALTER TABLE r1111746_dierenartspraktijk.kliniekverblijf ADD CONSTRAINT kliniekverblijf_consultatie_fkey FOREIGN KEY ( consultatie_id ) REFERENCES r1111746_dierenartspraktijk.consultatie( id );

ALTER TABLE r1111746_dierenartspraktijk.koopt ADD CONSTRAINT koopt_eigenaar_id_fkey FOREIGN KEY ( eigenaar_id ) REFERENCES r1111746_dierenartspraktijk.eigenaar( id );

ALTER TABLE r1111746_dierenartspraktijk.koopt ADD CONSTRAINT koopt_product_id_fkey FOREIGN KEY ( product_id ) REFERENCES r1111746_dierenartspraktijk.product( id );

ALTER TABLE r1111746_dierenartspraktijk.maakt ADD CONSTRAINT maakt_consultatie_id_fkey FOREIGN KEY ( consultatie_id ) REFERENCES r1111746_dierenartspraktijk.consultatie( id );

ALTER TABLE r1111746_dierenartspraktijk.maakt ADD CONSTRAINT maakt_personeelslid_id_fkey FOREIGN KEY ( personeelslid_id ) REFERENCES r1111746_dierenartspraktijk.personeelslid( id );

ALTER TABLE r1111746_dierenartspraktijk.personeelslid ADD CONSTRAINT personeelslid_schema_id_fkey FOREIGN KEY ( schema_id ) REFERENCES r1111746_dierenartspraktijk.werkschema( id );

ALTER TABLE r1111746_dierenartspraktijk.personeelslid_email ADD CONSTRAINT personeelslid_email_personeelslid_id_fkey FOREIGN KEY ( personeelslid_id ) REFERENCES r1111746_dierenartspraktijk.personeelslid( id );

ALTER TABLE r1111746_dierenartspraktijk.product ADD CONSTRAINT product_magazijn_id_fkey FOREIGN KEY ( magazijn_id ) REFERENCES r1111746_dierenartspraktijk.magazijn( id );

ALTER TABLE r1111746_dierenartspraktijk.voorschrift ADD CONSTRAINT voorschrift_consultatie_id_fkey FOREIGN KEY ( consultatie_id ) REFERENCES r1111746_dierenartspraktijk.consultatie( id );

ALTER TABLE r1111746_dierenartspraktijk.voorschrift ADD CONSTRAINT voorschrift_product_id_fkey FOREIGN KEY ( product_id ) REFERENCES r1111746_dierenartspraktijk.product( id );

INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0001', 'Orthopedisch onderzoek', 65, '09:00:00', '2024-01-10', 'Artritis');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0002', 'Maagonderzoek', 55, '11:00:00', '2024-01-12', 'Maagontsteking');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0003', 'Ooronderzoek', 45, '14:00:00', '2024-01-14', 'Oorontsteking');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0004', 'Gebitscheck', 30, '10:00:00', '2024-01-18', 'Tandsteenophoping');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0005', 'Wondverzorging', 50, '16:00:00', '2024-01-20', 'Oppervlakkige snijwonde');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0006', 'Volledig klinisch onderzoek', 80, '13:00:00', '2024-01-25', 'Ernstige algemene verzwakking');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0007', 'Vaccinatie hond', 40, '09:30:00', '2024-02-01', 'Routine vaccinatie');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0008', 'Nieronderzoek', 75, '10:00:00', '2024-02-02', 'Chronische nierinsufficiëntie');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0009', 'Huidonderzoek', 55, '11:30:00', '2024-02-03', 'Allergische dermatitis');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0010', 'Gedragsconsult', 90, '14:00:00', '2024-02-04', 'Angststoornis');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0011', 'Röntgenonderzoek', 120, '15:00:00', '2024-02-05', 'Heupdysplasie');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0012', 'Bloedonderzoek', 65, '16:00:00', '2024-02-06', 'Anemie');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0013', 'Wondcontrole', 35, '09:00:00', '2024-02-07', 'Genezing verloopt goed');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0014', 'Oogonderzoek', 50, '09:45:00', '2024-02-08', 'Conjunctivitis');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0015', 'Tandextractie', 150, '11:00:00', '2024-02-09', 'Gebroken hoektand');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0016', 'Controle na operatie', 30, '13:00:00', '2024-02-10', 'Herstel verloopt normaal');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0017', 'Nagels knippen', 20, '10:30:00', '2024-02-11', 'Routineverzorging');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0018', 'Baarmoederonderzoek', 95, '14:30:00', '2024-02-12', 'Pyometra');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0019', 'Gewichtscontrole', 25, '13:15:00', '2024-02-13', 'Overgewicht');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0020', 'Urineonderzoek', 50, '15:30:00', '2024-02-14', 'Blaasontsteking');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0021', 'Ooruitspoeling', 45, '10:00:00', '2024-02-15', 'Ernstige oorinfectie');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0022', 'Allergietest', 110, '11:15:00', '2024-02-16', 'Voedselallergie');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0023', 'Pootonderzoek', 60, '12:30:00', '2024-02-17', 'Verstuiking');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0024', 'Zwangerschapsecho', 80, '09:45:00', '2024-02-18', 'Dracht vastgesteld');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0025', 'Klinisch onderzoek', 75, '10:45:00', '2024-02-19', 'Algehele malaise');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0026', 'Parasietcontrole', 35, '13:45:00', '2024-02-20', 'Vlooienplaag');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0027', 'Vaccinatie kat', 40, '08:45:00', '2024-02-21', 'Routine vaccinatie');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0028', 'ECG-onderzoek', 100, '14:00:00', '2024-02-22', 'Hartritmestoornis');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0029', 'Echografie abdomen', 150, '15:00:00', '2024-02-23', 'Tumorvorming');
INSERT INTO r1111746_dierenartspraktijk.consultatie( id, "procedure", consultatie_prijs, starttijd, datum, diagnose ) VALUES ( 'C0030', 'Schildklieronderzoek', 85, '10:15:00', '2024-02-24', 'Hyperthyroïdie');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0001', '0498123456', 'Marie Peeters', 'Stationsstraat 12, Gent');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0002', '0499556677', 'Johan Willems', 'Molenweg 4, Leuven');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0003', '0468123499', 'Sara De Smet', 'Kouterlaan 88, Antwerpen');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0004', '0477551122', 'Tim Jacobs', 'Heirbaan 22, Hasselt');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0005', '0489135799', 'Lotte Vermeulen', 'Nieuwstraat 5, Brugge');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0006', '0489553311', 'Katrien De Wilde', 'Gouwstraat 12, Gent');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0007', '0499772288', 'Tim Roelens', 'Kerkblok 7, Brugge');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0008', '0468223399', 'Mila Jacobs', 'Dorp 44, Oudenaarde');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0009', '0477338922', 'Frederik Van Gorp', 'Nieuwstraat 3, Aalst');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0010', '0476129901', 'Anouk Serry', 'Koekoeklaan 18, Lokeren');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0011', '0499666955', 'Maarten Deruwe', 'Kouter 1, Gent');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0012', '0488123992', 'Ine De Prins', 'Stationsstraat 8, Leuven');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0013', '0475001122', 'Eva De Winter', 'Parkstraat 6, Antwerpen');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0014', '0479667441', 'Jasper Huygens', 'Vijverlaan 25, Mechelen');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0015', '0478112290', 'Lien Verhulst', 'Driesstraat 55, Aalst');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0016', '0489771123', 'Bram Willems', 'Heidestraat 77, Genk');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0017', '0498556673', 'Gina Martens', 'Bospark 88, Turnhout');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0018', '0479559021', 'Cedric Boone', 'Havenlaan 10, Gent');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0019', '0489122233', 'Lore Bultinck', 'Veldstraat 99, Brugge');
INSERT INTO r1111746_dierenartspraktijk.eigenaar( id, gsm, naam, adres ) VALUES ( 'E0020', '0497123488', 'Arne De Dier', 'Hutsepot 3, Kortrijk');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0001', 'marie.peeters@gmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0001', 'marie.p@hotmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0002', 'johan.w@gmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0003', 'sara.desmet@hotmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0004', 'tim.jacobs@gmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0005', 'lotte.v@gmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0006', 'katrien.dw@gmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0007', 'tim.roelens@gmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0008', 'mila.jacobs@hotmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0009', 'frederik.vg@gmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0010', 'anouk.serry@hotmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0011', 'maarten.deruwe@gmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0012', 'ine.dp@gmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0013', 'eva.dw@gmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0014', 'jasper.h@hotmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0015', 'lien.vh@gmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0016', 'bram.willems@gmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0017', 'gina.m@gmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0018', 'cedric.boone@hotmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0019', 'lore.bultinck@gmail.com');
INSERT INTO r1111746_dierenartspraktijk.eigenaar_email( eigenaar_id, email ) VALUES ( 'E0020', 'arne.dd@gmail.com');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0001', '2024-01-10', 78.65, '21%', 'C0001');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0002', '2024-01-12', 66.55, '21%', 'C0002');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0003', '2024-01-14', 54.45, '21%', 'C0003');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0004', '2024-01-18', 36.30, '21%', 'C0004');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0005', '2024-01-20', 60.50, '21%', 'C0005');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0006', '2024-01-25', 84.70, '21%', 'C0006');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0041', '2024-03-11', 60, '21%', 'C0017');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0042', '2024-03-12', 90, '21%', 'C0018');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0043', '2024-03-13', 75, '21%', 'C0019');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0044', '2024-03-14', 48, '21%', 'C0020');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0045', '2024-03-15', 88, '21%', 'C0021');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0046', '2024-03-16', 33, '21%', 'C0022');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0047', '2024-03-17', 100, '21%', 'C0023');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0048', '2024-03-18', 69, '21%', 'C0024');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0049', '2024-03-19', 59, '21%', 'C0025');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0050', '2024-03-20', 130, '21%', 'C0026');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0007', '2024-03-01', 90, '21%', 'C0007');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0008', '2024-03-02', 45, '21%', 'C0008');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0009', '2024-03-03', 75, '21%', 'C0009');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0010', '2024-03-04', 110, '21%', 'C0010');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0011', '2024-03-05', 140, '21%', 'C0011');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0012', '2024-03-06', 30, '21%', 'C0012');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0013', '2024-03-07', 25, '21%', 'C0013');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0014', '2024-03-08', 50, '21%', 'C0014');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0015', '2024-03-09', 120, '21%', 'C0015');
INSERT INTO r1111746_dierenartspraktijk.factuur( id, datum, totaal_prijs, btw_details, consultatie_id ) VALUES ( 'F0016', '2024-03-10', 40, '21%', 'C0016');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV001', '2024-01-10', '2024-01-12', 4, 'C0001');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV002', '2024-01-12', '2024-01-13', 2, 'C0002');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV003', '2024-01-20', '2024-01-21', 1, 'C0005');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV004', '2024-01-10', '2024-01-12', 3, 'C0007');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV005', '2024-01-11', '2024-01-13', 5, 'C0008');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV006', '2024-01-12', '2024-01-14', 2, 'C0009');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV007', '2024-01-13', '2024-01-15', 1, 'C0010');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV008', '2024-01-14', '2024-01-16', 4, 'C0011');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV009', '2024-01-15', '2024-01-18', 6, 'C0012');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV010', '2024-01-16', '2024-01-17', 2, 'C0013');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV011', '2024-01-17', '2024-01-19', 3, 'C0014');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV012', '2024-01-18', '2024-01-20', 1, 'C0015');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV013', '2024-01-19', '2024-01-22', 7, 'C0016');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV014', '2024-01-20', '2024-01-21', 2, 'C0017');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV015', '2024-01-22', '2024-01-23', 5, 'C0018');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV016', '2024-01-23', '2024-01-25', 4, 'C0019');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV017', '2024-01-24', '2024-01-26', 1, 'C0020');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV018', '2024-01-25', '2024-01-27', 3, 'C0021');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV019', '2024-01-26', '2024-01-29', 6, 'C0022');
INSERT INTO r1111746_dierenartspraktijk.kliniekverblijf( id, van, tot, verblijfhok, consultatie_id ) VALUES ( 'KV020', '2024-01-27', '2024-01-30', 2, 'C0023');
INSERT INTO r1111746_dierenartspraktijk.magazijn( id, besteld, aantal ) VALUES ( 'M0001', 'ja', 40);
INSERT INTO r1111746_dierenartspraktijk.magazijn( id, besteld, aantal ) VALUES ( 'M0002', 'nee', 18);
INSERT INTO r1111746_dierenartspraktijk.magazijn( id, besteld, aantal ) VALUES ( 'M0003', 'nee', 22);
INSERT INTO r1111746_dierenartspraktijk.magazijn( id, besteld, aantal ) VALUES ( 'M0004', 'ja', 14);
INSERT INTO r1111746_dierenartspraktijk.magazijn( id, besteld, aantal ) VALUES ( 'M0005', 'nee', 33);
INSERT INTO r1111746_dierenartspraktijk.magazijn( id, besteld, aantal ) VALUES ( 'M0006', 'ja', 18);
INSERT INTO r1111746_dierenartspraktijk.magazijn( id, besteld, aantal ) VALUES ( 'M0007', 'nee', 27);
INSERT INTO r1111746_dierenartspraktijk.magazijn( id, besteld, aantal ) VALUES ( 'M0008', 'ja', 12);
INSERT INTO r1111746_dierenartspraktijk.magazijn( id, besteld, aantal ) VALUES ( 'M0009', 'nee', 40);
INSERT INTO r1111746_dierenartspraktijk.magazijn( id, besteld, aantal ) VALUES ( 'M0010', 'nee', 55);
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR001', 'Medicatie', 'Antibiotica Hond', 34.50, 'M0001');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR002', 'Medicatie', 'Ontworming Kat', 19.90, 'M0001');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR003', 'Voeding', 'Premium Hondenbrokken', 49.99, 'M0002');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR004', 'Voeding', 'Senior Kattenbrokken', 38.20, 'M0002');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR005', 'Verband', 'Steriel verband', 12.30, 'M0001');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR006', 'Injectie', 'Pijnstiller injectie', 22.10, 'M0001');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR007', 'Medicatie', 'Oogzalf', 18.50, 'M0001');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR008', 'Medicatie', 'Allergiepillen', 27.90, 'M0001');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR009', 'Injectie', 'Vitaminen B12', 33, 'M0001');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR010', 'Injectie', 'Rustgevend middel', 45, 'M0002');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR011', 'Voeding', 'Puppybrokken', 59.99, 'M0002');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR012', 'Voeding', 'Senior hondenvoer', 64.50, 'M0002');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR013', 'Voeding', 'Kattenvoer sterilised', 42.30, 'M0003');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR014', 'Voeding', 'Caviavoer mix', 15, 'M0003');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR015', 'Verband', 'Elastisch verband', 9.99, 'M0001');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR016', 'Verband', 'Wondpleisters', 6.50, 'M0001');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR017', 'Accessoire', 'Halsband hond', 12.99, 'M0004');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR018', 'Accessoire', 'Krabpaal klein', 29.99, 'M0004');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR019', 'Accessoire', 'Nagelknipper', 7.49, 'M0004');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR020', 'Accessoire', 'Transportbox small', 32, 'M0005');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR021', 'Accessoire', 'Transportbox medium', 45, 'M0005');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR022', 'Medicatie', 'Antibioticum breed', 39, 'M0006');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR023', 'Medicatie', 'Ontwormmiddel groot', 22, 'M0006');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR024', 'Voeding', 'Hypoallergeen voer', 78, 'M0007');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR025', 'Voeding', 'Puppy natvoer', 19, 'M0007');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR026', 'Verband', 'Steriele doek', 8.99, 'M0008');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR027', 'Verband', 'Pootverband', 14.50, 'M0008');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR028', 'Injectie', 'Sedatie middel', 55, 'M0009');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR029', 'Voeding', 'Kattensnoepjes', 4.99, 'M0010');
INSERT INTO r1111746_dierenartspraktijk.product( id, "type", naam, prijs, magazijn_id ) VALUES ( 'PR030', 'Accessoire', 'Kattenbak', 24.99, 'M0010');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR001', 'C0001');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR002', 'C0002');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR005', 'C0003');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR005', 'C0005');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR006', 'C0006');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR003', 'C0006');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR007', 'C0007');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR008', 'C0008');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR015', 'C0009');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR022', 'C0010');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR023', 'C0011');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR009', 'C0012');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR016', 'C0013');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR017', 'C0014');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR026', 'C0015');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR012', 'C0016');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR011', 'C0017');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR027', 'C0018');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR028', 'C0019');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR018', 'C0020');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR021', 'C0021');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR019', 'C0022');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR024', 'C0023');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR025', 'C0024');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR029', 'C0025');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR030', 'C0026');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR007', 'C0027');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR012', 'C0028');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR024', 'C0029');
INSERT INTO r1111746_dierenartspraktijk.voorschrift( product_id, consultatie_id ) VALUES ( 'PR018', 'C0030');
INSERT INTO r1111746_dierenartspraktijk.werkschema( id, werkdagen, werkuren ) VALUES ( 'WS001', 'Ma–Vr', '08:00–16:00');
INSERT INTO r1111746_dierenartspraktijk.werkschema( id, werkdagen, werkuren ) VALUES ( 'WS002', 'Di–Za', '10:00–18:00');
INSERT INTO r1111746_dierenartspraktijk.werkschema( id, werkdagen, werkuren ) VALUES ( 'WS003', 'Ma–Do', '09:00–15:00');
INSERT INTO r1111746_dierenartspraktijk.werkschema( id, werkdagen, werkuren ) VALUES ( 'WS004', 'Ma–Vr', '08:30–17:00');
INSERT INTO r1111746_dierenartspraktijk.werkschema( id, werkdagen, werkuren ) VALUES ( 'WS005', 'Ma–Vr', '07:00–15:00');
INSERT INTO r1111746_dierenartspraktijk.werkschema( id, werkdagen, werkuren ) VALUES ( 'WS006', 'Di–Za', '12:00–20:00');
INSERT INTO r1111746_dierenartspraktijk.werkschema( id, werkdagen, werkuren ) VALUES ( 'WS007', 'Wo–Zo', '09:00–17:00');
INSERT INTO r1111746_dierenartspraktijk.werkschema( id, werkdagen, werkuren ) VALUES ( 'WS008', 'Ma–Za', '08:00–14:00');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0001', '2018-04-12', 'Hond', 'Max', 'Labrador', 'E0001');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0002', '2020-08-01', 'Kat', 'Simba', 'Maine Coon', 'E0001');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0003', '2019-11-22', 'Hond', 'Nala', 'Border Collie', 'E0002');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0004', '2021-03-18', 'Kat', 'Loki', 'Europees Korthaar', 'E0003');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0005', '2022-01-09', 'Konijn', 'Rocky', 'Vlaams Reus', 'E0004');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0006', '2017-07-29', 'Hond', 'Bella', 'Beagle', 'E0005');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0007', '2016-05-01', 'Hond', 'Oscar', 'Duitse Herder', 'E0006');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0008', '2021-02-13', 'Kat', 'Molly', 'Ragdoll', 'E0007');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0009', '2020-11-04', 'Konijn', 'Toby', 'Hangoor', 'E0008');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0010', '2017-06-18', 'Hond', 'Rex', 'Golden Retriever', 'E0009');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0011', '2019-09-25', 'Kat', 'Minoes', 'Siamees', 'E0010');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0012', '2020-04-15', 'Kat', 'Shadow', 'Brits Korthaar', 'E0011');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0013', '2022-03-30', 'Hond', 'Pip', 'Jack Russell', 'E0012');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0014', '2015-07-12', 'Papegaai', 'Blue', 'Ara', 'E0013');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0015', '2021-12-01', 'Cavia', 'Koko', 'Amerikaans', 'E0014');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0016', '2018-10-09', 'Hond', 'Panda', 'Shiba Inu', 'E0015');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0017', '2018-11-03', 'Kat', 'Nova', 'Noorse Boskat', 'E0016');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0018', '2019-02-21', 'Hond', 'Nero', 'Dobermann', 'E0017');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0019', '2022-05-19', 'Konijn', 'Fluffy', 'Vlaamse Reus', 'E0018');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0020', '2021-03-01', 'Kat', 'Mira', 'Sphynx', 'E0019');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0021', '2020-08-11', 'Hond', 'Ringo', 'Beagle', 'E0020');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0022', '2019-09-10', 'Kat', 'Simba', 'Maine Coon', 'E0018');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0023', '2017-02-04', 'Hond', 'Daisy', 'Labrador', 'E0007');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0024', '2020-07-22', 'Kat', 'Lucky', 'Europees Korthaar', 'E0011');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0025', '2019-01-30', 'Hond', 'Charlie', 'Border Collie', 'E0012');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0026', '2016-10-14', 'Hond', 'Sasha', 'Husky', 'E0016');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0027', '2022-02-11', 'Kat', 'Luna', 'Bengaals', 'E0009');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0028', '2021-08-20', 'Cavia', 'Pippa', 'Sheltie', 'E0013');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0029', '2018-12-15', 'Hond', 'Storm', 'Malinois', 'E0006');
INSERT INTO r1111746_dierenartspraktijk.dier( id, geboortedatum, soort, naam, ras, eigenaar_id ) VALUES ( 'D0030', '2020-05-27', 'Kat', 'Bowie', 'Ragdoll', 'E0014');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0001', 'PR003');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0001', 'PR005');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0002', 'PR001');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0003', 'PR002');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0004', 'PR004');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0005', 'PR006');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0006', 'PR007');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0007', 'PR009');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0008', 'PR012');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0009', 'PR011');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0010', 'PR014');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0011', 'PR016');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0012', 'PR017');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0013', 'PR018');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0014', 'PR020');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0015', 'PR022');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0016', 'PR023');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0017', 'PR025');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0018', 'PR026');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0019', 'PR028');
INSERT INTO r1111746_dierenartspraktijk.koopt( eigenaar_id, product_id ) VALUES ( 'E0020', 'PR030');
INSERT INTO r1111746_dierenartspraktijk.personeelslid( id, adres, naam, gsm, specialisatie, ervaring, functie, schema_id ) VALUES ( 'P0001', 'Kerkstraat 1, Gent', 'Dr. Lotte Janssens', '0471002233', 'Dierenarts', '8', 'Chirurgie', 'WS001');
INSERT INTO r1111746_dierenartspraktijk.personeelslid( id, adres, naam, gsm, specialisatie, ervaring, functie, schema_id ) VALUES ( 'P0002', 'Ringlaan 15, Aalst', 'Tom Vermeulen', '0479553311', 'Dierenarts', '5', 'Algemeen', 'WS002');
INSERT INTO r1111746_dierenartspraktijk.personeelslid( id, adres, naam, gsm, specialisatie, ervaring, functie, schema_id ) VALUES ( 'P0003', 'Dorpsstraat 22, Mechelen', 'Anke Willems', '0488112244', 'Verzorger', '3', 'Assistent', 'WS003');
INSERT INTO r1111746_dierenartspraktijk.personeelslid( id, adres, naam, gsm, specialisatie, ervaring, functie, schema_id ) VALUES ( 'P0004', 'Beekstraat 8, Kortrijk', 'Kim Peeters', '0489221133', 'Administratief medewerker', '6', 'Onthaal', 'WS004');
INSERT INTO r1111746_dierenartspraktijk.personeelslid( id, adres, naam, gsm, specialisatie, ervaring, functie, schema_id ) VALUES ( 'P0005', 'Beuklaan 12, Gent', 'Sarah Vercammen', '0478123456', 'Dierenarts', '4', 'Algemeen', 'WS005');
INSERT INTO r1111746_dierenartspraktijk.personeelslid( id, adres, naam, gsm, specialisatie, ervaring, functie, schema_id ) VALUES ( 'P0006', 'Kouterdreef 8, Antwerpen', 'Lars Michiels', '0489123678', 'Verzorger', '2', 'Assistent', 'WS006');
INSERT INTO r1111746_dierenartspraktijk.personeelslid( id, adres, naam, gsm, specialisatie, ervaring, functie, schema_id ) VALUES ( 'P0007', 'Heirbaan 44, Brugge', 'Hannah Tersago', '0479556677', 'Dierenarts', '6', 'Chirurgie', 'WS007');
INSERT INTO r1111746_dierenartspraktijk.personeelslid( id, adres, naam, gsm, specialisatie, ervaring, functie, schema_id ) VALUES ( 'P0008', 'Parklaan 20, Leuven', 'Robbe Maes', '0479112233', 'Admin', '3', 'Onthaal', 'WS008');
INSERT INTO r1111746_dierenartspraktijk.personeelslid( id, adres, naam, gsm, specialisatie, ervaring, functie, schema_id ) VALUES ( 'P0009', 'Bosstraat 18, Aalst', 'Eline De Clercq', '0475123488', 'Dierenarts', '7', 'Dermatologie', 'WS005');
INSERT INTO r1111746_dierenartspraktijk.personeelslid( id, adres, naam, gsm, specialisatie, ervaring, functie, schema_id ) VALUES ( 'P0010', 'Steenweg 99, Gent', 'Yannick De Vos', '0479331177', 'Verzorger', '4', 'Assistent', 'WS006');
INSERT INTO r1111746_dierenartspraktijk.personeelslid( id, adres, naam, gsm, specialisatie, ervaring, functie, schema_id ) VALUES ( 'P0011', 'Havenstraat 5, Mechelen', 'Amélie Jans', '0479283445', 'Dierenarts', '3', 'Radiologie', 'WS007');
INSERT INTO r1111746_dierenartspraktijk.personeelslid( id, adres, naam, gsm, specialisatie, ervaring, functie, schema_id ) VALUES ( 'P0012', 'Langestraat 2, Kortrijk', 'Ruben Smet', '0478224591', 'Admin', '5', 'Onthaal', 'WS008');
INSERT INTO r1111746_dierenartspraktijk.personeelslid( id, adres, naam, gsm, specialisatie, ervaring, functie, schema_id ) VALUES ( 'P0013', 'Rivierlaan 55, Dendermonde', 'Julie Peeters', '0479559012', 'Dierenarts', '8', 'Orthopedie', 'WS005');
INSERT INTO r1111746_dierenartspraktijk.personeelslid( id, adres, naam, gsm, specialisatie, ervaring, functie, schema_id ) VALUES ( 'P0014', 'Bremstraat 7, Lokeren', 'Nathan Verhaegen', '0478332188', 'Verzorger', '1', 'Assistent', 'WS006');
INSERT INTO r1111746_dierenartspraktijk.personeelslid( id, adres, naam, gsm, specialisatie, ervaring, functie, schema_id ) VALUES ( 'P0015', 'Markt 1, Hasselt', 'Zoë Verlinden', '0476889201', 'Dierenarts', '10', 'Interne', 'WS007');
INSERT INTO r1111746_dierenartspraktijk.personeelslid_email( personeelslid_id, email ) VALUES ( 'P0001', 'lotte.janssens@vetclinic.be');
INSERT INTO r1111746_dierenartspraktijk.personeelslid_email( personeelslid_id, email ) VALUES ( 'P0002', 'tom.vermeulen@vetclinic.be');
INSERT INTO r1111746_dierenartspraktijk.personeelslid_email( personeelslid_id, email ) VALUES ( 'P0003', 'anke.willems@vetclinic.be');
INSERT INTO r1111746_dierenartspraktijk.personeelslid_email( personeelslid_id, email ) VALUES ( 'P0004', 'kim.peeters@vetclinic.be');
INSERT INTO r1111746_dierenartspraktijk.personeelslid_email( personeelslid_id, email ) VALUES ( 'P0005', 'sarah.verc@vetclinic.be');
INSERT INTO r1111746_dierenartspraktijk.personeelslid_email( personeelslid_id, email ) VALUES ( 'P0006', 'lars.michiels@vetclinic.be');
INSERT INTO r1111746_dierenartspraktijk.personeelslid_email( personeelslid_id, email ) VALUES ( 'P0007', 'hannah.tersago@vetclinic.be');
INSERT INTO r1111746_dierenartspraktijk.personeelslid_email( personeelslid_id, email ) VALUES ( 'P0008', 'robbe.maes@vetclinic.be');
INSERT INTO r1111746_dierenartspraktijk.personeelslid_email( personeelslid_id, email ) VALUES ( 'P0009', 'eline.dc@vetclinic.be');
INSERT INTO r1111746_dierenartspraktijk.personeelslid_email( personeelslid_id, email ) VALUES ( 'P0010', 'yannick.dv@vetclinic.be');
INSERT INTO r1111746_dierenartspraktijk.personeelslid_email( personeelslid_id, email ) VALUES ( 'P0011', 'amelie.j@vetclinic.be');
INSERT INTO r1111746_dierenartspraktijk.personeelslid_email( personeelslid_id, email ) VALUES ( 'P0012', 'ruben.smet@vetclinic.be');
INSERT INTO r1111746_dierenartspraktijk.personeelslid_email( personeelslid_id, email ) VALUES ( 'P0013', 'julie.peeters@vetclinic.be');
INSERT INTO r1111746_dierenartspraktijk.personeelslid_email( personeelslid_id, email ) VALUES ( 'P0014', 'nathan.verhaegen@vetclinic.be');
INSERT INTO r1111746_dierenartspraktijk.personeelslid_email( personeelslid_id, email ) VALUES ( 'P0015', 'zoe.verlinden@vetclinic.be');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0001', '2024-01-10', 'Onderzoekskamer 1', 'Kreupelheid', 'Consultatie', 'D0001', 'C0001');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0002', '2024-01-12', 'Onderzoekskamer 2', 'Braken', 'Consultatie', 'D0002', 'C0002');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0003', '2024-01-14', 'Onderzoekskamer 3', 'Jeuk aan oor', 'Consultatie', 'D0003', 'C0003');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0004', '2024-01-18', 'Onderzoekskamer 1', 'Slechte adem', 'Consultatie', 'D0004', 'C0004');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0005', '2024-01-20', 'Verbandkamer', 'Wonde verzorgen', 'Consultatie', 'D0005', 'C0005');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0006', '2024-01-25', 'Onderzoekskamer 2', 'Vermagering', 'Consultatie', 'D0006', 'C0006');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0031', '2024-03-01', 'Kamer 1', 'Verminderd eten', 'Consultatie', 'D0007', 'C0007');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0032', '2024-03-02', 'Kamer 2', 'Oogirritatie', 'Consultatie', 'D0008', 'C0008');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0033', '2024-03-03', 'Kamer 3', 'Wonde poot', 'Consultatie', 'D0009', 'C0009');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0034', '2024-03-04', 'Kamer 4', 'Hoesten', 'Consultatie', 'D0010', 'C0010');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0035', '2024-03-05', 'Kamer 1', 'Overgeven', 'Consultatie', 'D0011', 'C0011');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0036', '2024-03-06', 'Kamer 2', 'Diarree', 'Consultatie', 'D0012', 'C0012');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0037', '2024-03-07', 'Kamer 3', 'Jeuk', 'Consultatie', 'D0013', 'C0013');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0038', '2024-03-08', 'Kamer 4', 'Kreupelheid', 'Consultatie', 'D0014', 'C0014');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0039', '2024-03-09', 'Kamer 1', 'Oorpijn', 'Consultatie', 'D0015', 'C0015');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0040', '2024-03-10', 'Kamer 2', 'Gedragsprobleem', 'Consultatie', 'D0016', 'C0016');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0041', '2024-03-11', 'Kamer 3', 'Huiduitslag', 'Consultatie', 'D0017', 'C0017');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0042', '2024-03-12', 'Kamer 4', 'Lusteloosheid', 'Consultatie', 'D0018', 'C0018');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0043', '2024-03-13', 'Kamer 1', 'Zwelling', 'Consultatie', 'D0019', 'C0019');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0044', '2024-03-14', 'Kamer 2', 'Nagelbreuk', 'Consultatie', 'D0020', 'C0020');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0045', '2024-03-15', 'Kamer 3', 'Benauwdheid', 'Consultatie', 'D0021', 'C0021');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0046', '2024-03-16', 'Kamer 4', 'Vermagering', 'Consultatie', 'D0022', 'C0022');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0047', '2024-03-17', 'Kamer 1', 'Vachtproblemen', 'Consultatie', 'D0023', 'C0023');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0048', '2024-03-18', 'Kamer 2', 'Blaasklachten', 'Consultatie', 'D0024', 'C0024');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0049', '2024-03-19', 'Kamer 3', 'Eetproblemen', 'Consultatie', 'D0025', 'C0025');
INSERT INTO r1111746_dierenartspraktijk.afspraak( id, gepland_tijdstip, locatie, probleem, bezoek_type, dier_id, consultatie_id ) VALUES ( 'A0050', '2024-03-20', 'Kamer 4', 'Diepe wond', 'Consultatie', 'D0026', 'C0026');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0001', 'C0001');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0002', 'C0002');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0001', 'C0003');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0003', 'C0004');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0002', 'C0005');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0004', 'C0006');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0005', 'C0007');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0006', 'C0008');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0007', 'C0009');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0008', 'C0010');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0009', 'C0011');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0010', 'C0012');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0011', 'C0013');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0012', 'C0014');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0013', 'C0015');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0014', 'C0016');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0015', 'C0017');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0005', 'C0018');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0006', 'C0019');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0007', 'C0020');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0008', 'C0021');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0009', 'C0022');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0010', 'C0023');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0011', 'C0024');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0012', 'C0025');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0013', 'C0026');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0005', 'C0027');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0006', 'C0028');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0007', 'C0029');
INSERT INTO r1111746_dierenartspraktijk.maakt( personeelslid_id, consultatie_id ) VALUES ( 'P0008', 'C0030');
