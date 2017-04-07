-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Ven 07 Avril 2017 à 08:43
-- Version du serveur :  5.7.17-log
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `imarcket`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_cmd` int(11) NOT NULL,
  `user_login_cmd` varchar(50) NOT NULL,
  `total_price_cmd` double DEFAULT '0',
  `date_cmd` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`id_cmd`, `user_login_cmd`, `total_price_cmd`, `date_cmd`) VALUES
(1, 'Emarcket', 800, '2017-03-15');

-- --------------------------------------------------------

--
-- Structure de la table `commande_item`
--

CREATE TABLE `commande_item` (
  `id_cmd_item` int(11) NOT NULL,
  `id_cmd_parent` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `nom_cmd_item` varchar(100) NOT NULL,
  `quantity_cmd_item` int(11) NOT NULL,
  `prix_unit_cmd_item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `commande_item`
--

INSERT INTO `commande_item` (`id_cmd_item`, `id_cmd_parent`, `product_id`, `nom_cmd_item`, `quantity_cmd_item`, `prix_unit_cmd_item`) VALUES
(2, 1, 2, 'PC configuration jeux vidéos', 3, 800);

-- --------------------------------------------------------

--
-- Structure de la table `component`
--

CREATE TABLE `component` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `unit` varchar(20) NOT NULL,
  `value` float NOT NULL,
  `libelle` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `component`
--

INSERT INTO `component` (`id`, `name`, `supplier`, `unit`, `value`, `libelle`) VALUES
(1, 'Carte mère', 'Fournisseur1', '', 0, 'MSI Z170A GAMING PRO CARBON'),
(2, 'Processeur', 'Fournisseur1', 'Ghz', 3.3, 'AMD 4600'),
(3, 'RAM', 'Fournisseur1', 'Go', 1, 'Corssaire'),
(4, 'Disque Dur', 'Fournisseur1', 'To', 1, 'SSD ou pas '),
(5, 'CPU', 'FOUR 1', 'Ghz', 2.33, ' Intel I7');

-- --------------------------------------------------------

--
-- Structure de la table `emarket_user`
--

CREATE TABLE `emarket_user` (
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `emarket_user`
--

INSERT INTO `emarket_user` (`login`, `password`, `lastname`, `firstname`) VALUES
('admin', '123', 'Dile', 'O'),
('céline', '123', 'Line', 'Cé'),
('Emarcket', '14183945', 'Marcket', 'E'),
('robert', '123', 'Bert', 'Ro');

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `id_marque` int(11) NOT NULL,
  `name_marque` varchar(200) NOT NULL,
  `url_marque` varchar(1000) NOT NULL,
  `url_img_marque` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `marque`
--

INSERT INTO `marque` (`id_marque`, `name_marque`, `url_marque`, `url_img_marque`) VALUES
(1, 'Nvidia', '', ''),
(2, 'Nitendo', '', ''),
(3, 'Sonny', '', ''),
(4, 'Microsoft', '', ''),
(5, 'msi', '', ''),
(6, 'ASSUS', '', ''),
(7, 'APPEL', '', ''),
(8, 'SAMSUNG', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `selling_price` double DEFAULT '0',
  `image_URL` varchar(3000) DEFAULT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `product`
--

INSERT INTO `product` (`id`, `name`, `selling_price`, `image_URL`, `description`) VALUES
(1, 'PC configuration de base', 400, 'http://www.overclockingmadeinfrance.com/wp-content/uploads/2015/10/PC-Gamer-Spec-01.png', 'pc ideale pour la bureautique'),
(2, 'PC configuration jeux vidéos', 800, 'https://cours-informatique-gratuit.fr/wp-content/uploads/2014/05/pc-gamer.jpg', 'Pc ideale pour Harcore gamer'),
(3, 'MacBook configuration de base', 600, 'https://www.heise.de/imagine/JsN9hbDAUcBpYC5vez8iq1OQnjs/content/MacBook-13-2-4-GHz-Mitte-2010.jpg', 'PC de bourge'),
(4, 'MacBook configuration performance', 1000, 'https://www.heise.de/imagine/JsN9hbDAUcBpYC5vez8iq1OQnjs/content/MacBook-13-2-4-GHz-Mitte-2010.jpg', 'pc de bourge plein de sous '),
(14, 'megadrive', 40.45, 'https://upload.wikimedia.org/wikipedia/commons/a/a1/Sega-Mega-Drive-JP-Mk1-Console-Set.jpg', 'console 16 bits de sega '),
(16, 'super nitendo', 123.5, 'http://img4.hostingpics.net/pics/615948snes.jpg', 'console 16  bits de nitendo '),
(17, 'super nes', 150, 'http://img4.hostingpics.net/pics/615948snes.jpg', 'console 16 bits nitendo import US'),
(19, 'N64', 20, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/N64-Console-Set.png/1200px-N64-Console-Set.png', 'console 64 bits de nitendo '),
(20, 'game cube ', 100.99, 'https://upload.wikimedia.org/wikipedia/commons/2/2b/GameCube-Console-Set.png', 'console 128 bits de nitendo '),
(21, 'wii', 120.56, 'http://image.jeuxvideo.com/medias-sm/149011/1490107870-6416-photo.jpg', 'console  a detection de mouvement nitendo '),
(22, 'wiiU', 47, 'http://jeucoop.com/wp-content/uploads/2017/02/nintendo-wii-u-console1.jpg', 'console a detection de mouvement 2  avec un mablete permetant le game plays asymetrique de nitendo  '),
(23, 'switch', 470, 'http://media.nintendo.com/nintendo/cocoon/switch-static-pages/switch/etRgxnAu0zRX4bmWnt9K628wG7YQUI6t/images/switch/home/bundle1.jpg', 'console mutante salon portable nitendo'),
(24, 'playstation', 20, 'http://www.culturemania.fr/img/545/7d4e5ec40f1a2e7fc7cd8bcd325947dd.jpg', 'premier console de salon 32 bits de sonny '),
(25, 'psp', 100, 'http://media1.gameinformer.com/filestorage/CommunityServer.Components.SiteFiles/imagefeed/featured/sony/PSP/pspimage-610.jpg', 'console portable Sonny 128 bits '),
(26, 'ps-vita', 80, 'https://sonyglobal.scene7.com/is/image/gwtprod/ef8fd092113fdcc6dbe906e536a23247?fmt=pjpeg&wid=1014&hei=396&bgcolor=F1F5F9&bgc=F1F5F9', 'console portable sonny  permetant game play asymetrique avec la ps3 et ps4'),
(27, 'ps2', 5, 'https://upload.wikimedia.org/wikipedia/commons/1/1c/PS2-Versions.jpg', 'console 128  bits sony '),
(28, 'Ps3', 150, 'http://vignette1.wikia.nocookie.net/lego-dimensions/images/4/40/PS3-slim-console.png/revision/latest?cb=20150922210857', 'console salon sony'),
(29, 'master systeme', 18, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Sega-Master-System-Set.png/1200px-Sega-Master-System-Set.png', 'console 8 bits SEGA'),
(31, 'Nvidia shield', 250.55, 'http://bestengine.humanoid.fr/uploads/products/nvidia-shield.png', 'console portable utilisant la technologie de stream de rendu graphique ');

-- --------------------------------------------------------

--
-- Structure de la table `product_has_component`
--

CREATE TABLE `product_has_component` (
  `product_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `product_has_component`
--

INSERT INTO `product_has_component` (`product_id`, `component_id`, `quantity`) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 1, 1),
(2, 2, 2),
(2, 3, 2),
(3, 3, 1),
(4, 3, 1),
(4, 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `user_has_group`
--

CREATE TABLE `user_has_group` (
  `login` varchar(50) NOT NULL,
  `group_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user_has_group`
--

INSERT INTO `user_has_group` (`login`, `group_id`) VALUES
('admin', 'admins'),
('céline', 'webusers'),
('Emarcket', 'webusers'),
('robert', 'webusers');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_cmd`),
  ADD KEY `FK_login_cmd` (`user_login_cmd`);

--
-- Index pour la table `commande_item`
--
ALTER TABLE `commande_item`
  ADD PRIMARY KEY (`id_cmd_item`),
  ADD UNIQUE KEY `id_cmd_parent` (`id_cmd_parent`),
  ADD KEY `fk_shoppingcart_product_id` (`product_id`);

--
-- Index pour la table `component`
--
ALTER TABLE `component`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `emarket_user`
--
ALTER TABLE `emarket_user`
  ADD PRIMARY KEY (`login`);

--
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`id_marque`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product_has_component`
--
ALTER TABLE `product_has_component`
  ADD PRIMARY KEY (`product_id`,`component_id`),
  ADD KEY `fk_component_id` (`component_id`);

--
-- Index pour la table `user_has_group`
--
ALTER TABLE `user_has_group`
  ADD PRIMARY KEY (`login`,`group_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_cmd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `commande_item`
--
ALTER TABLE `commande_item`
  MODIFY `id_cmd_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `component`
--
ALTER TABLE `component`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `marque`
--
ALTER TABLE `marque`
  MODIFY `id_marque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_login_cmd` FOREIGN KEY (`user_login_cmd`) REFERENCES `emarket_user` (`login`);

--
-- Contraintes pour la table `commande_item`
--
ALTER TABLE `commande_item`
  ADD CONSTRAINT `fk_cmd_parent_details` FOREIGN KEY (`id_cmd_parent`) REFERENCES `commande` (`id_cmd`),
  ADD CONSTRAINT `fk_shoppingcart_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `product_has_component`
--
ALTER TABLE `product_has_component`
  ADD CONSTRAINT `fk_component_id` FOREIGN KEY (`component_id`) REFERENCES `component` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `user_has_group`
--
ALTER TABLE `user_has_group`
  ADD CONSTRAINT `fk_login` FOREIGN KEY (`login`) REFERENCES `emarket_user` (`login`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
