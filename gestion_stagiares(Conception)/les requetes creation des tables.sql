create database gestion_stagiaires
use gestion_stagiaires

create table services(id_service int primary key auto_increment,
nom_serv varchar(250),
chef_serv varchar(250))ENGINE=INNODB;

create table fonction_enc(id_fonct int primary key auto_increment,
nom_fonct varchar(250))ENGINE=INNODB;


create table encadreurs(matricule int primary key auto_increment,
id_fonct int,
nom_enc varchar(250),
prenom_enc varchar(250),
sex boolean,
tele char(11),
foreign key(id_fonct) references fonction_enc(id_fonct)
)ENGINE=INNODB;

create table utilisateurs(id_user int primary key auto_increment,
nom_user varchar(250),
prenom_user varchar(250),
login varchar(250),
password varchar(250),
role varchar(50))ENGINE=INNODB;

create table stagiaires(cin char(9) primary key,
id_service int,
matricule int,
nom varchar(50),
prenom varchar(50),
sexe boolean,
deate_nss date,
etab varchar(250),
CV varchar(250),
email varchar(250),
niveau varchar(250),
foreign key(id_service) references services(id_service),
foreign key(matricule) references encadreurs(matricule))ENGINE=INNODB;

create table absence(id_abs int primary key auto_increment,
cin char(9),
date_D date,
date_F date,
justification varchar(250),
foreign key(cin) references stagiaires(cin)
)ENGINE=INNODB;

create table stage(id_stg int primary key auto_increment,
type_stage varchar(250),
titre_sujet varchar(50),
desc_sujet text)ENGINE=INNODB;

create table affectation(cin char(9),
id_stg int,
date_D date,
date_F date,
eta_avancement varchar(50),
foreign key(cin) references stagiaires(cin),
foreign key(id_stg) references stage(id_stg),
CONSTRAINT pK_2 PRIMARY KEY(cin,id_stg))ENGINE=InnoDB;


