-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  Dim 05 mai 2019 à 20:44
-- Version du serveur :  8.0.13-4
-- Version de PHP :  7.2.17-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `mVklwn0hfR`
--

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

CREATE TABLE `competence` (
  `id` int(11) NOT NULL,
  `sujet` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `competence`
--

INSERT INTO `competence` (`id`, `sujet`) VALUES
(9, 'AMAZON AWS'),
(10, 'ANDROID'),
(11, 'APACHE'),
(12, 'API'),
(13, 'AS400'),
(14, 'BI'),
(15, 'BIG DATA'),
(16, 'C'),
(17, 'Cloud AWS'),
(18, 'DATASTAGE'),
(1, 'HTML'),
(19, 'JAVA'),
(39, 'JAVASCRIPT'),
(40, 'JBOSS'),
(38, 'JMS'),
(37, 'JQUERY'),
(2, 'JSP'),
(36, 'JUNIPER'),
(35, 'Kubernetes'),
(34, 'LAMP'),
(7, 'LINUX'),
(33, 'MAC OS'),
(32, 'MS-DOS'),
(3, 'MySQL'),
(31, 'ORACLE'),
(8, 'PHP'),
(4, 'Tomcat'),
(5, 'Weblogic'),
(6, 'WebSphere');

-- --------------------------------------------------------

--
-- Structure de la table `parcours`
--

CREATE TABLE `parcours` (
  `id` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `id_questionnaire` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `parcours`
--

INSERT INTO `parcours` (`id`, `score`, `duree`, `id_utilisateur`, `id_questionnaire`) VALUES
(1, 0, 0, 92, 2),
(2, 0, 0, 92, 1);

-- --------------------------------------------------------

--
-- Structure de la table `parcours_reponse`
--

CREATE TABLE `parcours_reponse` (
  `id_parcours` int(11) NOT NULL,
  `id_reponse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `valeur` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `statut` tinyint(1) DEFAULT NULL,
  `id_questionnaire` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id`, `valeur`, `statut`, `id_questionnaire`) VALUES
(1, 'Que signifie HTML?', 1, 1),
(2, 'Quand le langage HTML a-t-il été créé ?', 1, 1),
(3, 'Qui est l\'inventeur du langage HTML ?', 1, 1),
(4, 'Avec quelles balises pouvez changer le texte en gras ?', 1, 1),
(5, 'Si j\'utilise la balise <blink> que va-t-il se passer ?', 1, 1),
(6, 'Si je tape &eacute;, quelle lettre vais-je obtenir ?', 1, 1),
(7, 'Quel est le code hexadécimal de la couleur rouge ?', 1, 1),
(8, 'Comment puis-je transformer une image en zône cliquable ?', 1, 1),
(9, 'A quoi sert l\'option VLINK dans la balise BODY ?', 1, 1),
(10, 'Quelle est la couleur par défaut de l\'option ALINK dans la balise BODY ?', 1, 1),
(11, 'Lequel des éléments suivants n’est pas un concept POO en Java?', 1, 2),
(12, 'Quand la surcharge de méthode est-elle déterminée?', 1, 2),
(13, 'Quand la surcharge ne se produit pas?', 1, 2),
(14, 'Quel concept de Java est un moyen de convertir des objets du monde réel en termes de classe?', 1, 2),
(15, 'Quel concept de Java est utilisé en combinant des méthodes et des attributs dans une classe?', 1, 2),
(16, 'Comment ça s’appelle si un objet a son propre cycle de vie?', 1, 2),
(17, 'Comment s’appelle-t-on dans le cas où l’objet d’une classe mère est détruit donc l’objet d’une classe fille sera détruit également?', 1, 2),
(18, 'Comment s’appelle-t-on l’objet a son propre cycle de vie et l’objet d’une classe fille ne dépend pas à un autre objet d’une classe mère?', 1, 2),
(19, 'La surcharge d’une méthode peut remplacer l’héritage et le polymorphisme?', 1, 2),
(20, 'Quels keywords sont utilisés pour spécifier la visibilité des propriétés et des méthodes ?', 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `questionnaire`
--

CREATE TABLE `questionnaire` (
  `id` int(11) NOT NULL,
  `valeur` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `statut` tinyint(1) DEFAULT NULL,
  `id_competence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `questionnaire`
--

INSERT INTO `questionnaire` (`id`, `valeur`, `statut`, `id_competence`) VALUES
(1, 'QCM HTML', 1, 1),
(2, 'QCM Java – Programmation Orientée Objet', 1, 19);

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE `reponse` (
  `id` int(11) NOT NULL,
  `valeur` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `statut` tinyint(1) DEFAULT NULL,
  `bonne` tinyint(1) DEFAULT NULL,
  `id_question` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`id`, `valeur`, `statut`, `bonne`, `id_question`) VALUES
(55, 'Hyper Technology Mixed Language', 1, 0, 1),
(56, 'HyperText Markup Language', 1, 1, 1),
(57, 'Hot Text Mapping Language', 1, 0, 1),
(58, '1970', 1, 0, 2),
(59, '1986', 1, 0, 2),
(60, '1990', 1, 1, 2),
(61, 'Bill Gates', 1, 0, 3),
(62, 'Tim Berners-Lee', 1, 1, 3),
(63, 'Emmanuel Gérard', 1, 0, 3),
(64, '<br></br>', 1, 0, 4),
(65, '<b></b>', 1, 1, 4),
(66, '<p></p>', 1, 0, 4),
(67, 'le texte sera rayé', 1, 0, 5),
(68, 'le texte sera en surbrillance', 1, 1, 5),
(69, 'le texte clignotera', 1, 0, 5),
(70, 'è', 1, 1, 6),
(71, 'é', 1, 0, 6),
(72, 'ê', 1, 0, 6),
(73, '#00FF00', 1, 0, 7),
(74, '#0000FF', 1, 0, 7),
(75, '#FF0000', 1, 1, 7),
(76, 'à positionner la couleur d\'un lien qui n\'a pas encore été visité', 1, 0, 9),
(77, 'à positionner la couleur d\'un lien au moment où l\'on clique dessus', 1, 0, 9),
(78, 'à positionner la couleur d\'un lien qui a déjà été visité', 1, 1, 9),
(79, 'rouge', 1, 0, 10),
(80, 'violet', 1, 0, 10),
(81, 'bleu', 1, 1, 10),
(82, 'Je ne sais pas', 1, 0, 1),
(83, '2000', 1, 0, 2),
(84, 'Emmanuel Macron', 1, 0, 3),
(85, '<gras></gras>', 1, 0, 4),
(86, 'le texte sera invisible', 1, 0, 5),
(87, 'e', 1, 0, 6),
(88, '#000000', 1, 0, 7),
(89, 'Je ne sais pas', 1, 1, 9),
(90, 'noire', 1, 0, 10),
(91, 'Héritage', 1, 0, 11),
(92, 'Encapsulation', 1, 0, 11),
(93, 'Polymorphisme', 1, 0, 11),
(94, 'Compilation', 1, 1, 11),
(95, 'Au moment de l’exécution', 1, 0, 12),
(96, 'Au moment de la compilation', 1, 0, 12),
(97, 'Au moment du codage', 1, 1, 12),
(98, 'Au moment de l’exécution', 1, 0, 12),
(99, 'Quand il y a plusieurs méthodes avec le même nom mais avec une signature de méthode différente et un nombre ou un type de paramètres différent', 1, 0, 13),
(100, 'Quand il y a plusieurs méthodes avec le même nom, le même nombre de paramètres et le type mais une signature différente', 1, 1, 13),
(101, 'Quand il y a plusieurs méthodes avec le même nom, la même signature, le même nombre de paramètres mais un type différent', 1, 0, 13),
(102, 'Quand il y a plusieurs méthodes avec le même nom, la même signature mais avec différente signature', 1, 0, 13),
(103, 'Polymorphisme', 1, 0, 14),
(104, 'Encapsulation', 1, 0, 14),
(105, 'Abstraction', 1, 1, 14),
(106, 'Héritage', 1, 0, 14),
(107, 'Agrégation', 1, 0, 15),
(108, 'Composition', 1, 1, 15),
(109, 'Encapsulation', 1, 0, 15),
(110, 'Association', 1, 0, 15),
(111, 'Agrégation', 1, 0, 16),
(112, 'Composition', 1, 0, 16),
(113, 'Encapsulation', 0, 1, 16),
(114, 'Association', 1, 1, 16),
(115, 'Agrégation', 1, 0, 17),
(116, 'Composition', 1, 1, 17),
(117, 'Encapsulation', 0, 1, 17),
(118, 'Association', 1, 0, 17),
(119, 'Agrégation', 1, 1, 18),
(120, 'Composition', 1, 0, 18),
(121, 'Encapsulation', 1, 0, 18),
(122, 'Association', 1, 0, 18),
(123, 'Vrai', 1, 1, 19),
(124, 'Faux', 1, 0, 19),
(125, 'final', 1, 0, 20),
(126, 'Composition', 1, 0, 20),
(127, 'private', 1, 1, 20),
(128, '<IMG SRC=\"...\"></IMG>', 1, 0, 8);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pwd` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreation` timestamp NULL DEFAULT NULL,
  `ROLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `email`, `pwd`, `statut`, `telephone`, `dateCreation`, `ROLE`) VALUES
(1, 'Chapman', 'Velma', 'ligula.elit@magnaDuis.co.uk', 'SRL31PJA9YG', 0, '08 44 76 62 69', '2018-10-28 20:44:27', 'administrateur'),
(2, 'Mosley', 'Jaden', 'mi.Aliquam@loremvitae.org', 'SOY82MHX7IB', 1, '05 82 18 57 91', '2019-06-14 02:25:54', 'administrateur'),
(3, 'Head', 'Hakeem', 'egestas.a.scelerisque@lectus.net', 'TOP70CQB8CO', 0, '03 51 69 79 81', '2019-03-24 01:07:59', 'stagiaire'),
(4, 'Graham', 'Silas', 'metus.In.lorem@dolorvitaedolor.com', 'CPE64LRP6EL', 0, '02 06 92 37 54', '2018-10-05 20:33:21', 'administrateur'),
(5, 'Sutton', 'Quin', 'cursus@nascetur.ca', 'MSB66RXV9VO', 0, '08 20 43 90 91', '2019-12-07 10:39:08', 'administrateur'),
(6, 'Ingram', 'Clark', 'cursus@CuraePhasellusornare.org', 'FPF27PHM2FY', 0, '03 89 38 09 96', '2020-02-17 19:10:59', 'stagiaire'),
(7, 'Forbes', 'Kyra', 'mollis.Phasellus@Donecat.net', 'RYC40WVI8EN', 0, '01 45 72 64 01', '2019-04-04 04:13:06', 'stagiaire'),
(8, 'Vincent', 'Armando', 'Cras@sagittisaugue.ca', 'BLS41RUO6GL', 1, '09 11 32 31 46', '2020-03-14 07:25:49', 'administrateur'),
(9, 'Mcbride', 'Anjolie', 'elementum.at.egestas@semegestasblandit.com', 'AAO31EKJ3FL', 0, '02 18 62 38 10', '2018-09-17 08:10:29', 'administrateur'),
(10, 'Willis', 'Jack', 'sagittis@seddolor.ca', 'RBL31XDK2JI', 1, '01 36 49 62 38', '2020-02-07 09:44:12', 'administrateur'),
(11, 'Watts', 'Deborah', 'dolor.Fusce@estmollisnon.edu', 'MPH10SJX1KG', 1, '05 80 95 91 94', '2019-03-24 23:31:32', 'stagiaire'),
(12, 'White', 'Jolie', 'dui.Cum.sociis@ut.ca', 'RUI31BPN3HI', 1, '05 40 48 97 99', '2019-06-03 08:30:09', 'stagiaire'),
(13, 'Holman', 'Buffy', 'Vivamus.euismod.urna@diamdictum.net', 'PCB93YFT4FX', 0, '05 33 45 59 51', '2019-01-20 19:26:45', 'administrateur'),
(14, 'Hale', 'Dalton', 'egestas.Aliquam.nec@nectellusNunc.ca', 'YLN29BEC5EU', 0, '06 99 57 42 05', '2018-09-25 12:23:20', 'administrateur'),
(15, 'Avila', 'Unity', 'neque.venenatis.lacus@quisaccumsan.edu', 'WBT29HUE3WS', 0, '04 20 72 46 38', '2020-01-21 04:16:19', 'stagiaire'),
(16, 'Fisher', 'Alea', 'massa.rutrum.magna@pharetrasedhendrerit.org', 'XQB22CJA0UI', 1, '06 50 01 22 36', '2020-03-29 01:44:37', 'administrateur'),
(17, 'Gallegos', 'Sigourney', 'vel.arcu.Curabitur@augueut.com', 'ZGN26AFP1DO', 1, '02 89 97 23 99', '2018-10-06 02:22:22', 'administrateur'),
(18, 'Ward', 'Dylan', 'viverra@pedeetrisus.net', 'IZE23DYT0MP', 1, '05 24 30 21 08', '2019-01-17 02:22:57', 'administrateur'),
(19, 'Campbell', 'Mary', 'risus.Nulla.eget@montes.org', 'CWI29QHG8LF', 0, '05 69 32 19 79', '2019-04-26 16:05:52', 'administrateur'),
(20, 'Ruiz', 'Gloria', 'vitae@id.com', 'LXQ40QVV1GF', 1, '07 45 11 16 81', '2020-01-25 06:34:33', 'stagiaire'),
(21, 'Stevens', 'Adam', 'Aliquam@interdumSed.edu', 'UHS61RTP0PI', 0, '04 24 97 28 16', '2019-08-13 10:04:33', 'administrateur'),
(22, 'Christian', 'Alfreda', 'taciti.sociosqu@penatibus.co.uk', 'VOB72BKD9PO', 0, '02 38 23 37 24', '2019-08-22 18:39:02', 'stagiaire'),
(23, 'Schmidt', 'Jordan', 'dolor.dapibus@nequeInornare.net', 'UAQ03NKT0VY', 0, '06 51 76 61 40', '2018-09-25 00:04:05', 'stagiaire'),
(24, 'Massey', 'Brent', 'morbi@rutrumeuultrices.co.uk', 'EMQ46YLF3FE', 1, '05 24 26 99 03', '2018-07-19 03:40:16', 'administrateur'),
(25, 'Baker', 'Iliana', 'quis.pede@tinciduntorci.net', 'VTR59ZUP0MX', 0, '04 24 68 35 58', '2019-10-01 08:20:27', 'administrateur'),
(26, 'Calderon', 'Patricia', 'diam.at.pretium@Loremipsumdolor.net', 'IJS63WDA1LR', 1, '02 51 42 08 27', '2018-07-15 04:53:16', 'administrateur'),
(27, 'Espinoza', 'Jerry', 'mauris@ligulaNullamenim.com', 'RLH07RLZ8CU', 1, '03 60 36 38 09', '2018-05-11 08:35:21', 'stagiaire'),
(28, 'Morrow', 'Ebony', 'id@nisi.ca', 'IHH65XOO0ZS', 0, '06 54 16 29 57', '2018-09-30 01:44:29', 'administrateur'),
(29, 'Edwards', 'Halla', 'Nunc.ullamcorper@Phasellusliberomauris.edu', 'YOS47KAM2AO', 0, '08 49 91 99 25', '2018-07-20 18:55:10', 'administrateur'),
(30, 'Riley', 'Leroy', 'dui.semper@et.edu', 'YSV57NNR7LL', 1, '02 72 61 11 43', '2018-10-05 01:33:07', 'stagiaire'),
(31, 'Gill', 'Victor', 'tellus@lectus.com', 'GRT16DDB6OC', 1, '01 95 35 31 07', '2019-07-30 00:24:24', 'stagiaire'),
(32, 'Colon', 'Tara', 'elit.pellentesque.a@nislelementum.ca', 'PHB83NXO4OE', 1, '06 42 55 24 87', '2018-10-09 14:48:02', 'stagiaire'),
(33, 'Thompson', 'Rose', 'urna.Ut.tincidunt@posuerevulputate.ca', 'ATW18OXX7XN', 1, '01 54 93 89 87', '2018-07-07 15:35:13', 'stagiaire'),
(34, 'Palmer', 'Aaron', 'velit.egestas@posuerevulputatelacus.net', 'HCM05MHW4FP', 0, '08 65 11 21 78', '2019-04-29 03:36:24', 'administrateur'),
(35, 'Barker', 'Mira', 'sapien@nascetur.org', 'TCR19GSA3WX', 1, '04 35 68 94 38', '2019-03-09 07:37:02', 'stagiaire'),
(36, 'Stone', 'Jarrod', 'amet@nequevitaesemper.com', 'MKL82OIO0RY', 1, '06 62 11 22 24', '2019-10-10 15:07:47', 'administrateur'),
(37, 'Williams', 'Yuri', 'Cum@ante.net', 'EAB43DTU5XP', 0, '03 56 60 03 26', '2018-09-15 19:05:36', 'stagiaire'),
(38, 'Park', 'Dahlia', 'egestas@varius.org', 'JXN01OTC2RQ', 1, '06 45 56 71 78', '2019-09-08 09:55:30', 'stagiaire'),
(39, 'Farmer', 'Vernon', 'lacus.vestibulum@enimcommodohendrerit.net', 'JGF91OIK3TE', 1, '07 84 70 60 28', '2020-03-07 00:55:27', 'administrateur'),
(40, 'Phillips', 'Myles', 'ante.Maecenas@facilisis.ca', 'YFE96LTU0OY', 1, '08 25 10 87 48', '2019-07-15 23:28:33', 'stagiaire'),
(41, 'Gregory', 'Lars', 'sem@sem.co.uk', 'GWV39JTW5LA', 0, '07 87 17 05 56', '2019-07-16 02:09:53', 'stagiaire'),
(42, 'Hammond', 'Ainsley', 'Vivamus.euismod@id.co.uk', 'QXY81PSE1FY', 1, '09 85 10 96 23', '2018-07-20 19:34:43', 'administrateur'),
(43, 'Valentine', 'Gemma', 'nisl.arcu@dapibusligulaAliquam.com', 'MCF56IGY9GY', 0, '09 56 41 37 70', '2019-10-29 11:39:34', 'stagiaire'),
(44, 'Hogan', 'Cheryl', 'Lorem.ipsum@eleifendegestasSed.co.uk', 'JSI09VOC5KZ', 1, '05 01 53 83 17', '2018-09-29 06:10:52', 'stagiaire'),
(45, 'Mack', 'Leandra', 'urna.Ut.tincidunt@Nullamscelerisque.ca', 'YCW17BYR7BH', 1, '07 87 59 19 27', '2019-08-02 02:53:34', 'stagiaire'),
(46, 'Evans', 'Bethany', 'quam.Curabitur@feugiatplaceratvelit.com', 'MSX99UET8LA', 1, '04 48 30 17 96', '2019-12-01 00:03:55', 'stagiaire'),
(47, 'Cox', 'Lenore', 'ornare@Duismienim.org', 'TJS51TFH2DV', 0, '03 68 89 75 35', '2019-10-11 20:55:44', 'administrateur'),
(48, 'Montgomery', 'Ahmed', 'sociis@facilisisloremtristique.ca', 'LAS02JBF0YZ', 0, '06 67 15 24 85', '2019-03-19 20:39:28', 'stagiaire'),
(49, 'Landry', 'Cailin', 'a@Vestibulumut.org', 'HXY00DPI8QC', 0, '01 45 79 34 61', '2020-03-25 04:28:22', 'administrateur'),
(50, 'Lynch', 'Kim', 'aliquet.metus.urna@nec.co.uk', 'MXJ22JNB8LT', 0, '06 99 23 16 45', '2018-11-06 14:53:18', 'administrateur'),
(51, 'Roman', 'Dominique', 'erat.Sed@montesnasceturridiculus.edu', 'UCF04CBD5FN', 1, '06 20 69 85 55', '2019-09-27 06:10:15', 'stagiaire'),
(52, 'Vargas', 'Briar', 'vel@Suspendissealiquet.org', 'DCG29PTS5FL', 1, '04 01 79 20 81', '2018-05-10 00:02:41', 'administrateur'),
(53, 'Acevedo', 'Imelda', 'velit@Phasellus.com', 'ENL47DFY3KZ', 0, '04 33 56 84 05', '2019-04-05 07:12:08', 'stagiaire'),
(54, 'Benton', 'Hashim', 'scelerisque@risusQuisquelibero.net', 'LYK05MLB4SM', 0, '08 86 57 27 00', '2019-10-27 00:23:01', 'administrateur'),
(55, 'Erickson', 'Bethany', 'sem.ut.dolor@Nullamsuscipitest.net', 'MVG26JEY6WU', 0, '07 41 07 15 29', '2020-02-27 10:51:05', 'administrateur'),
(56, 'Chen', 'Ina', 'Ut@liberoInteger.edu', 'QNQ48MWY8LR', 0, '05 34 99 08 44', '2018-12-05 03:16:03', 'administrateur'),
(57, 'Noel', 'Veronica', 'magna.malesuada.vel@in.org', 'ZXL44DTF6AR', 1, '09 86 40 12 89', '2019-09-16 18:28:34', 'stagiaire'),
(58, 'Vaughn', 'Kai', 'metus.In@egestasadui.edu', 'ICB54IYC3DC', 0, '02 76 44 12 15', '2019-08-03 17:33:57', 'administrateur'),
(59, 'Rodriguez', 'Lesley', 'justo.eu@massaMaurisvestibulum.ca', 'JMT75NZA9ZK', 1, '08 73 91 05 29', '2019-08-28 03:44:44', 'stagiaire'),
(60, 'Stevens', 'Gloria', 'Morbi@blandit.co.uk', 'QSI43BOC0HH', 1, '01 75 63 93 66', '2019-09-22 15:39:04', 'administrateur'),
(61, 'Gardner', 'Ivana', 'magna@ultricesiaculis.org', 'WNN32MRE7FR', 1, '07 00 22 45 39', '2019-09-01 08:00:16', 'stagiaire'),
(62, 'Charles', 'Sage', 'luctus.vulputate@elementumdui.ca', 'WOP96QDA2YU', 0, '05 54 27 33 38', '2020-02-13 02:29:05', 'administrateur'),
(63, 'Dixon', 'Helen', 'sem.Pellentesque.ut@tellusPhaselluselit.edu', 'FBR08NRN5TM', 0, '04 07 92 87 19', '2018-07-30 05:02:49', 'stagiaire'),
(64, 'French', 'Chase', 'facilisis.facilisis.magna@auguescelerisque.com', 'OUQ12NAC0QA', 1, '02 10 46 10 99', '2019-03-12 07:00:47', 'stagiaire'),
(65, 'Ortega', 'Desiree', 'placerat@cursusnon.edu', 'AFS89FEU0TM', 0, '02 86 10 66 53', '2019-05-12 03:35:01', 'administrateur'),
(66, 'Kinney', 'Margaret', 'erat.Sed@quis.co.uk', 'RIQ02LHZ3JS', 0, '05 15 08 69 36', '2018-11-27 16:53:34', 'stagiaire'),
(67, 'Lyons', 'Larissa', 'Mauris@faucibusorci.ca', 'CSH20MJY4IP', 1, '04 45 33 99 14', '2019-10-04 12:53:40', 'administrateur'),
(68, 'Patton', 'Jarrod', 'sit@ultricesposuerecubilia.org', 'OHD99YYX6VP', 1, '09 69 61 97 33', '2019-06-20 19:54:53', 'administrateur'),
(69, 'Pitts', 'Kane', 'Integer.vitae.nibh@velitQuisque.co.uk', 'LEO90UYX6MT', 1, '05 23 52 77 23', '2019-08-25 20:03:06', 'administrateur'),
(70, 'Hansen', 'Raja', 'Suspendisse.tristique.neque@sedpedeCum.com', 'CCZ27CDH7IR', 0, '05 68 30 74 74', '2019-08-31 02:56:17', 'administrateur'),
(71, 'Vasquez', 'Sasha', 'nec@ornarefacilisiseget.net', 'TIB78TSX1FB', 1, '09 76 60 14 87', '2019-12-06 17:58:58', 'administrateur'),
(72, 'Caldwell', 'Magee', 'dictum@mauris.org', 'RFC47ELN4YH', 0, '05 89 76 80 08', '2018-06-01 03:57:19', 'stagiaire'),
(73, 'Ware', 'Hilel', 'vulputate@risusa.edu', 'HBM84STT5ZJ', 0, '08 11 16 53 50', '2018-07-27 16:01:39', 'stagiaire'),
(74, 'Hopkins', 'Tatyana', 'Donec.est@montesnasceturridiculus.edu', 'TCB28NPQ6SK', 0, '06 34 01 38 22', '2018-06-26 14:07:09', 'administrateur'),
(75, 'Sloan', 'Cody', 'fringilla.cursus.purus@ametnullaDonec.org', 'DSO34JUD8EJ', 0, '08 82 90 54 02', '2019-12-21 02:45:29', 'stagiaire'),
(76, 'Gordon', 'Ruby', 'adipiscing@sociisnatoquepenatibus.com', 'XZL51AUZ2IA', 1, '02 35 22 88 52', '2019-08-08 09:11:54', 'administrateur'),
(77, 'Cohen', 'Tobias', 'magna.et.ipsum@sit.co.uk', 'UOW10QNS0GS', 0, '02 40 36 57 60', '2020-01-09 22:11:16', 'stagiaire'),
(78, 'Hutchinson', 'Matthew', 'Nullam.vitae@In.org', 'ISF08GAK5LM', 1, '01 60 87 27 62', '2018-12-16 00:50:01', 'stagiaire'),
(79, 'Nichols', 'Lee', 'dictum.Phasellus@consequatlectussit.ca', 'DNS50CBF9JC', 0, '02 58 56 93 36', '2018-04-30 15:31:30', 'stagiaire'),
(80, 'Mcclure', 'Basia', 'a.felis@magnaPhasellus.ca', 'UKR48WUE8MG', 0, '04 73 00 89 20', '2019-11-21 09:16:03', 'stagiaire'),
(81, 'Cooley', 'Karleigh', 'Praesent.eu@ante.co.uk', 'VJR51GFP3JW', 0, '03 55 32 20 32', '2019-03-30 08:16:49', 'stagiaire'),
(82, 'Mcclure', 'Alisa', 'non.magna.Nam@ipsum.net', 'LMG26NDF9DX', 1, '01 92 97 22 13', '2018-10-29 15:27:04', 'stagiaire'),
(83, 'Simpson', 'Berk', 'euismod@magnisdisparturient.net', 'BCZ50MLD7GW', 0, '02 72 27 14 39', '2019-03-28 22:35:16', 'administrateur'),
(84, 'Ballard', 'Jermaine', 'facilisis.Suspendisse.commodo@Nullamlobortis.com', 'DZV82GQV3KN', 1, '02 36 73 97 33', '2018-12-26 20:54:06', 'stagiaire'),
(85, 'Foreman', 'Lydia', 'orci.tincidunt@Cras.ca', 'ZYJ29HEE1XL', 1, '03 10 22 88 35', '2020-01-25 11:31:11', 'stagiaire'),
(86, 'Rivers', 'Chastity', 'pharetra.felis@sociosquad.com', 'JPS12MEA5OT', 1, '04 55 95 86 83', '2019-03-27 13:42:54', 'stagiaire'),
(87, 'Chapman', 'Joshua', 'ornare.placerat.orci@Suspendissesed.edu', 'PUN90BHX6OO', 0, '05 50 63 38 64', '2018-05-10 22:23:29', 'stagiaire'),
(88, 'Fuentes', 'Yael', 'sapien.Cras.dolor@felisadipiscing.com', 'KUE19NHJ0YA', 1, '04 04 57 00 15', '2018-10-30 20:17:15', 'stagiaire'),
(89, 'Hayden', 'MacKenzie', 'libero.Proin.sed@ullamcorpereu.org', 'KLE53SGG9QD', 0, '04 02 82 45 77', '2018-08-15 15:34:03', 'stagiaire'),
(90, 'Weaver', 'Amery', 'ultrices@erat.net', 'ZVZ09AQV7DZ', 0, '04 13 16 90 20', '2019-08-11 00:28:06', 'administrateur'),
(91, 'Admin', 'Admin', 'admin@admin.com', 'admin1234', 1, '04 98 52 16 84', '2018-09-21 21:10:47', 'administrateur'),
(92, 'Test', 'Test', 'test@test.com', 'test1234', 1, '08 65 33 00 89', '2018-09-21 09:50:51', 'stagiaire'),
(93, 'Stagiaire', 'Stagiaire', 'stagiaire@stagiaire.com', 'stagiaire1234', 1, '08 65 33 00 89', '2018-09-21 09:50:51', 'stagiaire');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `competence`
--
ALTER TABLE `competence`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sujet` (`sujet`);

--
-- Index pour la table `parcours`
--
ALTER TABLE `parcours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_questionnaire` (`id_questionnaire`);

--
-- Index pour la table `parcours_reponse`
--
ALTER TABLE `parcours_reponse`
  ADD PRIMARY KEY (`id_parcours`,`id_reponse`),
  ADD KEY `id_reponse` (`id_reponse`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_questionnaire` (`id_questionnaire`);

--
-- Index pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_competence` (`id_competence`);

--
-- Index pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_question` (`id_question`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `competence`
--
ALTER TABLE `competence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `parcours`
--
ALTER TABLE `parcours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `reponse`
--
ALTER TABLE `reponse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `parcours`
--
ALTER TABLE `parcours`
  ADD CONSTRAINT `parcours_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `parcours_ibfk_2` FOREIGN KEY (`id_questionnaire`) REFERENCES `questionnaire` (`id`);

--
-- Contraintes pour la table `parcours_reponse`
--
ALTER TABLE `parcours_reponse`
  ADD CONSTRAINT `parcours_reponse_ibfk_1` FOREIGN KEY (`id_parcours`) REFERENCES `parcours` (`id`),
  ADD CONSTRAINT `parcours_reponse_ibfk_2` FOREIGN KEY (`id_reponse`) REFERENCES `reponse` (`id`);

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`id_questionnaire`) REFERENCES `questionnaire` (`id`);

--
-- Contraintes pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD CONSTRAINT `questionnaire_ibfk_1` FOREIGN KEY (`id_competence`) REFERENCES `competence` (`id`);

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `reponse_ibfk_1` FOREIGN KEY (`id_question`) REFERENCES `question` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
