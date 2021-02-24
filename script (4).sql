-- 1- taper cd dans le terminal puis entrer; taper mysql -u root -p;
-- Create database sqliX; (surtout ne pas oublier les les ";")

-- 2- taper SHOW DATABASES; ensuite taper USE nom_de_ma_base;

-- 3- DESCRIBE province; pour aller dans une table

-- //creation de base de donnée;

-- Voici un exemple: 
--     CREATE TABLE sales.visits (
--     visit_id INT PRIMARY KEY IDENTITY (1, 1),
--     first_name VARCHAR (50) NOT NULL,
--     last_name VARCHAR (50) NOT NULL,
--     visited_at DATETIME,
--     phone VARCHAR(20),
--     store_id INT NOT NULL,
--     FOREIGN KEY (store_id) REFERENCES sales.stores (store_id)
-- );

-- //au cas ou ca existe pour etre sur d'eviter les doublons prendre l'habitude de drop;



DROP TABLE IF EXISTS province;
CREATE TABLE province  (
  num_province INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom_province VARCHAR(30) NOT NULL DEFAULT '',
  nom_gouverneur VARCHAR(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB;

Insert Into province (num_province) 
VALUES (1), (2), (3);


DROP TABLE IF EXISTS village;
CREATE TABLE village  (
  num_village INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom_village VARCHAR(30) NOT NULL DEFAULT '',
  nb_huttes INT NOT NULL DEFAULT 0,
  num_province INT NOT NULL
) ENGINE=InnoDB;

ALTER TABLE village
ADD CONSTRAINT FOREIGN KEY (num_province) REFERENCES province (num_province);


INSERT INTO village (nom_village, nb_huttes, num_province) 
VALUES ("Aquilona", 52, 1), ( "Lutèce", 25, 2), ("Aginum", 33, 3), ("Calendes Aquae", 42, 2), ("Condate", 38, 1), ("Gergovie", 55, 3), ("Aquae Calidae", 35, 2);


DROP TABLE IF EXISTS resserre;
CREATE TABLE resserre (
  num_resserre INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom_resserre VARCHAR(30) NOT NULL DEFAULT '',
  superficie INT NOT NULL DEFAULT 0,
  num_village INT NOT NULL
) ENGINE=InnoDB;

ALTER TABLE resserre
ADD CONSTRAINT FOREIGN KEY (num_village) REFERENCES village (num_village);

INSERT INTO resserre (num_resserre, nom_resserre, superficie, num_village) 
VALUES (1, "Albinus",	720,	4),
(2, "Vercingetorix",	500,	6),
(3, "Sintrof",	895,	1);


DROP TABLE IF EXISTS trophee; 
CREATE TABLE trophee  (
  num_trophee INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  date_prise DATETIME NOT NULL,
  code_cat CHAR(3),
  num_preneur INT,
  num_resserre INT
) ENGINE=InnoDB ;

ALTER TABLE trophee
ADD CONSTRAINT FOREIGN KEY (num_preneur) REFERENCES habitant (num_hab);
ALTER TABLE trophee
ADD CONSTRAINT FOREIGN KEY (num_resserre) REFERENCES resserre(num_resserre);
ALTER TABLE trophee
ADD CONSTRAINT FOREIGN KEY (code_cat) REFERENCES categorie (code_cat);


INSERT INTO trophee (date_prise, code_cat, num_preneur, num_resserre)
VALUES 
("2052-04-03 00:00:00",	"BLE",	7,	3),
("2052-04-03 00:00:00",	"BLT",	11,	3),
("2052-05-05 00:00:00",	"CDN",	15,	1),
("2052-05-05 00:00:00",	"CLE",	16,	2),
("2052-06-06 00:00:00",	"CCN",	16,	2),
("2052-06-06 00:00:00",	"BLT",	 8,	1),
("2052-08-18 00:00:00",	"CCN",	8,	1),
("2052-09-20 00:00:00",	"CLT",	1,	3),
("2052-10-23 00:00:00",	"CDN",	7,	2),
("2052-10-23 00:00:00",	"CLE",	16,	1);



DROP TABLE IF EXISTS categorie; 
CREATE TABLE categorie  (
  code_cat CHAR (3) PRIMARY KEY NOT NULL,
  nom_categ VARCHAR(50),
  nb_points INT
) ENGINE=InnoDB ;


INSERT INTO categorie (code_cat, nom_categ, nb_points)
VALUES ("BCN",	"Bouclier de Centurion",	6),
("BDN",	"Bouclier de Décurion",	4),
("BLE",	"Bouclier de Légionnaire",	3),
("BLT",	"Bouclier de Légat",	10),
("CCN",	"Casque de Centurion",	3),
("CDN",	"Casque de Décurion",	2),
("CLE",	"Casque de Légionnaire",	1),
("CLT",	"Casque de Légat",	4);




DROP TABLE IF EXISTS habitant;
CREATE TABLE habitant (
  num_hab INT PRIMARY KEY  NOT NULL AUTO_INCREMENT,
  nom VARCHAR(30),
  age INT,
  num_qualite INT,
  num_village INT
) ENGINE=InnoDB;

ALTER TABLE habitant
ADD CONSTRAINT FOREIGN KEY (num_qualite) REFERENCES qualite (num_qualite);
ALTER TABLE habitant
ADD CONSTRAINT FOREIGN KEY (num_village) REFERENCES village (num_village);


INSERT INTO habitant ( nom, age) 
VALUES 
("Abraracourcix", 65, 1, 1), ("Amnésix", 56, 2,	7), ("Barometrix", 68, 2, 3), ("Panoramix", 79,	2, 1), ("Assurancetourix", 53,	3, 1),
("Zérozérosix",	75, 2, 4), ("Astérix", 35, 4, 1), ("Bellodalix", 32, 4,	7), ("Cétyounix",	32,	4,	4), ("Homéopatix",	48,	5,	6), ("Obélix",	38,	6,	1)
("Plantaquatix", 30, 5, 5), ("Moralélastix",67,	1,	2), ("Pneumatix",	26,	7,	1), ("Pronostix",	35,	4,	5), ("Goudurix",	38,	4,	2),
("Océanix", 40,	5, 5), ("Asdepix", 53,	1, 5), ("Eponine",	48,	8,	2), ("Falbala",	26,	9,	1), ("Gélatine",	65,	NULL,	6), ("Fanzine", 21,	NULL,	3);



DROP TABLE IF EXISTS qualite;
CREATE TABLE qualite  (
  num_qualite INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  lib_qualite VARCHAR(30)
) ENGINE=InnoDB;


INSERT INTO qualite (lib_qualite)
VALUES ("Chef"), ("Druide"), ("Barde"), ("Guerrier"), ("Chasseur"), ("Livreur de menhirs"), ("Facteur"), ("Poissonnière"), ("Serveuse");


DROP TABLE IF EXISTS absorber;
CREATE TABLE absorber  (
  num_potion INT,
  date_a DATETIME PRIMARY KEY,
  num_hab INT,
  quantite INT
) ENGINE=InnoDB;

ALTER TABLE absorber
ADD CONSTRAINT FOREIGN KEY (num_hab) REFERENCES habitant (num_hab);
ALTER TABLE absorber
ADD CONSTRAINT FOREIGN KEY (num_potion) REFERENCES potion (num_potion);

A REVOIR le foreign key ne fonctionne pas

INSERT INTO absorber (num_potion, date_a, num_hab, quantite)
VALUES (1,	"2052-02-18 00:00:00",	7,	3),
(1,	"2052-02-20 00:00:00",	2,	2),
(1,	"2052-02-20 00:00:00",	8,	2),
(2,	"2052-02-18 00:00:00",	12,	4),
(3,	"2052-02-20 00:00:00",	7,	1),
(1,	"2052-04-03 00:00:00",	7,	1),
(1,	"2052-04-03 00:00:00",	15,	2),
(2,	"2052-04-03 00:00:00",	13,	5),
(3,	"2052-04-03 00:00:00",	10,	4),
(4,	"2052-05-05 00:00:00",	15,	2),
(5,	"2052-05-10 00:00:00",	1,	4),
(5,	"2052-05-10 00:00:00",	2,	1),
(1,	"2052-06-06 00:00:00",	13,	2),
(2,	"2052-06-06 00:00:00",	7,	1),
(3,	"2052-06-06 00:00:00",	8,	4),
(5,	"2052-06-07 00:00:00",	1,	2),
(5,	"2052-07-17 00:00:00",	7,	1),
(2,	"2052-07-18 00:00:00",	7,	3),
(1,	"2052-08-18 00:00:00",	8,	3),
(1,	"2052-08-18 00:00:00",	16,	1),
(3,	"2052-08-18 00:00:00",	10,	2),
(4,	"2052-08-18 00:00:00",	7,	2),
(5,	"2052-05-10 00:00:00",	2,	1),
(1,	"2052-06-06 00:00:00",	13,	2),
(2,	"2052-06-06 00:00:00",	7,	1),
(3,	"2052-06-06 00:00:00",	8,	4),
(5,	"2052-06-07 00:00:00",	1,	2),
(5,	"2052-07-17 00:00:00",	7,	1),
(2,	"2052-07-18 00:00:00",	7,	3),
(1,	"2052-08-18 00:00:00",	8,	3),
(1,	"2052-08-18 00:00:00",	16,	1),
(3,	"2052-08-18 00:00:00",	10,	2),
(4,	"2052-08-18 00:00:00",	7,	2);



DROP TABLE IF EXISTS potion;
CREATE TABLE potion (
  num_potion INT PRIMARY KEY AUTO_INCREMENT,
  lib_potion VARCHAR(40),
  formule VARCHAR(30),
  constituant_principal VARCHAR(30)
) ENGINE=InnoDB ;

INSERT INTO potion (lib_potion, formule, constituant_principal)
VALUES ("Potion magique n°1" ,	NULL,	"Gui"), ("Potion magique n°2",	"4V3C2VA", "Vin"), ("Potion magique n°3",	"2C1B",	"Calva"), ("Potion Zen",	NULL,	"Jus de Betterave"), ("Potion Anti Douleur", "5C3J1T",	"Calva");




DROP TABLE IF EXISTS fabriquer;
CREATE TABLE fabriquer (
    num_potion INT ,
    num_hab INT ,  
    PRIMARY KEY (num_potion , num_hab),
    CONSTRAINT FOREIGN KEY (num_hab) REFERENCES habitant(num_hab),
    CONSTRAINT FOREIGN KEY (num_potion) REFERENCES potion(num_potion)
)ENGINE INNODB; 