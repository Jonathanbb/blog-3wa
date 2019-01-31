-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 31 Janvier 2019 à 17:03
-- Version du serveur :  5.7.25-0ubuntu0.16.04.2
-- Version de PHP :  7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `billet`
--

CREATE TABLE `billet` (
  `id` bigint(11) NOT NULL,
  `titre` varchar(64) NOT NULL,
  `texte` text NOT NULL,
  `image` varchar(96) NOT NULL,
  `video` varchar(96) NOT NULL DEFAULT '0',
  `datePublication` date DEFAULT NULL,
  `categorie` bigint(11) DEFAULT NULL,
  `dateCreation` datetime DEFAULT CURRENT_TIMESTAMP,
  `likes` smallint(6) DEFAULT '0',
  `favori` tinyint(1) DEFAULT '0',
  `auteur` bigint(11) DEFAULT '1',
  `dislike` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `billet`
--

INSERT INTO `billet` (`id`, `titre`, `texte`, `image`, `video`, `datePublication`, `categorie`, `dateCreation`, `likes`, `favori`, `auteur`, `dislike`) VALUES
(57, 'image', 'NBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB', 'Yoga2.jpg', '0', '2019-12-01', 2, '2019-01-09 15:22:09', 0, 0, 1, 0),
(66, 'Histoire du yoga', 'Abusus enim multitudine hominum, quam tranquillis in rebus diutius rexit, ex agrestibus habitaculis urbes construxit multis opibus firmas et viribus, quarum ad praesens pleraeque licet Graecis nominibus appellentur, quae isdem ad arbitrium inposita sunt conditoris, primigenia tamen nomina non amittunt, quae eis Assyria lingua institutores veteres indiderunt.', 'a-woman-practicing-yoga-on-the-beach.jpg', '0', '2019-01-01', 2, '2019-01-09 16:32:12', 0, 0, 1, 0),
(67, 'Histoire du foot', 'uam quidem partem accusationis admiratus sum et moleste tuli potissimum esse Atratino datam. Neque enim decebat neque aetas illa postulabat neque, id quod animadvertere poteratis, pudor patiebatur optimi adulescentis in tali illum oratione versari. Vellem aliquis ex vobis robustioribus hunc male dicendi locum suscepisset; aliquanto liberius et fortius et magis more nostro refutaremus istam male dicendi licentiam. Tecum, Atratine, agam lenius, quod et pudor tuus moderatur orationi meae et meum erga te parentemque tuum beneficium tueri debeo.', 'a-woman-practicing-yoga-on-the-beach.jpg', '0', '2019-12-31', 2, '2019-01-09 17:11:30', 0, 0, 1, 0),
(69, 'zzz', 'sssqq', 'a-woman-practicing-yoga-on-the-beach.jpg', '0', '2019-12-31', 3, '2019-01-09 17:15:38', 0, 0, 1, 0),
(70, 'Vive la gastronomie', 'Vive la bouffe!', 'lyons.jpg', '0', '2025-12-02', 4, '2019-01-09 17:47:26', 0, 0, 1, 0),
(71, 'Vive le voyage', 'Vive le voyage', 'lyons.jpg', '0', '2026-12-31', 3, '2019-01-09 17:50:51', 0, 0, 1, 0),
(72, 'Sport', 'Sport!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!', 'yoga.jpg', '0', '2030-12-31', 2, '2019-01-09 17:55:35', 0, 0, 1, 0),
(73, 'Mon nouveau blog', 'aaaaaaaaaaaaaaaaaaaaaa', 'lyons.jpg', '0', '2018-01-31', 2, '2019-01-10 14:19:21', 0, 0, 1, 0),
(74, 'Nouveau test', 'C\'est un nouveau test', 'yoga.jpg', '0', NULL, 2, '2019-01-10 15:11:36', 0, 0, 1, 0),
(75, 'C\'est un nouveau test', 'C\'est un nouveau test', 'yoga.jpg', '0', NULL, 4, '2019-01-10 15:12:03', 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(64) NOT NULL,
  `parent` bigint(11) DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  `datePublication` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `parent`, `image`, `datePublication`) VALUES
(2, 'sport', 'le sport c\'est cool', NULL, NULL, NULL),
(3, 'voyage', 'Le voyage c\'est cool', NULL, NULL, NULL),
(4, 'gastronomie', 'La gastronomie c\'est génial', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` bigint(11) NOT NULL,
  `auteur` bigint(11) DEFAULT NULL,
  `datePublication` datetime DEFAULT CURRENT_TIMESTAMP,
  `texte` text NOT NULL,
  `insererImage` varchar(128) NOT NULL DEFAULT '0',
  `validerCommentaire` tinyint(1) NOT NULL DEFAULT '0',
  `reponseCommentaire` bigint(11) DEFAULT NULL,
  `likes` tinyint(1) NOT NULL DEFAULT '0',
  `billet` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `auteur`, `datePublication`, `texte`, `insererImage`, `validerCommentaire`, `reponseCommentaire`, `likes`, `billet`) VALUES
(27, 1, '2019-01-10 13:57:27', 'test heure', '0', 0, NULL, 0, 72),
(28, NULL, '2019-01-10 14:13:46', 'Ã§a marche!', '0', 0, NULL, 0, 72),
(29, NULL, '2019-01-10 14:16:19', 'Quel blog magnifique! J\'adore!', '0', 0, NULL, 0, 72),
(30, NULL, '2019-01-10 14:17:33', 'Cette article vient de me donner envie de faire du yoga!', '0', 0, NULL, 0, 69),
(31, NULL, '2019-01-10 14:17:45', 'Moi aussi!!!', '0', 0, NULL, 0, 69),
(32, NULL, '2019-01-10 14:51:20', 'TrÃ¨s inspirant', '0', 0, NULL, 0, 73),
(33, NULL, '2019-01-10 15:12:25', 'C\'est un nouveau test', '0', 0, NULL, 0, 75),
(34, NULL, '2019-01-10 15:13:30', 'vive la bouffe', '0', 0, NULL, 0, 70),
(35, NULL, '2019-01-10 15:13:38', 'vive ce site\r\n', '0', 0, NULL, 0, 70),
(36, NULL, '2019-01-10 15:33:06', 'test 2', '0', 0, NULL, 0, 75),
(37, NULL, '2019-01-10 16:09:19', 'Ã§a marche encore?', '0', 0, NULL, 0, 75),
(38, NULL, '2019-01-11 15:24:12', 'hey', '0', 0, NULL, 0, 71),
(39, NULL, '2019-01-11 16:30:06', 'ss', '0', 0, NULL, 0, 75),
(40, NULL, '2019-01-11 16:30:08', '', '0', 0, NULL, 0, 75),
(41, NULL, '2019-01-11 16:30:11', 'aaaaaaaaaaaaaaa', '0', 0, NULL, 0, 75),
(42, NULL, '2019-01-11 16:30:50', 'c\'est beau', '0', 0, NULL, 0, 72),
(43, NULL, '2019-01-11 16:31:01', '', '0', 0, NULL, 0, 75),
(44, NULL, '2019-01-11 16:40:31', 'Ã§a marche encore?', '0', 0, NULL, 0, 75),
(45, NULL, '2019-01-11 17:05:33', 'superrrrrr', '0', 0, NULL, 0, 75),
(50, 30, '2019-01-14 13:02:38', 'hey', '0', 0, NULL, 0, 75),
(51, 6, '2019-01-14 13:03:56', 'cool', '0', 0, NULL, 0, 75),
(53, 26, '2019-01-14 13:09:01', 'ff', '0', 0, NULL, 0, 75),
(54, 6, '2019-01-14 13:17:29', 'salut', '0', 0, NULL, 0, 75),
(55, 32, '2019-01-14 13:19:07', 'qq', '0', 0, NULL, 0, 75),
(56, 6, '2019-01-14 14:54:14', 'bb', '0', 0, NULL, 0, 70);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` bigint(11) NOT NULL,
  `titre` varchar(64) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`id`, `titre`, `description`) VALUES
(1, 'admin', 'Celui qui peut éditer un texte'),
(2, 'Lecteur & utilisateur', 'Peut écrire des commentaires sur le site');

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

CREATE TABLE `tag` (
  `id` bigint(11) NOT NULL,
  `nomTag` varchar(64) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tagBillet`
--

CREATE TABLE `tagBillet` (
  `idBillet` bigint(11) NOT NULL,
  `idTag` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` bigint(11) NOT NULL,
  `nom` varchar(64) NOT NULL,
  `prenom` varchar(64) NOT NULL,
  `pseudo` varchar(128) NOT NULL,
  `mot_de_passe` varchar(64) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `role` bigint(11) DEFAULT NULL,
  `avatar` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `pseudo`, `mot_de_passe`, `email`, `telephone`, `role`, `avatar`) VALUES
(1, 'B', 'Jo', '0', '0', 'aaa', NULL, 2, NULL),
(6, 'bb', 'bb', 'bb', 'bb', 'bb', NULL, 2, NULL),
(8, 'jo', 'jo', 'jo', 'jo', 'jo', NULL, 2, NULL),
(9, 'z', 'z', 'z', 'z', 'z', NULL, NULL, NULL),
(16, 'a', 'a', 'a', 'a', 'a', NULL, NULL, NULL),
(26, 'ff', 'ff', 'ff', 'ff', 'ff', NULL, NULL, NULL),
(29, 'dd', 'dd', 'dd', 'dd', 'dd', NULL, NULL, NULL),
(30, 'admin', 'admin', 'admin', 'admin', 'admin', NULL, 1, NULL),
(31, 'zz', 'zz', 'zz', 'zz', 'zz', NULL, NULL, NULL),
(32, 'qq', 'qq', 'qq', 'qq', 'qq', NULL, NULL, NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `billet`
--
ALTER TABLE `billet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorie` (`categorie`),
  ADD KEY `auteur` (`auteur`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auteur` (`auteur`),
  ADD KEY `commentaire` (`billet`),
  ADD KEY `reponseCommentaire` (`reponseCommentaire`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tagBillet`
--
ALTER TABLE `tagBillet`
  ADD KEY `idBillet` (`idBillet`),
  ADD KEY `idTag` (`idTag`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `billet`
--
ALTER TABLE `billet`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `billet`
--
ALTER TABLE `billet`
  ADD CONSTRAINT `billet_ibfk_1` FOREIGN KEY (`auteur`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `billet_ibfk_2` FOREIGN KEY (`categorie`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_ibfk_1` FOREIGN KEY (`auteur`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `commentaire_ibfk_2` FOREIGN KEY (`billet`) REFERENCES `billet` (`id`),
  ADD CONSTRAINT `commentaire_ibfk_3` FOREIGN KEY (`reponseCommentaire`) REFERENCES `commentaire` (`id`);

--
-- Contraintes pour la table `tagBillet`
--
ALTER TABLE `tagBillet`
  ADD CONSTRAINT `tagBillet_ibfk_1` FOREIGN KEY (`idBillet`) REFERENCES `billet` (`id`),
  ADD CONSTRAINT `tagBillet_ibfk_2` FOREIGN KEY (`idTag`) REFERENCES `tag` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
