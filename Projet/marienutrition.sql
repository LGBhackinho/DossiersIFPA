-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 22 juil. 2024 à 13:50
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `marienutrition`
--

-- --------------------------------------------------------

--
-- Structure de la table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `files`
--

INSERT INTO `files` (`id`, `user_id`, `filename`, `filepath`, `uploaded_at`) VALUES
(1, 1, 'CV_Ruddy_MARIA.pdf', 'fichiers_pdf/CV_Ruddy_MARIA.pdf', '2024-07-11 09:58:10'),
(2, 2, 'Convention_de_stage_entreprise_DWWM.pdf', 'fichiers_pdf/Convention_de_stage_entreprise_DWWM.pdf', '2024-07-11 11:45:53'),
(3, 2, 'CV_Ruddy_MARIA.pdf', 'fichiers_pdf/CV_Ruddy_MARIA.pdf', '2024-07-11 11:53:49'),
(4, 1, 'Lettre de motivation.pdf', 'fichiers_pdf/Lettre de motivation.pdf', '2024-07-11 12:18:09'),
(5, 2, 'REAC_DWWM_V04_24052023.pdf', 'fichiers_pdf/REAC_DWWM_V04_24052023.pdf', '2024-07-12 07:07:52'),
(6, 1, 'REV2_DWWM_V04_24052023.pdf', './fichiers_pdf/REV2_DWWM_V04_24052023.pdf', '2024-07-12 09:40:00'),
(7, 1, 'REV2_DWWM_V04_24052023.pdf', '../fichiers_pdf/REV2_DWWM_V04_24052023.pdf', '2024-07-12 09:42:21');

-- --------------------------------------------------------

--
-- Structure de la table `infonutrition`
--

CREATE TABLE `infonutrition` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `imc` float NOT NULL,
  `poidsInitial` float NOT NULL,
  `depenseCal` float NOT NULL,
  `tauxMasseGrasse` float NOT NULL,
  `objectifCal` float NOT NULL,
  `glucides` float NOT NULL,
  `lipides` float NOT NULL,
  `proteines` float NOT NULL,
  `poidsAtteindre` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `infonutrition`
--

INSERT INTO `infonutrition` (`id`, `user_id`, `imc`, `poidsInitial`, `depenseCal`, `tauxMasseGrasse`, `objectifCal`, `glucides`, `lipides`, `proteines`, `poidsAtteindre`, `date`) VALUES
(1, 1, 21, 70, 1900, 21, 1463.51, 176.88, 42, 94.5, 68, '2024-07-08 09:34:50'),
(2, 1, 0, 70, 0, 21, 0, 0, 0, 0, 67, '2024-07-09 08:21:22'),
(3, 1, 21, 72, 1900, 21, 1463.51, 176.88, 42, 94.5, 38, '2024-07-09 12:29:22'),
(4, 1, 21, 70, 1900, 21, 1463.51, 176.88, 42, 94.5, 0, '2024-07-11 10:33:08');

-- --------------------------------------------------------

--
-- Structure de la table `recette`
--

CREATE TABLE `recette` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `is_favorite` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `recette`
--

INSERT INTO `recette` (`id`, `user_id`, `post_id`, `is_favorite`) VALUES
(1, 1, 2, 1),
(2, 1, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `poids` float DEFAULT NULL,
  `taille` float DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `genre` varchar(10) DEFAULT NULL,
  `activite` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `prenom`, `nom`, `age`, `poids`, `taille`, `adresse`, `telephone`, `email`, `genre`, `activite`, `password`) VALUES
(1, 'ruddy', 'MARIA', 44, 70, 179, '0', '6', 'ruddy@titi.com', 'homme', '1', '$2y$10$vdCHf53JuuOMYOF9MwMYwOvXlwh.c65L9d9MVgyewd1zQJS.EYDzC'),
(2, 'marie', 'boss', 35, 52, 160, '11 rue des sa te regarde pas', '6999999', 'marie@titi.com', 'femme', '1.2', '$2y$10$3nBpkC/S1bgau8Ope.V.bOP3AcHRtukjXD9Zjt9w.aiHnG3a8qyZC');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `infonutrition`
--
ALTER TABLE `infonutrition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `recette`
--
ALTER TABLE `recette`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`post_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `infonutrition`
--
ALTER TABLE `infonutrition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `recette`
--
ALTER TABLE `recette`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `infonutrition`
--
ALTER TABLE `infonutrition`
  ADD CONSTRAINT `infonutrition_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `recette`
--
ALTER TABLE `recette`
  ADD CONSTRAINT `recette_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
