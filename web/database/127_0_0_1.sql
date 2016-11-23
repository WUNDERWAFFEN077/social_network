-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2016 a las 02:12:50
-- Versión del servidor: 5.5.53-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `c9`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `following`
--

CREATE TABLE IF NOT EXISTS `following` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user` int(255) DEFAULT NULL,
  `followed` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_following_users` (`user`),
  KEY `fk_followed` (`followed`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Volcado de datos para la tabla `following`
--

INSERT INTO `following` (`id`, `user`, `followed`) VALUES
(70, 1, 5),
(71, 1, 6),
(72, 1, 7),
(73, 1, 8),
(74, 1, 9),
(75, 1, 10),
(76, 1, 11),
(77, 1, 12),
(78, 1, 13),
(79, 1, 14),
(80, 1, 15),
(81, 1, 16),
(82, 1, 17),
(83, 5, 1),
(84, 5, 2),
(87, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user` int(255) DEFAULT NULL,
  `publication` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_likes_users` (`user`),
  KEY `fk_likes_publication` (`publication`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `type_id` int(255) DEFAULT NULL,
  `readed` varchar(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `extra` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notifications_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `private_messages`
--

CREATE TABLE IF NOT EXISTS `private_messages` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `message` longtext,
  `emitter` int(255) DEFAULT NULL,
  `receiver` int(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `readed` varchar(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_emmiter_privates` (`emitter`),
  KEY `fk_receiver_privates` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publications`
--

CREATE TABLE IF NOT EXISTS `publications` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) DEFAULT NULL,
  `text` mediumtext,
  `document` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_publications_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nick` varchar(50) DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `active` varchar(2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_uniques_fields` (`email`,`nick`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role`, `email`, `name`, `surname`, `password`, `nick`, `bio`, `active`, `image`) VALUES
(1, 'ROLE_ADMIN', 'admin@hotmail.com', 'Amado', 'Rudas Díaz', '$2y$12$yuQl7.W4nO.0iAZ/XhTPQu6b2EyxZhHFELdM4HanuRYeH8mv3G2G2', 'admin', 'Soy el administrador todopoderoso, pideme un deseo y lo tendrás.', '1', '11479708627.jpeg'),
(2, 'ROLE_USER', 'amado@hotmail.com', 'Amado', 'Rudas', '$2y$12$xzEwNwHMmOyDmyDPzen0Pu2Fx.jxKssgEdjWfSH7gbUf7QCuWtQBq', 'arudas', NULL, NULL, NULL),
(3, 'ROLE_USER', 'maria@hotmail.com', 'Maria', 'Lopez', '$2y$12$worjRe6uK3ztmFMAnRkFcO3dE5hsikhGGXs7p5BUbM.S92H2zckQm', 'marita', NULL, NULL, NULL),
(4, 'ROLE_USER', 'pepe@hotmail.com', 'Pepe', 'Lucho', '$2y$12$8fghbJl5p19hU9eRI0yT8uNclSo6OMzd5DkDybwGhN.Ci4qLvrArC', 'pepelucho', NULL, NULL, NULL),
(5, 'ROLE_USER', 'xio@hotmail.com', 'Samara', 'Toggle', '$2y$12$yuQl7.W4nO.0iAZ/XhTPQu6b2EyxZhHFELdM4HanuRYeH8mv3G2G2', 'xio', 'Me llaman la pecosa candy.', NULL, '51479703243.gif'),
(6, 'ROLE_USER', 'sharon@hotmail.com', 'Sharon', 'Rudas', '$2y$12$HcrfHMu3mM9NG/k9A3uKRe66HrmDeM6HS6j5/dqpcOOXLDvhEtbfO', 'sharon', NULL, NULL, NULL),
(7, 'ROLE_USER', 'void@hotmail.com', 'Void', 'Doter', '$2y$12$tAprAOHQljyGXlo.HutHh.2mLiz9HsXsqh54ndJB826GcQCjCGwDu', 'void', NULL, NULL, NULL),
(8, 'ROLE_USER', 'pablo@hotmail.com', 'Pablo', 'Marmon', '$2y$12$scqXM0TuY4HDctxTXnyonON9RadjcsMUq0J.c3CWH/QoSTvBT5CqO', 'pablo', NULL, NULL, NULL),
(9, 'ROLE_USER', 'gondar@hotmail.com', 'Gondar', 'Killer', '$2y$12$fkuOiw7kEwIjRsiSw9ysge8LuZAOk1nnzeB3039gU0qGqJbfdulda', 'gondar', NULL, NULL, NULL),
(10, 'ROLE_USER', 'aleria@hotmail.com', 'Aleria', 'Windrumer', '$2y$12$ceRsYzVOCTL2WntlfFVjieXRAwN6G7LFWA7FFLWPo8elwcFI24q1S', 'aleria', NULL, NULL, NULL),
(11, 'ROLE_USER', 'troll@hotmail.com', 'Troll', 'Warlord', '$2y$12$66rNY06r4nIkd7nInekqieNt0a8SYvI6gThyTBsYDAcLMIPGYnwJ6', 'troll', NULL, NULL, NULL),
(12, 'ROLE_USER', 'techis@hotmail.com', 'Techis', 'Minero', '$2y$12$w95p5zHusT2xRPHc9o6TiuGUsJbBom40DibPUPX4s3kBPvxQkH/Om', 'techis', NULL, NULL, NULL),
(13, 'ROLE_USER', 'james@hotmail.com', 'James', 'Quispe', '$2y$12$.x9sD.NIP.wK5qGjTmsM6uE5tAjdCCb1DQN3gU3rGUa0ONj00bsC.', 'james', NULL, NULL, NULL),
(14, 'ROLE_USER', 'yovanny@hotmail.com', 'Yovanny', 'Casimiro', '$2y$12$XaDYyai8mXJ6j/uhjkHkHOk5Wj4E.D6L.zuHZmtyN5sKNBjdIU75G', 'yovanny', NULL, NULL, NULL),
(15, 'ROLE_USER', 'chivi@hotmail.com', 'Irvin', 'Campos', '$2y$12$FryxzFHPISimXL3gNVpfTuVr0HmSjINFea/3OKQI94Pa61SMFAgDG', 'chivi', NULL, NULL, NULL),
(16, 'ROLE_USER', 'orudas@hotmail.com', 'Orlando', 'Rudas', '$2y$12$uAsQJNLxs3Ik/EVpeQiHwOrLUg75HioSjbOcyRu.Lr4bwC4ZTwWJS', 'orudas', NULL, NULL, NULL),
(17, 'ROLE_USER', 'elsi@hotmail.com', 'Elsi', 'Diaz', '$2y$12$GUzGiyfc3fIqDWEBBNeF7OKv1YrvUxUURQTKOtyuCqnN4Xx2r/E0e', 'elsi', NULL, NULL, NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `following`
--
ALTER TABLE `following`
  ADD CONSTRAINT `fk_followed` FOREIGN KEY (`followed`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_following_users` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_likes_publication` FOREIGN KEY (`publication`) REFERENCES `publications` (`id`),
  ADD CONSTRAINT `fk_likes_users` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `private_messages`
--
ALTER TABLE `private_messages`
  ADD CONSTRAINT `fk_emmiter_privates` FOREIGN KEY (`emitter`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_receiver_privates` FOREIGN KEY (`receiver`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `publications`
--
ALTER TABLE `publications`
  ADD CONSTRAINT `fk_publications_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
