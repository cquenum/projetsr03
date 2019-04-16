/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  cquenum
 * Created: 15 avr. 2019
 */

CREATE TABLE IF NOT EXISTS utilisateur (
		id INT AUTO_INCREMENT,
		nom VARCHAR(255) NOT NULL,
		prenom VARCHAR(255) NOT NULL,
		email VARCHAR(255) NOT NULL,
		pwd VARCHAR(255) NOT NULL,
		statut BOOLEAN NOT NULL,
		telephone VARCHAR(255),
		dateCreation DATE,
		ROLE VARCHAR(255) NOT NULL,
		PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS competence (
		id INT AUTO_INCREMENT,
		sujet VARCHAR(255) UNIQUE NOT NULL,
		PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS questionnaire (
		id INT AUTO_INCREMENT,
		valeur VARCHAR(255) NOT NULL,
		statut BOOLEAN,
		id_competence int,
		FOREIGN KEY (id_competence) REFERENCES competence (id),
		PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS question (
		id INT AUTO_INCREMENT,
		valeur VARCHAR(255) NOT NULL,
		statut BOOLEAN,
		id_questionnaire int,
		FOREIGN KEY (id_questionnaire) REFERENCES questionnaire (id),
		PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS reponse (
		id INT AUTO_INCREMENT,
		valeur VARCHAR(255) NOT NULL,
		satut BOOLEAN,
		bonne BOOLEAN,
		id_question int,
		FOREIGN KEY (id_question) REFERENCES question (id),
		PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS parcours (
		id INT AUTO_INCREMENT,
		score INT,
		duree INT,
		id_utilisateur INT,
		id_questionnaire INT,
		FOREIGN KEY (id_utilisateur) REFERENCES utilisateur (id),
		FOREIGN KEY (id_questionnaire) REFERENCES questionnaire (id),
		PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS parcours_reponse (
		id_parcours INT,
		id_reponse INT,
		FOREIGN KEY (id_parcours) REFERENCES parcours (id),
		FOREIGN KEY (id_reponse) REFERENCES reponse (id)
);

