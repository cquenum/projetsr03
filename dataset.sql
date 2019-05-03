/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  cquenum
 * Created: 22 avr. 2019
 */

-- utilisateur
DROP TABLE `utilisateur`;

CREATE TABLE IF NOT EXISTS utilisateur (
		id INT AUTO_INCREMENT,
		nom VARCHAR(255) NOT NULL,
		prenom VARCHAR(255) NOT NULL,
		email VARCHAR(255) UNIQUE NOT NULL,
		pwd VARCHAR(255) NOT NULL,
		statut BOOLEAN NOT NULL,
		telephone VARCHAR(255),
		dateCreation TIMESTAMP,
		ROLE VARCHAR(255) NOT NULL,
		PRIMARY KEY (id)
);

INSERT INTO `utilisateur` (`prenom`,`nom`,`email`,`pwd`,`statut`,`telephone`,`dateCreation`,`role`) VALUES ("Admin","Admin","admi@admin.com","admin1234",1,"04 98 52 16 84","2018-09-21 21:10:47","administrateur"),("Test","Test","test@test.com","test1234",1,"08 65 33 00 89","2018-09-21 09:50:51","stagiaire"),("Stagiare","Stagiare","stagiare@stagiare.com","stagiare1234",1,"08 65 33 00 89","2018-09-21 09:50:51","stagiaire")
INSERT INTO `utilisateur` (`prenom`,`nom`,`email`,`pwd`,`statut`,`telephone`,`dateCreation`,`role`) VALUES ("Stephanie","Strong","felis.Nulla.tempor@inmolestietortor.net","QDV35UJN0TJ",1,"04 98 52 16 84","2018-09-21 21:10:47","administrateur"),("Aretha","Stafford","eros@Nullam.org","LLN47VDA9AE",0,"08 65 33 00 89","2018-09-21 09:50:51","stagiaire"),("William","Leach","non.sapien.molestie@leoinlobortis.net","GVB13VZA0RN",1,"08 04 07 49 41","2018-06-12 02:41:03","stagiaire"),("Adrienne","Mullen","Morbi.metus.Vivamus@molestie.ca","WOU50LJI8BY",0,"02 87 30 86 80","2019-07-05 02:58:29","stagiaire"),("Amery","Randolph","malesuada.Integer@etmagnisdis.ca","UXL40ZIT5LK",1,"09 42 77 27 69","2018-05-14 13:43:03","stagiaire"),("Rylee","Craft","ornare.tortor.at@necquam.co.uk","FQP76OZP5TP",0,"09 52 76 80 30","2019-10-30 23:01:11","stagiaire"),("Kristen","Gonzalez","eu.arcu@elitpellentesquea.ca","UZN79SDF2XB",0,"07 90 94 39 68","2019-11-12 00:14:02","administrateur"),("Keith","Bird","magna.malesuada.vel@egetmagna.net","GLB51PBJ1WX",1,"02 85 29 00 28","2019-03-05 13:59:49","administrateur"),("Wynne","Hill","cursus.non@tortorNunccommodo.net","OQX03XYR8WQ",1,"03 57 89 96 92","2019-03-28 06:38:02","stagiaire"),("Iona","Valenzuela","eleifend.Cras@semutdolor.net","PNI61DOC6ZS",0,"06 08 23 97 52","2018-07-14 13:57:21","administrateur");
INSERT INTO `utilisateur` (`prenom`,`nom`,`email`,`pwd`,`statut`,`telephone`,`dateCreation`,`role`) VALUES ("Velma","Chapman","ligula.elit@magnaDuis.co.uk","SRL31PJA9YG",0,"08 44 76 62 69","2018-10-28 20:44:27","administrateur"),("Jaden","Mosley","mi.Aliquam@loremvitae.org","SOY82MHX7IB",1,"05 82 18 57 91","2019-06-14 02:25:54","administrateur"),("Hakeem","Head","egestas.a.scelerisque@lectus.net","TOP70CQB8CO",0,"03 51 69 79 81","2019-03-24 01:07:59","stagiaire"),("Silas","Graham","metus.In.lorem@dolorvitaedolor.com","CPE64LRP6EL",0,"02 06 92 37 54","2018-10-05 20:33:21","administrateur"),("Quin","Sutton","cursus@nascetur.ca","MSB66RXV9VO",0,"08 20 43 90 91","2019-12-07 10:39:08","administrateur"),("Clark","Ingram","cursus@CuraePhasellusornare.org","FPF27PHM2FY",0,"03 89 38 09 96","2020-02-17 19:10:59","stagiaire"),("Kyra","Forbes","mollis.Phasellus@Donecat.net","RYC40WVI8EN",0,"01 45 72 64 01","2019-04-04 04:13:06","stagiaire"),("Armando","Vincent","Cras@sagittisaugue.ca","BLS41RUO6GL",1,"09 11 32 31 46","2020-03-14 07:25:49","administrateur"),("Anjolie","Mcbride","elementum.at.egestas@semegestasblandit.com","AAO31EKJ3FL",0,"02 18 62 38 10","2018-09-17 08:10:29","administrateur"),("Jack","Willis","sagittis@seddolor.ca","RBL31XDK2JI",1,"01 36 49 62 38","2020-02-07 09:44:12","administrateur");
INSERT INTO `utilisateur` (`prenom`,`nom`,`email`,`pwd`,`statut`,`telephone`,`dateCreation`,`role`) VALUES ("Deborah","Watts","dolor.Fusce@estmollisnon.edu","MPH10SJX1KG",1,"05 80 95 91 94","2019-03-24 23:31:32","stagiaire"),("Jolie","White","dui.Cum.sociis@ut.ca","RUI31BPN3HI",1,"05 40 48 97 99","2019-06-03 08:30:09","stagiaire"),("Buffy","Holman","Vivamus.euismod.urna@diamdictum.net","PCB93YFT4FX",0,"05 33 45 59 51","2019-01-20 19:26:45","administrateur"),("Dalton","Hale","egestas.Aliquam.nec@nectellusNunc.ca","YLN29BEC5EU",0,"06 99 57 42 05","2018-09-25 12:23:20","administrateur"),("Unity","Avila","neque.venenatis.lacus@quisaccumsan.edu","WBT29HUE3WS",0,"04 20 72 46 38","2020-01-21 04:16:19","stagiaire"),("Alea","Fisher","massa.rutrum.magna@pharetrasedhendrerit.org","XQB22CJA0UI",1,"06 50 01 22 36","2020-03-29 01:44:37","administrateur"),("Sigourney","Gallegos","vel.arcu.Curabitur@augueut.com","ZGN26AFP1DO",1,"02 89 97 23 99","2018-10-06 02:22:22","administrateur"),("Dylan","Ward","viverra@pedeetrisus.net","IZE23DYT0MP",1,"05 24 30 21 08","2019-01-17 02:22:57","administrateur"),("Mary","Campbell","risus.Nulla.eget@montes.org","CWI29QHG8LF",0,"05 69 32 19 79","2019-04-26 16:05:52","administrateur"),("Gloria","Ruiz","vitae@id.com","LXQ40QVV1GF",1,"07 45 11 16 81","2020-01-25 06:34:33","stagiaire");
INSERT INTO `utilisateur` (`prenom`,`nom`,`email`,`pwd`,`statut`,`telephone`,`dateCreation`,`role`) VALUES ("Adam","Stevens","Aliquam@interdumSed.edu","UHS61RTP0PI",0,"04 24 97 28 16","2019-08-13 10:04:33","administrateur"),("Alfreda","Christian","taciti.sociosqu@penatibus.co.uk","VOB72BKD9PO",0,"02 38 23 37 24","2019-08-22 18:39:02","stagiaire"),("Jordan","Schmidt","dolor.dapibus@nequeInornare.net","UAQ03NKT0VY",0,"06 51 76 61 40","2018-09-25 00:04:05","stagiaire"),("Brent","Massey","morbi@rutrumeuultrices.co.uk","EMQ46YLF3FE",1,"05 24 26 99 03","2018-07-19 03:40:16","administrateur"),("Iliana","Baker","quis.pede@tinciduntorci.net","VTR59ZUP0MX",0,"04 24 68 35 58","2019-10-01 08:20:27","administrateur"),("Patricia","Calderon","diam.at.pretium@Loremipsumdolor.net","IJS63WDA1LR",1,"02 51 42 08 27","2018-07-15 04:53:16","administrateur"),("Jerry","Espinoza","mauris@ligulaNullamenim.com","RLH07RLZ8CU",1,"03 60 36 38 09","2018-05-11 08:35:21","stagiaire"),("Ebony","Morrow","id@nisi.ca","IHH65XOO0ZS",0,"06 54 16 29 57","2018-09-30 01:44:29","administrateur"),("Halla","Edwards","Nunc.ullamcorper@Phasellusliberomauris.edu","YOS47KAM2AO",0,"08 49 91 99 25","2018-07-20 18:55:10","administrateur"),("Leroy","Riley","dui.semper@et.edu","YSV57NNR7LL",1,"02 72 61 11 43","2018-10-05 01:33:07","stagiaire");
INSERT INTO `utilisateur` (`prenom`,`nom`,`email`,`pwd`,`statut`,`telephone`,`dateCreation`,`role`) VALUES ("Victor","Gill","tellus@lectus.com","GRT16DDB6OC",1,"01 95 35 31 07","2019-07-30 00:24:24","stagiaire"),("Tara","Colon","elit.pellentesque.a@nislelementum.ca","PHB83NXO4OE",1,"06 42 55 24 87","2018-10-09 14:48:02","stagiaire"),("Rose","Thompson","urna.Ut.tincidunt@posuerevulputate.ca","ATW18OXX7XN",1,"01 54 93 89 87","2018-07-07 15:35:13","stagiaire"),("Aaron","Palmer","velit.egestas@posuerevulputatelacus.net","HCM05MHW4FP",0,"08 65 11 21 78","2019-04-29 03:36:24","administrateur"),("Mira","Barker","sapien@nascetur.org","TCR19GSA3WX",1,"04 35 68 94 38","2019-03-09 07:37:02","stagiaire"),("Jarrod","Stone","amet@nequevitaesemper.com","MKL82OIO0RY",1,"06 62 11 22 24","2019-10-10 15:07:47","administrateur"),("Yuri","Williams","Cum@ante.net","EAB43DTU5XP",0,"03 56 60 03 26","2018-09-15 19:05:36","stagiaire"),("Dahlia","Park","egestas@varius.org","JXN01OTC2RQ",1,"06 45 56 71 78","2019-09-08 09:55:30","stagiaire"),("Vernon","Farmer","lacus.vestibulum@enimcommodohendrerit.net","JGF91OIK3TE",1,"07 84 70 60 28","2020-03-07 00:55:27","administrateur"),("Myles","Phillips","ante.Maecenas@facilisis.ca","YFE96LTU0OY",1,"08 25 10 87 48","2019-07-15 23:28:33","stagiaire");
INSERT INTO `utilisateur` (`prenom`,`nom`,`email`,`pwd`,`statut`,`telephone`,`dateCreation`,`role`) VALUES ("Lars","Gregory","sem@sem.co.uk","GWV39JTW5LA",0,"07 87 17 05 56","2019-07-16 02:09:53","stagiaire"),("Ainsley","Hammond","Vivamus.euismod@id.co.uk","QXY81PSE1FY",1,"09 85 10 96 23","2018-07-20 19:34:43","administrateur"),("Gemma","Valentine","nisl.arcu@dapibusligulaAliquam.com","MCF56IGY9GY",0,"09 56 41 37 70","2019-10-29 11:39:34","stagiaire"),("Cheryl","Hogan","Lorem.ipsum@eleifendegestasSed.co.uk","JSI09VOC5KZ",1,"05 01 53 83 17","2018-09-29 06:10:52","stagiaire"),("Leandra","Mack","urna.Ut.tincidunt@Nullamscelerisque.ca","YCW17BYR7BH",1,"07 87 59 19 27","2019-08-02 02:53:34","stagiaire"),("Bethany","Evans","quam.Curabitur@feugiatplaceratvelit.com","MSX99UET8LA",1,"04 48 30 17 96","2019-12-01 00:03:55","stagiaire"),("Lenore","Cox","ornare@Duismienim.org","TJS51TFH2DV",0,"03 68 89 75 35","2019-10-11 20:55:44","administrateur"),("Ahmed","Montgomery","sociis@facilisisloremtristique.ca","LAS02JBF0YZ",0,"06 67 15 24 85","2019-03-19 20:39:28","stagiaire"),("Cailin","Landry","a@Vestibulumut.org","HXY00DPI8QC",0,"01 45 79 34 61","2020-03-25 04:28:22","administrateur"),("Kim","Lynch","aliquet.metus.urna@nec.co.uk","MXJ22JNB8LT",0,"06 99 23 16 45","2018-11-06 14:53:18","administrateur");
INSERT INTO `utilisateur` (`prenom`,`nom`,`email`,`pwd`,`statut`,`telephone`,`dateCreation`,`role`) VALUES ("Dominique","Roman","erat.Sed@montesnasceturridiculus.edu","UCF04CBD5FN",1,"06 20 69 85 55","2019-09-27 06:10:15","stagiaire"),("Briar","Vargas","vel@Suspendissealiquet.org","DCG29PTS5FL",1,"04 01 79 20 81","2018-05-10 00:02:41","administrateur"),("Imelda","Acevedo","velit@Phasellus.com","ENL47DFY3KZ",0,"04 33 56 84 05","2019-04-05 07:12:08","stagiaire"),("Hashim","Benton","scelerisque@risusQuisquelibero.net","LYK05MLB4SM",0,"08 86 57 27 00","2019-10-27 00:23:01","administrateur"),("Bethany","Erickson","sem.ut.dolor@Nullamsuscipitest.net","MVG26JEY6WU",0,"07 41 07 15 29","2020-02-27 10:51:05","administrateur"),("Ina","Chen","Ut@liberoInteger.edu","QNQ48MWY8LR",0,"05 34 99 08 44","2018-12-05 03:16:03","administrateur"),("Veronica","Noel","magna.malesuada.vel@in.org","ZXL44DTF6AR",1,"09 86 40 12 89","2019-09-16 18:28:34","stagiaire"),("Kai","Vaughn","metus.In@egestasadui.edu","ICB54IYC3DC",0,"02 76 44 12 15","2019-08-03 17:33:57","administrateur"),("Lesley","Rodriguez","justo.eu@massaMaurisvestibulum.ca","JMT75NZA9ZK",1,"08 73 91 05 29","2019-08-28 03:44:44","stagiaire"),("Gloria","Stevens","Morbi@blandit.co.uk","QSI43BOC0HH",1,"01 75 63 93 66","2019-09-22 15:39:04","administrateur");
INSERT INTO `utilisateur` (`prenom`,`nom`,`email`,`pwd`,`statut`,`telephone`,`dateCreation`,`role`) VALUES ("Ivana","Gardner","magna@ultricesiaculis.org","WNN32MRE7FR",1,"07 00 22 45 39","2019-09-01 08:00:16","stagiaire"),("Sage","Charles","luctus.vulputate@elementumdui.ca","WOP96QDA2YU",0,"05 54 27 33 38","2020-02-13 02:29:05","administrateur"),("Helen","Dixon","sem.Pellentesque.ut@tellusPhaselluselit.edu","FBR08NRN5TM",0,"04 07 92 87 19","2018-07-30 05:02:49","stagiaire"),("Chase","French","facilisis.facilisis.magna@auguescelerisque.com","OUQ12NAC0QA",1,"02 10 46 10 99","2019-03-12 07:00:47","stagiaire"),("Desiree","Ortega","placerat@cursusnon.edu","AFS89FEU0TM",0,"02 86 10 66 53","2019-05-12 03:35:01","administrateur"),("Margaret","Kinney","erat.Sed@quis.co.uk","RIQ02LHZ3JS",0,"05 15 08 69 36","2018-11-27 16:53:34","stagiaire"),("Larissa","Lyons","Mauris@faucibusorci.ca","CSH20MJY4IP",1,"04 45 33 99 14","2019-10-04 12:53:40","administrateur"),("Jarrod","Patton","sit@ultricesposuerecubilia.org","OHD99YYX6VP",1,"09 69 61 97 33","2019-06-20 19:54:53","administrateur"),("Kane","Pitts","Integer.vitae.nibh@velitQuisque.co.uk","LEO90UYX6MT",1,"05 23 52 77 23","2019-08-25 20:03:06","administrateur"),("Raja","Hansen","Suspendisse.tristique.neque@sedpedeCum.com","CCZ27CDH7IR",0,"05 68 30 74 74","2019-08-31 02:56:17","administrateur");
INSERT INTO `utilisateur` (`prenom`,`nom`,`email`,`pwd`,`statut`,`telephone`,`dateCreation`,`role`) VALUES ("Sasha","Vasquez","nec@ornarefacilisiseget.net","TIB78TSX1FB",1,"09 76 60 14 87","2019-12-06 17:58:58","administrateur"),("Magee","Caldwell","dictum@mauris.org","RFC47ELN4YH",0,"05 89 76 80 08","2018-06-01 03:57:19","stagiaire"),("Hilel","Ware","vulputate@risusa.edu","HBM84STT5ZJ",0,"08 11 16 53 50","2018-07-27 16:01:39","stagiaire"),("Tatyana","Hopkins","Donec.est@montesnasceturridiculus.edu","TCB28NPQ6SK",0,"06 34 01 38 22","2018-06-26 14:07:09","administrateur"),("Cody","Sloan","fringilla.cursus.purus@ametnullaDonec.org","DSO34JUD8EJ",0,"08 82 90 54 02","2019-12-21 02:45:29","stagiaire"),("Ruby","Gordon","adipiscing@sociisnatoquepenatibus.com","XZL51AUZ2IA",1,"02 35 22 88 52","2019-08-08 09:11:54","administrateur"),("Tobias","Cohen","magna.et.ipsum@sit.co.uk","UOW10QNS0GS",0,"02 40 36 57 60","2020-01-09 22:11:16","stagiaire"),("Matthew","Hutchinson","Nullam.vitae@In.org","ISF08GAK5LM",1,"01 60 87 27 62","2018-12-16 00:50:01","stagiaire"),("Lee","Nichols","dictum.Phasellus@consequatlectussit.ca","DNS50CBF9JC",0,"02 58 56 93 36","2018-04-30 15:31:30","stagiaire"),("Basia","Mcclure","a.felis@magnaPhasellus.ca","UKR48WUE8MG",0,"04 73 00 89 20","2019-11-21 09:16:03","stagiaire");
INSERT INTO `utilisateur` (`prenom`,`nom`,`email`,`pwd`,`statut`,`telephone`,`dateCreation`,`role`) VALUES ("Karleigh","Cooley","Praesent.eu@ante.co.uk","VJR51GFP3JW",0,"03 55 32 20 32","2019-03-30 08:16:49","stagiaire"),("Alisa","Mcclure","non.magna.Nam@ipsum.net","LMG26NDF9DX",1,"01 92 97 22 13","2018-10-29 15:27:04","stagiaire"),("Berk","Simpson","euismod@magnisdisparturient.net","BCZ50MLD7GW",0,"02 72 27 14 39","2019-03-28 22:35:16","administrateur"),("Jermaine","Ballard","facilisis.Suspendisse.commodo@Nullamlobortis.com","DZV82GQV3KN",1,"02 36 73 97 33","2018-12-26 20:54:06","stagiaire"),("Lydia","Foreman","orci.tincidunt@Cras.ca","ZYJ29HEE1XL",1,"03 10 22 88 35","2020-01-25 11:31:11","stagiaire"),("Chastity","Rivers","pharetra.felis@sociosquad.com","JPS12MEA5OT",1,"04 55 95 86 83","2019-03-27 13:42:54","stagiaire"),("Joshua","Chapman","ornare.placerat.orci@Suspendissesed.edu","PUN90BHX6OO",0,"05 50 63 38 64","2018-05-10 22:23:29","stagiaire"),("Yael","Fuentes","sapien.Cras.dolor@felisadipiscing.com","KUE19NHJ0YA",1,"04 04 57 00 15","2018-10-30 20:17:15","stagiaire"),("MacKenzie","Hayden","libero.Proin.sed@ullamcorpereu.org","KLE53SGG9QD",0,"04 02 82 45 77","2018-08-15 15:34:03","stagiaire"),("Amery","Weaver","ultrices@erat.net","ZVZ09AQV7DZ",0,"04 13 16 90 20","2019-08-11 00:28:06","administrateur");

-- competence
DROP TABLE `competence`;

CREATE TABLE IF NOT EXISTS competence (
		id INT AUTO_INCREMENT,
		sujet VARCHAR(255) UNIQUE NOT NULL,
		PRIMARY KEY (id)
);
INSERT INTO `competence` (`sujet`) VALUES ('HTML'),('JSP'),('MySQL'),('Tomcat'),('Weblogic'),('WebSphere'),('LINUX'),('PHP');
INSERT INTO `competence` (`sujet`) VALUES ("AMAZON AWS"),("ANDROID"),("APACHE"),("API"),("AS400"), ("BI"), ("BIG DATA"), ("C"), ("Cloud AWS"), ("DATASTAGE"), ("JAVA");
INSERT INTO `competence` (`sujet`) VALUES ("ORACLE"),("MS-DOS"),("MAC OS"),("LAMP"), ("Kubernetes"), ("JUNIPER"), ("JQUERY"), ("JMS"), ("JAVASCRIPT"), ("JBOSS");

-- questionnaire
DROP TABLE `questionnaire`;

CREATE TABLE IF NOT EXISTS questionnaire (
		id INT AUTO_INCREMENT,
		valeur VARCHAR(255) UNIQUE NOT NULL,
		statut BOOLEAN,
		id_competence int,
		FOREIGN KEY (id_competence) REFERENCES competence (id),
		PRIMARY KEY (id)
);

-- question
DROP TABLE `question`;

CREATE TABLE IF NOT EXISTS question (
		id INT AUTO_INCREMENT,
		valeur VARCHAR(255) NOT NULL,
		statut BOOLEAN,
		id_questionnaire int,
		FOREIGN KEY (id_questionnaire) REFERENCES questionnaire (id),
		PRIMARY KEY (id)
);

-- reponse
DROP TABLE `reponse`;

CREATE TABLE IF NOT EXISTS reponse (
		id INT AUTO_INCREMENT,
		valeur VARCHAR(255) NOT NULL,
		statut BOOLEAN,
		bonne BOOLEAN,
		id_question int,
		FOREIGN KEY (id_question) REFERENCES question (id),
		PRIMARY KEY (id)
);

-- Data

-- QCM HTML
INSERT INTO `questionnaire` (`valeur`, `statut`, `id_competence`) VALUES ("QCM HTML",1,1);
INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Que signifie HTML?",1,1);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Hyper Technology Mixed Language",1,0,1);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("HyperText Markup Language",1,1,1);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Hot Text Mapping Language",1,0,1);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Je ne sais pas",1,0,1);

INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Quand le langage HTML a-t-il été créé ?",1,1);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("1970",1,0,2);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("1986",1,0,2);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("1990",1,1,2);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("2000",1,0,2);

INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Qui est l'inventeur du langage HTML ?",1,1);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Bill Gates",1,0,3);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Tim Berners-Lee",1,1,3);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Emmanuel Gérard",1,0,3);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Emmanuel Macron",1,0,3);

INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Avec quelles balises pouvez changer le texte en gras ?",1,1);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("<br></br>",1,0,4);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("<b></b>",1,1,4);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("<p></p>",1,0,4);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("<gras></gras>",1,0,4);

INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Si j'utilise la balise <blink> que va-t-il se passer ?",1,1);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("le texte sera rayé",1,0,5);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("le texte sera en surbrillance",1,0,5);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("le texte clignotera",1,1,5);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("le texte sera invisible",1,0,5);

INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Si je tape &eacute;, quelle lettre vais-je obtenir ?",1,1);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("è",1,0,6);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("é",1,1,6);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("ê",1,0,6);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("e",1,0,6);

INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Quel est le code hexadécimal de la couleur rouge ?",1,1);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("#00FF00",1,0,7);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("#0000FF",1,0,7);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("#FF0000",1,1,7);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("#000000",1,0,7);

INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Comment puis-je transformer une image en zône cliquable ?",1,1);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("<A HREF="adresse"><IMG SRC="..."></A>",1,1,8);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("<A HREF="adresse" IMG SRC="..."></A>",1,0,8);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("<A HREF= IMG SRC="..."></A>",1,0,8);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("<IMG SRC="..."></IMG>",1,0,8);

INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("A quoi sert l'option VLINK dans la balise BODY ?",1,1);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("à positionner la couleur d'un lien qui n'a pas encore été visité",1,0,9);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("à positionner la couleur d'un lien au moment où l'on clique dessus",1,0,9);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("à positionner la couleur d'un lien qui a déjà été visité",1,1,9);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Je ne sais pas",1,1,9);

INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Quelle est la couleur par défaut de l'option ALINK dans la balise BODY ?",1,1);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("rouge",1,0,10);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("violet",1,0,10);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("bleu",1,1,10);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("noire",1,0,10);

-- QCM Java – Programmation Orientée Objet
INSERT INTO `questionnaire` (`valeur`, `statut`, `id_competence`) VALUES ("QCM Java – Programmation Orientée Objet",1,19);

INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Lequel des éléments suivants n’est pas un concept POO en Java?",1,2);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Héritage",1,0,11);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Encapsulation",1,0,11);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Polymorphisme",1,0,11);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Compilation",1,1,11);

INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Quand la surcharge de méthode est-elle déterminée?",1,2);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Au moment de l’exécution",1,0,12);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Au moment de la compilation",1,0,12);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Au moment du codage",1,1,12);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Au moment de l’exécution",1,0,12);

INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Quand la surcharge ne se produit pas?",1,2);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Quand il y a plusieurs méthodes avec le même nom mais avec une signature de méthode différente et un nombre ou un type de paramètres différent",1,0,13);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Quand il y a plusieurs méthodes avec le même nom, le même nombre de paramètres et le type mais une signature différente",1,1,13);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Quand il y a plusieurs méthodes avec le même nom, la même signature, le même nombre de paramètres mais un type différent",1,0,13);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Quand il y a plusieurs méthodes avec le même nom, la même signature mais avec différente signature",1,0,13);

INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Quel concept de Java est un moyen de convertir des objets du monde réel en termes de classe?",1,2);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Polymorphisme",1,0,14);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Encapsulation",1,0,14);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Abstraction",1,1,14);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Héritage",1,0,14);


INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Quel concept de Java est utilisé en combinant des méthodes et des attributs dans une classe?",1,2);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Agrégation",1,0,15);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Composition",1,1,15);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Encapsulation",1,0,15);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Association",1,0,15);

INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Comment ça s’appelle si un objet a son propre cycle de vie?",1,2);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Agrégation",1,0,16);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Composition",1,0,16);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Encapsulation",0,1,16);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Association",1,1,16);


INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Comment s’appelle-t-on dans le cas où l’objet d’une classe mère est détruit donc l’objet d’une classe fille sera détruit également?",1,2);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Agrégation",1,0,17);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Composition",1,1,17);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Encapsulation",0,1,17);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Association",1,0,17);

INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Comment s’appelle-t-on l’objet a son propre cycle de vie et l’objet d’une classe fille ne dépend pas à un autre objet d’une classe mère?",1,2);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Agrégation",1,1,18);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Composition",1,0,18);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Encapsulation",1,0,18);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Association",1,0,18);

INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("La surcharge d’une méthode peut remplacer l’héritage et le polymorphisme?",1,2);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Vrai",1,1,19);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Faux",1,0,19);

INSERT INTO `question` (`valeur`, `statut`, `id_questionnaire`) VALUES ("Quels keywords sont utilisés pour spécifier la visibilité des propriétés et des méthodes ?",1,2);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("final",1,0,20);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("Composition",1,0,20);
INSERT INTO `reponse` (`valeur`, `statut`, bonne, `id_question`) VALUES ("private",1,1,20);


