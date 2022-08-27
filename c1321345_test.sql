-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-06-2022 a las 19:19:56
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ibilling`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_balances`
--

CREATE TABLE `account_balances` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `currency_id` int(11) NOT NULL DEFAULT 0,
  `balance` decimal(16,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clx_integrations`
--

CREATE TABLE `clx_integrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_accounts`
--

CREATE TABLE `crm_accounts` (
  `id` int(11) NOT NULL,
  `account` varchar(200) DEFAULT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `company` varchar(200) NOT NULL,
  `jobtitle` varchar(100) NOT NULL,
  `cid` int(11) NOT NULL,
  `o` int(11) NOT NULL DEFAULT 0,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `balance` decimal(16,2) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `notes` text NOT NULL,
  `options` text DEFAULT NULL,
  `tags` text NOT NULL,
  `password` text NOT NULL,
  `token` text NOT NULL,
  `ts` text NOT NULL,
  `img` varchar(100) NOT NULL,
  `web` varchar(200) NOT NULL,
  `facebook` varchar(100) NOT NULL,
  `google` varchar(100) NOT NULL,
  `linkedin` varchar(100) NOT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `skype` varchar(100) DEFAULT NULL,
  `tax_number` varchar(100) DEFAULT NULL,
  `entity_number` varchar(100) DEFAULT NULL,
  `currency` int(11) DEFAULT 0,
  `pmethod` varchar(100) DEFAULT NULL,
  `autologin` varchar(100) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `lastloginip` varchar(100) DEFAULT NULL,
  `stage` varchar(50) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `isp` varchar(100) DEFAULT NULL,
  `lat` varchar(50) DEFAULT NULL,
  `lon` varchar(50) DEFAULT NULL,
  `gname` varchar(200) DEFAULT NULL,
  `gid` int(11) NOT NULL DEFAULT 0,
  `sid` varchar(200) DEFAULT NULL,
  `role` varchar(200) DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `country_idd` varchar(20) DEFAULT NULL,
  `signed_up_by` varchar(100) DEFAULT NULL,
  `signed_up_ip` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `ct` varchar(200) DEFAULT NULL,
  `assistant` varchar(200) DEFAULT NULL,
  `asst_phone` varchar(100) DEFAULT NULL,
  `second_email` varchar(100) DEFAULT NULL,
  `second_phone` varchar(100) DEFAULT NULL,
  `taxexempt` varchar(50) DEFAULT NULL,
  `latefeeoveride` varchar(50) DEFAULT NULL,
  `overideduenotices` varchar(50) DEFAULT NULL,
  `separateinvoices` varchar(50) DEFAULT NULL,
  `disableautocc` varchar(50) DEFAULT NULL,
  `billingcid` int(10) NOT NULL DEFAULT 0,
  `securityqid` int(10) NOT NULL DEFAULT 0,
  `securityqans` text DEFAULT NULL,
  `cardtype` varchar(200) DEFAULT NULL,
  `cardlastfour` varchar(20) DEFAULT NULL,
  `cardnum` text DEFAULT NULL,
  `startdate` varchar(50) DEFAULT NULL,
  `expdate` varchar(50) DEFAULT NULL,
  `issuenumber` varchar(200) DEFAULT NULL,
  `bankname` varchar(200) DEFAULT NULL,
  `banktype` varchar(200) DEFAULT NULL,
  `bankcode` varchar(200) DEFAULT NULL,
  `bankacct` varchar(200) DEFAULT NULL,
  `gatewayid` int(10) NOT NULL DEFAULT 0,
  `language` text DEFAULT NULL,
  `pwresetkey` varchar(100) DEFAULT NULL,
  `emailoptout` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pwresetexpiry` datetime DEFAULT NULL,
  `c1` varchar(200) DEFAULT NULL,
  `c2` varchar(200) DEFAULT NULL,
  `c3` varchar(200) DEFAULT NULL,
  `c4` varchar(200) DEFAULT NULL,
  `c5` varchar(200) DEFAULT NULL,
  `is_email_verified` int(1) NOT NULL DEFAULT 0,
  `is_phone_veirifed` int(1) NOT NULL DEFAULT 0,
  `photo_id_type` varchar(100) DEFAULT NULL,
  `photo_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `crm_accounts`
--

INSERT INTO `crm_accounts` (`id`, `account`, `fname`, `lname`, `company`, `jobtitle`, `cid`, `o`, `phone`, `email`, `username`, `address`, `city`, `state`, `zip`, `country`, `balance`, `status`, `notes`, `options`, `tags`, `password`, `token`, `ts`, `img`, `web`, `facebook`, `google`, `linkedin`, `twitter`, `skype`, `tax_number`, `entity_number`, `currency`, `pmethod`, `autologin`, `lastlogin`, `lastloginip`, `stage`, `timezone`, `isp`, `lat`, `lon`, `gname`, `gid`, `sid`, `role`, `country_code`, `country_idd`, `signed_up_by`, `signed_up_ip`, `dob`, `ct`, `assistant`, `asst_phone`, `second_email`, `second_phone`, `taxexempt`, `latefeeoveride`, `overideduenotices`, `separateinvoices`, `disableautocc`, `billingcid`, `securityqid`, `securityqans`, `cardtype`, `cardlastfour`, `cardnum`, `startdate`, `expdate`, `issuenumber`, `bankname`, `banktype`, `bankcode`, `bankacct`, `gatewayid`, `language`, `pwresetkey`, `emailoptout`, `created_at`, `updated_at`, `pwresetexpiry`, `c1`, `c2`, `c3`, `c4`, `c5`, `is_email_verified`, `is_phone_veirifed`, `photo_id_type`, `photo_id`) VALUES
(1, 'Matias Cettour', '', '', 'Lumat', '', 1, 5, '0340045454545', 'ventas@lumatsi.com', NULL, 'Acevedo 500', 'Villa Constitución', 'Santa Fe', '2919', 'Argentina', '0.00', 'Active', '', NULL, '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL),
(2, 'Contacto Cliente nuevo', '', '', 'Cliente nuevo', '', 2, 5, '0340045878787', 'emailcontactonuevo@gmail.com', NULL, 'San Martin 1234', 'Rosario', 'Santa Fe', '2919', 'Argentina', '0.00', 'Active', '', NULL, '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_accountsold`
--

CREATE TABLE `crm_accountsold` (
  `id` int(11) NOT NULL,
  `account` varchar(200) DEFAULT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `company` varchar(200) NOT NULL,
  `jobtitle` varchar(100) NOT NULL,
  `cid` int(11) NOT NULL,
  `o` int(11) NOT NULL DEFAULT 0,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `balance` decimal(16,2) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `notes` text NOT NULL,
  `options` text DEFAULT NULL,
  `tags` text NOT NULL,
  `password` text NOT NULL,
  `token` text NOT NULL,
  `ts` text NOT NULL,
  `img` varchar(100) NOT NULL,
  `web` varchar(200) NOT NULL,
  `facebook` varchar(100) NOT NULL,
  `google` varchar(100) NOT NULL,
  `linkedin` varchar(100) NOT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `skype` varchar(100) DEFAULT NULL,
  `tax_number` varchar(100) DEFAULT NULL,
  `entity_number` varchar(100) DEFAULT NULL,
  `currency` int(11) DEFAULT 0,
  `pmethod` varchar(100) DEFAULT NULL,
  `autologin` varchar(100) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `lastloginip` varchar(100) DEFAULT NULL,
  `stage` varchar(50) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `isp` varchar(100) DEFAULT NULL,
  `lat` varchar(50) DEFAULT NULL,
  `lon` varchar(50) DEFAULT NULL,
  `gname` varchar(200) DEFAULT NULL,
  `gid` int(11) NOT NULL DEFAULT 0,
  `sid` varchar(200) DEFAULT NULL,
  `role` varchar(200) DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `country_idd` varchar(20) DEFAULT NULL,
  `signed_up_by` varchar(100) DEFAULT NULL,
  `signed_up_ip` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `ct` varchar(200) DEFAULT NULL,
  `assistant` varchar(200) DEFAULT NULL,
  `asst_phone` varchar(100) DEFAULT NULL,
  `second_email` varchar(100) DEFAULT NULL,
  `second_phone` varchar(100) DEFAULT NULL,
  `taxexempt` varchar(50) DEFAULT NULL,
  `latefeeoveride` varchar(50) DEFAULT NULL,
  `overideduenotices` varchar(50) DEFAULT NULL,
  `separateinvoices` varchar(50) DEFAULT NULL,
  `disableautocc` varchar(50) DEFAULT NULL,
  `billingcid` int(10) NOT NULL DEFAULT 0,
  `securityqid` int(10) NOT NULL DEFAULT 0,
  `securityqans` text DEFAULT NULL,
  `cardtype` varchar(200) DEFAULT NULL,
  `cardlastfour` varchar(20) DEFAULT NULL,
  `cardnum` text DEFAULT NULL,
  `startdate` varchar(50) DEFAULT NULL,
  `expdate` varchar(50) DEFAULT NULL,
  `issuenumber` varchar(200) DEFAULT NULL,
  `bankname` varchar(200) DEFAULT NULL,
  `banktype` varchar(200) DEFAULT NULL,
  `bankcode` varchar(200) DEFAULT NULL,
  `bankacct` varchar(200) DEFAULT NULL,
  `gatewayid` int(10) NOT NULL DEFAULT 0,
  `language` text DEFAULT NULL,
  `pwresetkey` varchar(100) DEFAULT NULL,
  `emailoptout` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pwresetexpiry` datetime DEFAULT NULL,
  `c1` varchar(200) DEFAULT NULL,
  `c2` varchar(200) DEFAULT NULL,
  `c3` varchar(200) DEFAULT NULL,
  `c4` varchar(200) DEFAULT NULL,
  `c5` varchar(200) DEFAULT NULL,
  `is_email_verified` int(1) NOT NULL DEFAULT 0,
  `is_phone_veirifed` int(1) NOT NULL DEFAULT 0,
  `photo_id_type` varchar(100) DEFAULT NULL,
  `photo_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `crm_accountsold`
--

INSERT INTO `crm_accountsold` (`id`, `account`, `fname`, `lname`, `company`, `jobtitle`, `cid`, `o`, `phone`, `email`, `username`, `address`, `city`, `state`, `zip`, `country`, `balance`, `status`, `notes`, `options`, `tags`, `password`, `token`, `ts`, `img`, `web`, `facebook`, `google`, `linkedin`, `twitter`, `skype`, `tax_number`, `entity_number`, `currency`, `pmethod`, `autologin`, `lastlogin`, `lastloginip`, `stage`, `timezone`, `isp`, `lat`, `lon`, `gname`, `gid`, `sid`, `role`, `country_code`, `country_idd`, `signed_up_by`, `signed_up_ip`, `dob`, `ct`, `assistant`, `asst_phone`, `second_email`, `second_phone`, `taxexempt`, `latefeeoveride`, `overideduenotices`, `separateinvoices`, `disableautocc`, `billingcid`, `securityqid`, `securityqans`, `cardtype`, `cardlastfour`, `cardnum`, `startdate`, `expdate`, `issuenumber`, `bankname`, `banktype`, `bankcode`, `bankacct`, `gatewayid`, `language`, `pwresetkey`, `emailoptout`, `created_at`, `updated_at`, `pwresetexpiry`, `c1`, `c2`, `c3`, `c4`, `c5`, `is_email_verified`, `is_phone_veirifed`, `photo_id_type`, `photo_id`) VALUES
(1, 'test', '', '', '', '', 0, 1, '', '', NULL, '', '', '', '', 'United States', '0.00', 'Active', '', NULL, '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2017-11-13 05:12:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL),
(2, 'Nombre de la Cuenta test', '', '', '', '', 0, 1, '3400498585', 'facundohernandezd@gmail.com', NULL, 'direccion 183', 'ciduad vc', 'sta fe', '2919', 'United States', '0.00', 'Active', 'Notas del contacto acá.....', NULL, '', 'ibAdFtCb.IjFU', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 1, NULL, 'qn8x2e7mybj8lgzoefup21651156410', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2017-11-13 05:12:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL),
(3, 'Facundo Hernández', '', '', 'No se', '', 1, 4, '+543400498587', 'facundohernandez@outlook.com', NULL, '12 de Octubre', 'Villa Constitución', 'Santa Fe', '2919', 'Argentina', '0.00', 'Active', 'Notas de contacto - cte', NULL, '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2022-04-28 14:34:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL),
(4, 'Facundito', '', '', 'Sistemax SRL', '', 2, 5, '+13400499306', 'test@test.com', NULL, '12 de Octubre', 'VILLA CONSTITUCION', 'Santa Fe', '2919', 'Argentina', '0.00', 'Active', '', NULL, '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 1, NULL, 'jt48njvdvfebd6vktjlr41651264332', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2022-04-29 12:58:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL),
(5, 'test', '', '', 'Sistemax SRL', '', 2, 5, '', 'facundohernandez2@outlook.com', NULL, '12 de Octubre', 'Villa Constitución', 'Santa Fe', '2919', 'Argentina', '0.00', 'Active', '', NULL, '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2022-04-29 17:44:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL),
(6, 'Matias', '', '', 'Empresa demo', '', 3, 5, '+1340049932', 'facundo.hernandez@contratosac.com.ar', NULL, '', 'VILLA CONSTITUCION', '', '2919', 'Argentina', '0.00', 'Active', 'NOTAS | |||||||||||||||||', NULL, '', 'ib../NJWwysxk', 'h1dkfpgjf0en04enl7y7146f5bc3d4822017d67b3fdf0e67d9b2', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 1, NULL, '589de2m367acloi10igs61651269921', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2022-04-29 18:05:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL),
(7, 'Pedro', '', '', '', '', 0, 1, '3403123123', 'pedro@ho.com', NULL, 'test demo', 'villa const', 'sta fe', '2919', 'Argentina', '0.00', 'Active', '', NULL, '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2022-05-02 17:04:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL),
(8, 'John Doe', '', '', 'The Acme Inc.', '', 0, 0, '123456789', 'demo@example.com', NULL, '424 Fake Street', 'Staten Island', 'Newyork', '10205', 'United States', '0.00', 'Active', '', NULL, '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL),
(9, 'Jane Doe', '', '', 'CloudOnex', '', 0, 0, '912345678', 'jane@example.com', NULL, '520 Grand View', 'Staten Island', 'Newyork', '10107', 'United States', '0.00', 'Active', '', NULL, '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_ctes_transportes`
--

CREATE TABLE `crm_ctes_transportes` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_transporte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_customfields`
--

CREATE TABLE `crm_customfields` (
  `id` int(10) NOT NULL,
  `ctype` text DEFAULT NULL,
  `relid` int(10) NOT NULL DEFAULT 0,
  `fieldname` text DEFAULT NULL,
  `fieldtype` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fieldoptions` text DEFAULT NULL,
  `regexpr` text DEFAULT NULL,
  `adminonly` text DEFAULT NULL,
  `required` text DEFAULT NULL,
  `showorder` text DEFAULT NULL,
  `showinvoice` text DEFAULT NULL,
  `sorder` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `crm_customfields`
--

INSERT INTO `crm_customfields` (`id`, `ctype`, `relid`, `fieldname`, `fieldtype`, `description`, `fieldoptions`, `regexpr`, `adminonly`, `required`, `showorder`, `showinvoice`, `sorder`) VALUES
(3, 'crm', 0, 'CUIT', 'text', '', '', '', '', '', '', 'Yes', 0),
(5, 'sys', 0, 'Personalizado', 'dropdown', '', 'opcion1, opcion2, opcion3', '', '', '', '', 'No', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_customfieldsvalues`
--

CREATE TABLE `crm_customfieldsvalues` (
  `id` int(10) NOT NULL,
  `fieldid` int(10) NOT NULL,
  `relid` int(10) NOT NULL,
  `fvalue` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `crm_customfieldsvalues`
--

INSERT INTO `crm_customfieldsvalues` (`id`, `fieldid`, `relid`, `fvalue`) VALUES
(9, 2, 3, 'facu'),
(10, 3, 3, '20341165623'),
(11, 4, 3, 'VIA Cargo'),
(12, 2, 2, 'Roberto'),
(13, 3, 2, '20341165623'),
(14, 4, 2, 'OCA'),
(15, 5, 2, ''),
(22, 2, 5, ''),
(23, 3, 5, ''),
(24, 4, 5, 'OCA'),
(25, 5, 5, ''),
(26, 2, 6, ''),
(27, 3, 6, '20341165623'),
(28, 4, 6, 'OCA'),
(29, 2, 7, ''),
(30, 3, 7, ''),
(31, 4, 7, ''),
(32, 2, 299, ''),
(33, 3, 299, ''),
(34, 4, 299, ''),
(35, 2, 300, ''),
(36, 3, 300, ''),
(37, 4, 300, ''),
(38, 2, 301, ''),
(39, 3, 301, '20341165623'),
(40, 4, 301, 'Expreso Villense'),
(41, 3, 302, ''),
(42, 4, 302, ''),
(43, 3, 303, ''),
(44, 4, 303, ''),
(45, 3, 304, ''),
(46, 4, 304, ''),
(47, 3, 305, ''),
(48, 4, 305, ''),
(49, 3, 306, ''),
(50, 4, 306, ''),
(51, 3, 307, ''),
(52, 4, 307, 'OCA'),
(53, 3, 308, ''),
(54, 4, 308, ''),
(55, 3, 309, ''),
(56, 4, 309, ''),
(59, 3, 311, ''),
(60, 4, 311, ''),
(61, 3, 312, ''),
(62, 4, 312, ''),
(63, 3, 313, ''),
(64, 4, 313, 'OCA'),
(65, 3, 314, ''),
(66, 4, 314, ''),
(67, 3, 315, ''),
(68, 4, 315, ''),
(69, 3, 316, ''),
(70, 4, 316, ''),
(71, 3, 317, ''),
(72, 4, 317, ''),
(73, 3, 318, ''),
(74, 4, 318, ''),
(75, 3, 319, ''),
(76, 4, 319, ''),
(77, 3, 320, ''),
(78, 4, 320, ''),
(79, 3, 321, ''),
(80, 4, 321, ''),
(81, 3, 322, ''),
(82, 4, 322, ''),
(83, 3, 323, ''),
(84, 4, 323, ''),
(85, 3, 324, ''),
(86, 4, 324, ''),
(87, 3, 325, ''),
(88, 4, 325, ''),
(89, 3, 326, ''),
(90, 4, 326, ''),
(91, 3, 327, ''),
(92, 4, 327, ''),
(93, 3, 328, ''),
(94, 4, 328, ''),
(95, 3, 329, ''),
(96, 4, 329, ''),
(97, 3, 330, ''),
(98, 4, 330, ''),
(99, 3, 331, ''),
(100, 4, 331, ''),
(103, 3, 310, ''),
(104, 4, 310, 'OCA'),
(105, 5, 310, ''),
(106, 3, 332, ''),
(107, 4, 332, 'OCA'),
(108, 5, 332, ''),
(109, 3, 333, ''),
(110, 4, 333, ''),
(111, 3, 334, ''),
(112, 4, 334, ''),
(113, 3, 335, ''),
(114, 4, 335, ''),
(115, 3, 336, ''),
(116, 4, 336, ''),
(117, 3, 337, ''),
(118, 4, 337, ''),
(119, 3, 338, ''),
(120, 4, 338, ''),
(121, 3, 339, ''),
(122, 4, 339, ''),
(123, 3, 340, ''),
(124, 4, 340, ''),
(125, 3, 341, ''),
(126, 4, 341, ''),
(127, 3, 342, ''),
(128, 4, 342, ''),
(129, 3, 4, '20341165623'),
(130, 4, 4, 'OCA'),
(131, 5, 4, ''),
(132, 3, 343, ''),
(133, 4, 343, 'OCA'),
(134, 3, 344, ''),
(135, 4, 344, 'OCA'),
(136, 3, 345, ''),
(137, 4, 345, 'OCA'),
(138, 3, 346, ''),
(139, 4, 346, 'OCA'),
(140, 3, 347, ''),
(141, 4, 347, 'OCA'),
(144, 3, 349, ''),
(145, 4, 349, 'OCA'),
(146, 3, 350, ''),
(147, 4, 350, 'OCA'),
(148, 3, 351, ''),
(149, 4, 351, 'OCA'),
(150, 3, 348, ''),
(151, 4, 348, 'OCA'),
(152, 5, 348, ''),
(153, 3, 352, ''),
(154, 4, 352, 'OCA'),
(155, 3, 1, '20341165623'),
(156, 4, 1, 'OCA'),
(157, 3, 2, ''),
(158, 4, 2, 'OCA'),
(159, 3, 3, ''),
(160, 4, 3, 'OCA'),
(161, 3, 4, ''),
(162, 4, 4, ''),
(163, 3, 5, ''),
(164, 4, 5, ''),
(165, 3, 6, ''),
(166, 4, 6, ''),
(167, 3, 7, ''),
(168, 4, 7, ''),
(169, 3, 8, ''),
(170, 4, 8, ''),
(171, 3, 9, ''),
(172, 4, 9, 'OCA'),
(173, 3, 10, ''),
(174, 4, 10, 'OCA'),
(175, 3, 11, ''),
(176, 4, 11, 'OCA'),
(177, 3, 12, ''),
(178, 4, 12, 'OCA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_groups`
--

CREATE TABLE `crm_groups` (
  `id` int(11) NOT NULL,
  `gname` varchar(200) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `discount` varchar(50) DEFAULT NULL,
  `parent` varchar(200) DEFAULT NULL,
  `pid` int(10) DEFAULT NULL,
  `exempt` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `separateinvoices` text DEFAULT NULL,
  `sorder` int(10) DEFAULT NULL,
  `c1` varchar(200) DEFAULT NULL,
  `c2` varchar(200) DEFAULT NULL,
  `c3` varchar(200) DEFAULT NULL,
  `c4` varchar(200) DEFAULT NULL,
  `c5` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `crm_groups`
--

INSERT INTO `crm_groups` (`id`, `gname`, `color`, `discount`, `parent`, `pid`, `exempt`, `description`, `separateinvoices`, `sorder`, `c1`, `c2`, `c3`, `c4`, `c5`) VALUES
(1, 'Proveedores', '', '', '', 0, '', '', '', 0, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_industries`
--

CREATE TABLE `crm_industries` (
  `id` int(11) NOT NULL,
  `industry` varchar(200) DEFAULT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `is_default` int(1) NOT NULL DEFAULT 0,
  `sorder` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `crm_industries`
--

INSERT INTO `crm_industries` (`id`, `industry`, `is_active`, `is_default`, `sorder`, `created_at`, `updated_at`) VALUES
(1, 'Agriculture', 1, 0, 0, NULL, NULL),
(2, 'Apparel', 1, 0, 0, NULL, NULL),
(3, 'Banking', 1, 0, 0, NULL, NULL),
(4, 'Biotechnology', 1, 0, 0, NULL, NULL),
(5, 'Chemicals', 1, 0, 0, NULL, NULL),
(6, 'Communications', 1, 0, 0, NULL, NULL),
(7, 'Construction', 1, 0, 0, NULL, NULL),
(8, 'Consulting', 1, 0, 0, NULL, NULL),
(9, 'Education', 1, 0, 0, NULL, NULL),
(10, 'Electronics', 1, 0, 0, NULL, NULL),
(11, 'Energy', 1, 0, 0, NULL, NULL),
(12, 'Engineering', 1, 0, 0, NULL, NULL),
(13, 'Entertainment', 1, 0, 0, NULL, NULL),
(14, 'Environmental', 1, 0, 0, NULL, NULL),
(15, 'Finance', 1, 0, 0, NULL, NULL),
(16, 'Food & Beverage', 1, 0, 0, NULL, NULL),
(17, 'Government', 1, 0, 0, NULL, NULL),
(18, 'Healthcare', 1, 0, 0, NULL, NULL),
(19, 'Hospitality', 1, 0, 0, NULL, NULL),
(20, 'Insurance', 1, 0, 0, NULL, NULL),
(21, 'Machinery', 1, 0, 0, NULL, NULL),
(22, 'Manufacturing', 1, 0, 0, NULL, NULL),
(23, 'Media', 1, 0, 0, NULL, NULL),
(24, 'Not For Profit', 1, 0, 0, NULL, NULL),
(25, 'Other', 1, 0, 0, NULL, NULL),
(26, 'Recreation', 1, 0, 0, NULL, NULL),
(27, 'Retail', 1, 0, 0, NULL, NULL),
(28, 'Shipping', 1, 0, 0, NULL, NULL),
(29, 'Technology', 1, 0, 0, NULL, NULL),
(30, 'Telecommunications', 1, 0, 0, NULL, NULL),
(31, 'Transportation', 1, 0, 0, NULL, NULL),
(32, 'Utilities', 1, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_leads`
--

CREATE TABLE `crm_leads` (
  `id` int(11) NOT NULL,
  `secret` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `o` varchar(200) DEFAULT NULL,
  `oid` int(11) NOT NULL DEFAULT 0,
  `salutation` varchar(200) DEFAULT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `middle_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `suffix` varchar(200) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `website` varchar(200) DEFAULT NULL,
  `industry` varchar(200) DEFAULT NULL,
  `employees` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `source` varchar(200) DEFAULT NULL,
  `added_from` varchar(200) DEFAULT NULL,
  `mobile` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `street` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `created_by` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(200) DEFAULT NULL,
  `viewed_at` datetime DEFAULT NULL,
  `cid` int(11) NOT NULL DEFAULT 0,
  `aid` int(11) NOT NULL DEFAULT 0,
  `iid` int(11) NOT NULL DEFAULT 0,
  `rid` int(11) NOT NULL DEFAULT 0,
  `sorder` int(11) NOT NULL DEFAULT 0,
  `assigned` int(11) NOT NULL DEFAULT 0,
  `last_contact` datetime DEFAULT NULL,
  `last_contact_by` varchar(200) DEFAULT NULL,
  `date_converted` datetime DEFAULT NULL,
  `public` int(1) NOT NULL DEFAULT 0,
  `ratings` varchar(50) DEFAULT NULL,
  `flag` int(1) NOT NULL DEFAULT 0,
  `lost` int(1) NOT NULL DEFAULT 0,
  `junk` int(1) NOT NULL DEFAULT 0,
  `trash` int(1) NOT NULL DEFAULT 0,
  `archived` int(1) NOT NULL DEFAULT 0,
  `memo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_lead_sources`
--

CREATE TABLE `crm_lead_sources` (
  `id` int(11) NOT NULL,
  `sname` varchar(200) DEFAULT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `is_default` int(1) NOT NULL DEFAULT 1,
  `sorder` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `crm_lead_sources`
--

INSERT INTO `crm_lead_sources` (`id`, `sname`, `is_active`, `is_default`, `sorder`, `created_at`, `updated_at`) VALUES
(1, 'Advertisement', 1, 1, 0, NULL, NULL),
(2, 'Customer Event', 1, 1, 0, NULL, NULL),
(3, 'Employee Referral', 1, 1, 0, NULL, NULL),
(4, 'Google AdWords', 1, 1, 0, NULL, NULL),
(5, 'Other', 1, 1, 0, NULL, NULL),
(6, 'Partner', 1, 1, 0, NULL, NULL),
(7, 'Purchased List', 1, 1, 0, NULL, NULL),
(8, 'Trade Show', 1, 1, 0, NULL, NULL),
(9, 'Webinar', 1, 1, 0, NULL, NULL),
(10, 'Website', 1, 1, 0, NULL, NULL),
(11, 'Facebook', 1, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_lead_status`
--

CREATE TABLE `crm_lead_status` (
  `id` int(11) NOT NULL,
  `sname` varchar(200) DEFAULT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `is_default` int(1) NOT NULL DEFAULT 0,
  `is_converted` int(1) NOT NULL DEFAULT 0,
  `sorder` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `crm_lead_status`
--

INSERT INTO `crm_lead_status` (`id`, `sname`, `is_active`, `is_default`, `is_converted`, `sorder`, `created_at`, `updated_at`) VALUES
(1, 'Unqualified', 1, 0, 0, 0, NULL, NULL),
(2, 'New', 1, 1, 0, 0, NULL, NULL),
(3, 'Working', 1, 0, 0, 0, NULL, NULL),
(4, 'Nurturing', 1, 0, 0, 0, NULL, NULL),
(5, 'Qualified', 1, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_salutations`
--

CREATE TABLE `crm_salutations` (
  `id` int(11) NOT NULL,
  `sname` varchar(200) DEFAULT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `is_default` int(1) NOT NULL DEFAULT 0,
  `sorder` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `crm_salutations`
--

INSERT INTO `crm_salutations` (`id`, `sname`, `is_active`, `is_default`, `sorder`, `created_at`, `updated_at`) VALUES
(1, 'Mr.', 1, 0, 0, NULL, NULL),
(2, 'Ms.', 1, 0, 0, NULL, NULL),
(3, 'Mrs.', 1, 0, 0, NULL, NULL),
(4, 'Dr.', 1, 0, 0, NULL, NULL),
(5, 'Prof.', 1, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ib_doc_rel`
--

CREATE TABLE `ib_doc_rel` (
  `id` int(11) NOT NULL,
  `rtype` varchar(100) NOT NULL DEFAULT 'contact',
  `rid` int(11) NOT NULL DEFAULT 0,
  `did` int(11) NOT NULL DEFAULT 0,
  `can_download` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ib_invoice_access_log`
--

CREATE TABLE `ib_invoice_access_log` (
  `id` int(11) NOT NULL,
  `lid` int(11) NOT NULL DEFAULT 0,
  `cid` int(11) NOT NULL DEFAULT 0,
  `iid` int(11) NOT NULL DEFAULT 0,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `customer` varchar(200) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `browser` varchar(200) DEFAULT NULL,
  `referer` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `country_iso` varchar(20) DEFAULT NULL,
  `viewed_at` varchar(200) DEFAULT NULL,
  `lat` varchar(100) DEFAULT NULL,
  `lon` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relations`
--

CREATE TABLE `relations` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_accounts`
--

CREATE TABLE `sys_accounts` (
  `id` int(11) NOT NULL,
  `account` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `balance` decimal(18,2) NOT NULL DEFAULT 0.00,
  `bank_name` varchar(200) DEFAULT NULL,
  `account_number` varchar(200) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `branch` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `contact_person` varchar(200) DEFAULT NULL,
  `contact_phone` varchar(100) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `ib_url` varchar(200) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `sorder` int(11) DEFAULT NULL,
  `e` varchar(200) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_accounts`
--

INSERT INTO `sys_accounts` (`id`, `account`, `description`, `balance`, `bank_name`, `account_number`, `currency`, `branch`, `address`, `contact_person`, `contact_phone`, `website`, `ib_url`, `created`, `notes`, `sorder`, `e`, `token`, `status`) VALUES
(1, 'CBU BBVA', 'CBU BBVA', '12922311.06', '', '', '', '', '', '', '', '', '', '2022-04-28', '', 1, '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_activity`
--

CREATE TABLE `sys_activity` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT 0,
  `msg` text NOT NULL,
  `icon` varchar(100) NOT NULL DEFAULT '',
  `stime` varchar(50) NOT NULL,
  `sdate` date NOT NULL,
  `o` int(11) NOT NULL DEFAULT 0,
  `oname` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_activity`
--

INSERT INTO `sys_activity` (`id`, `cid`, `msg`, `icon`, `stime`, `sdate`, `o`, `oname`) VALUES
(1, 6, '<p>asdasd</p>', 'fa fa-check', '1651337966', '2022-04-30', 1, 'Administrator'),
(2, 6, '<p>asdasdasdasdasdasd</p>', 'fa fa-truck', '1651337994', '2022-04-30', 1, 'Administrator'),
(3, 4, '<p>lo llame a pedrito</p>', 'fa fa-phone', '1651612107', '2022-05-03', 1, 'Administrator'),
(4, 279, '<p>asdasd</p>', 'fa fa-life-ring', '1651852036', '2022-05-06', 5, 'test'),
(5, 298, '<p>adasasdasd</p>', 'fa fa-reply', '1651864048', '2022-05-06', 5, 'test'),
(6, 301, '<p>notas</p>', 'fa fa-credit-card', '1652470962', '2022-05-13', 1, 'Administrator'),
(7, 302, '<p>asd</p>', 'fa fa-check', '1652548971', '2022-05-14', 1, 'Administrator');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_api`
--

CREATE TABLE `sys_api` (
  `id` int(11) NOT NULL,
  `label` text DEFAULT NULL,
  `ip` text DEFAULT NULL,
  `apikey` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_api`
--

INSERT INTO `sys_api` (`id`, `label`, `ip`, `apikey`) VALUES
(1, 'export', '', 'k9rgspiszww7mvi0q2n38juix3oqod35j8qowebh');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_appconfig`
--

CREATE TABLE `sys_appconfig` (
  `id` int(11) NOT NULL,
  `setting` text NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_appconfig`
--

INSERT INTO `sys_appconfig` (`id`, `setting`, `value`) VALUES
(1, 'CompanyName', 'LUMAT'),
(29, 'theme', 'ibilling'),
(37, 'currency_code', 'AR$'),
(56, 'language', 'es_419'),
(57, 'show-logo', '1'),
(58, 'nstyle', 'blue'),
(63, 'dec_point', '.'),
(64, 'thousands_sep', ','),
(65, 'timezone', 'America/Argentina/Buenos_Aires'),
(66, 'country', 'Argentina'),
(67, 'country_code', 'US'),
(68, 'df', 'd/m/Y'),
(69, 'caddress', 'LUMAT - Soluciones Industriales <br>\r\nCUIT 30-71755009-5 <br>\r\nVilla Constitución, Santa Fe, Argentina <br>\r\ninfo@lumatsi.com - ventas@lumatsi.com <br>\r\nTel: (3400) 666681 - (3400) 443471'),
(70, 'account_search', '1'),
(71, 'redirect_url', 'dashboard'),
(72, 'rtl', '0'),
(73, 'ckey', '0982995697'),
(74, 'networth_goal', '200000'),
(75, 'sysEmail', 'demo@nubit.ar'),
(76, 'url_rewrite', '0'),
(77, 'build', '4900'),
(78, 'animate', '0'),
(79, 'pdf_font', 'dejavusanscondensed'),
(80, 'accounting', '1'),
(81, 'invoicing', '1'),
(82, 'quotes', '1'),
(83, 'client_dashboard', '1'),
(84, 'contact_set_view_mode', 'tbl'),
(85, 'invoice_terms', '<h4>LUMAT - Soluciones Industriales</h4><p>Villa Constitución, Santa Fe, Argentina<br>info@lumatsi.com - ventas@lumatsi.com<br>Tel: (3400) 666681 - (3400) 443471</p>'),
(86, 'console_notify_invoice_created', '1'),
(87, 'i_driver', 'v2'),
(88, 'purchase_code', ''),
(89, 'c_cache', ''),
(90, 'mininav', '1'),
(91, 'hide_footer', '1'),
(92, 'design', 'default'),
(93, 'default_landing_page', 'login'),
(94, 'recaptcha', '0'),
(95, 'recaptcha_sitekey', ''),
(96, 'recaptcha_secretkey', ''),
(97, 'home_currency', 'ARS'),
(98, 'currency_decimal_digits', 'true'),
(99, 'currency_symbol_position', 'p'),
(100, 'thousand_separator_placement', '3'),
(101, 'dashboard', 'legacy'),
(102, 'header_scripts', ''),
(103, 'footer_scripts', ''),
(104, 'ib_key', 'vLBLfhA6DNi1R2MFHO8IvFWr4Cn9665eHUF+L/sqAKM='),
(105, 'ib_s', 'PNhjeZ0sOFF3JNfzT2mLxvNNKPeh6ltqpE+G5LVSDSvgp/z79Sco7W4tJEoXYIl8'),
(106, 'ib_u_t', '1842216767'),
(107, 'ib_u_a', '0'),
(108, 'momentLocale', 'es_419'),
(109, 'contentAnimation', ''),
(110, 'calendar', '1'),
(111, 'leads', '1'),
(112, 'tasks', '1'),
(113, 'orders', '1'),
(114, 'show_quantity_as', ''),
(115, 'gmap_api_key', ''),
(116, 'license_key', ''),
(117, 'local_key', ''),
(118, 'add_fund', '0'),
(119, 'add_fund_minimum_deposit', '100'),
(120, 'add_fund_maximum_deposit', '2500'),
(121, 'add_fund_maximum_balance', '25000'),
(122, 'add_fund_require_active_order', '0'),
(123, 'sales_target', '10000'),
(124, 'industry', 'default'),
(125, 'inventory', '1'),
(126, 'secondary_currency', ''),
(127, 'customer_custom_username', '0'),
(128, 'documents', '1'),
(129, 'projects', '1'),
(130, 'purchase', '1'),
(131, 'suppliers', '1'),
(132, 'support', '1'),
(133, 'hrm', '1'),
(134, 'companies', '1'),
(135, 'plugins', '1'),
(136, 'country_flag_code', 'us'),
(137, 'graph_primary_color', '2196f3'),
(138, 'graph_secondary_color', 'eb3c00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_cart`
--

CREATE TABLE `sys_cart` (
  `id` int(11) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `items` text DEFAULT NULL,
  `total` decimal(16,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `ip` varchar(100) DEFAULT NULL,
  `fullname` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `browser` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `currency` varchar(200) DEFAULT NULL,
  `language` varchar(200) DEFAULT NULL,
  `coupon` varchar(200) DEFAULT NULL,
  `lat` varchar(50) DEFAULT NULL,
  `lon` varchar(50) DEFAULT NULL,
  `item_count` int(11) NOT NULL DEFAULT 0,
  `cid` int(11) NOT NULL DEFAULT 0,
  `aid` int(11) NOT NULL DEFAULT 0,
  `lid` int(11) NOT NULL DEFAULT 0,
  `currency_id` int(11) NOT NULL DEFAULT 0,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expiry` datetime DEFAULT NULL,
  `memo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_cats`
--

CREATE TABLE `sys_cats` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` enum('Income','Expense') NOT NULL,
  `sorder` int(11) NOT NULL DEFAULT 0,
  `total_amount` decimal(16,4) DEFAULT 0.0000,
  `budget` decimal(16,4) DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_cats`
--

INSERT INTO `sys_cats` (`id`, `name`, `type`, `sorder`, `total_amount`, `budget`, `created_at`, `updated_at`) VALUES
(15, 'Bank and Credit Card Interest', 'Expense', 23, '0.0000', '0.0000', NULL, NULL),
(16, 'Car and Truck', 'Expense', 24, '0.0000', '0.0000', NULL, NULL),
(17, 'Commissions and Fees', 'Expense', 25, '0.0000', '0.0000', NULL, NULL),
(18, 'Contract Labor', 'Expense', 26, '0.0000', '0.0000', NULL, NULL),
(19, 'Contributions', 'Expense', 27, '0.0000', '0.0000', NULL, NULL),
(20, 'Cost of Goods Sold', 'Expense', 28, '0.0000', '0.0000', NULL, NULL),
(21, 'Credit Card Interest', 'Expense', 29, '0.0000', '0.0000', NULL, NULL),
(22, 'Depreciation', 'Expense', 31, '0.0000', '0.0000', NULL, NULL),
(23, 'Dividend Payments', 'Expense', 32, '0.0000', '0.0000', NULL, NULL),
(24, 'Employee Benefit Programs', 'Expense', 33, '0.0000', '0.0000', NULL, NULL),
(25, 'Entertainment', 'Expense', 34, '0.0000', '0.0000', NULL, NULL),
(26, 'Gift', 'Expense', 35, '0.0000', '0.0000', NULL, NULL),
(27, 'Insurance', 'Expense', 36, '0.0000', '0.0000', NULL, NULL),
(28, 'Legal, Accountant &amp; Other Professional Services', 'Expense', 37, '0.0000', '0.0000', NULL, NULL),
(29, 'Meals', 'Expense', 38, '0.0000', '0.0000', NULL, NULL),
(30, 'Mortgage Interest', 'Expense', 39, '0.0000', '0.0000', NULL, NULL),
(31, 'Non-Deductible Expense', 'Expense', 40, '0.0000', '0.0000', NULL, NULL),
(33, 'Other Business Property Leasing', 'Expense', 22, '0.0000', '0.0000', NULL, NULL),
(34, 'Owner Draws', 'Expense', 21, '0.0000', '0.0000', NULL, NULL),
(35, 'Payroll Taxes', 'Expense', 8, '0.0000', '0.0000', NULL, NULL),
(37, 'Phone', 'Expense', 9, '0.0000', '0.0000', NULL, NULL),
(38, 'Postage', 'Expense', 10, '0.0000', '0.0000', NULL, NULL),
(39, 'Rent', 'Expense', 12, '0.0000', '0.0000', NULL, NULL),
(40, 'Repairs &amp; Maintenance', 'Expense', 11, '0.0000', '0.0000', NULL, NULL),
(41, 'Supplies', 'Expense', 13, '0.0000', '0.0000', NULL, NULL),
(42, 'Taxes and Licenses', 'Expense', 14, '0.0000', '0.0000', NULL, NULL),
(43, 'Transfer Funds', 'Expense', 15, '0.0000', '0.0000', NULL, NULL),
(44, 'Travel', 'Expense', 16, '0.0000', '0.0000', NULL, NULL),
(45, 'Utilities', 'Expense', 17, '0.0000', '0.0000', NULL, NULL),
(46, 'Vehicle, Machinery &amp; Equipment Rental or Leasing', 'Expense', 18, '0.0000', '0.0000', NULL, NULL),
(47, 'Wages', 'Expense', 19, '0.0000', '0.0000', NULL, NULL),
(48, 'Regular Income', 'Income', 1, '0.0000', '0.0000', NULL, NULL),
(49, 'Owner Contribution', 'Income', 12, '0.0000', '0.0000', NULL, NULL),
(50, 'Interest Income', 'Income', 11, '0.0000', '0.0000', NULL, NULL),
(51, 'Expense Refund', 'Income', 10, '0.0000', '0.0000', NULL, NULL),
(52, 'Other Income', 'Income', 9, '0.0000', '0.0000', NULL, NULL),
(53, 'Sueldos', 'Income', 8, '0.0000', '0.0000', NULL, NULL),
(54, 'Equities', 'Income', 7, '0.0000', '0.0000', NULL, NULL),
(55, 'Rent &amp; Royalties', 'Income', 6, '0.0000', '0.0000', NULL, NULL),
(56, 'Home equity', 'Income', 5, '0.0000', '0.0000', NULL, NULL),
(57, 'Part Time Work', 'Income', 3, '0.0000', '0.0000', NULL, NULL),
(58, 'Account Transfer', 'Income', 4, '0.0000', '0.0000', NULL, NULL),
(60, 'Health Care', 'Expense', 20, '0.0000', '0.0000', NULL, NULL),
(63, 'Loans', 'Expense', 30, '0.0000', '0.0000', NULL, NULL),
(64, 'Selling Software', 'Income', 2, '0.0000', '0.0000', NULL, NULL),
(65, 'Software Customization', 'Income', 13, '0.0000', '0.0000', NULL, NULL),
(66, 'Envato', 'Income', 0, '0.0000', '0.0000', NULL, NULL),
(67, 'Salary', 'Expense', 7, '0.0000', '0.0000', NULL, NULL),
(68, 'Paypal', 'Expense', 6, '0.0000', '0.0000', NULL, NULL),
(69, 'Office Equipment', 'Expense', 5, '0.0000', '0.0000', NULL, NULL),
(70, 'Staff Entertaining', 'Expense', 3, '0.0000', '0.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_companies`
--

CREATE TABLE `sys_companies` (
  `id` int(11) NOT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `logo_url` varchar(200) DEFAULT NULL,
  `logo_path` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `emails` text DEFAULT NULL,
  `phones` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `address1` varchar(200) DEFAULT NULL,
  `address2` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `source` varchar(200) DEFAULT NULL,
  `added_from` varchar(200) DEFAULT NULL,
  `o` varchar(200) DEFAULT NULL,
  `cid` int(11) NOT NULL DEFAULT 0,
  `aid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `oid` int(11) NOT NULL DEFAULT 0,
  `rid` int(11) NOT NULL DEFAULT 0,
  `assigned` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(200) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(200) DEFAULT NULL,
  `last_contact` datetime DEFAULT NULL,
  `last_contact_by` varchar(200) DEFAULT NULL,
  `ratings` varchar(50) DEFAULT NULL,
  `trash` int(1) NOT NULL DEFAULT 0,
  `archived` int(1) NOT NULL DEFAULT 0,
  `c1` text DEFAULT NULL,
  `c2` text DEFAULT NULL,
  `c3` text DEFAULT NULL,
  `c4` text DEFAULT NULL,
  `c5` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_companies`
--

INSERT INTO `sys_companies` (`id`, `company_name`, `url`, `logo_url`, `logo_path`, `email`, `phone`, `emails`, `phones`, `tags`, `description`, `notes`, `address1`, `address2`, `city`, `state`, `zip`, `country`, `source`, `added_from`, `o`, `cid`, `aid`, `pid`, `oid`, `rid`, `assigned`, `created_at`, `created_by`, `updated_at`, `updated_by`, `last_contact`, `last_contact_by`, `ratings`, `trash`, `archived`, `c1`, `c2`, `c3`, `c4`, `c5`) VALUES
(1, 'Lumat', 'http://', NULL, NULL, 'info@lumatsi.com', '03400454545', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(2, 'Cliente nuevo', 'http://', NULL, NULL, 'emailcliente@gmail.com', '0340054545454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_currencies`
--

CREATE TABLE `sys_currencies` (
  `id` int(11) NOT NULL,
  `cname` varchar(100) DEFAULT NULL,
  `iso_code` varchar(10) DEFAULT NULL,
  `symbol` varchar(20) DEFAULT NULL,
  `rate` decimal(16,8) NOT NULL DEFAULT 1.00000000,
  `prefix` varchar(20) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  `format` varchar(100) DEFAULT NULL,
  `decimal_separator` varchar(10) DEFAULT NULL,
  `thousand_separator` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(200) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(200) DEFAULT NULL,
  `available_in` text DEFAULT NULL,
  `isdefault` int(1) NOT NULL DEFAULT 0,
  `trash` int(1) NOT NULL DEFAULT 0,
  `archived` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_currencies`
--

INSERT INTO `sys_currencies` (`id`, `cname`, `iso_code`, `symbol`, `rate`, `prefix`, `suffix`, `format`, `decimal_separator`, `thousand_separator`, `created_at`, `created_by`, `updated_at`, `updated_by`, `available_in`, `isdefault`, `trash`, `archived`) VALUES
(1, '$', '$', '$', '1.00000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(2, 'USD', 'USD', 'U$S', '200.00000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_documents`
--

CREATE TABLE `sys_documents` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `file_o_name` varchar(200) DEFAULT NULL,
  `file_r_name` varchar(200) DEFAULT NULL,
  `file_mime_type` varchar(200) DEFAULT NULL,
  `file_path` varchar(200) DEFAULT NULL,
  `file_dl_token` varchar(200) DEFAULT NULL,
  `file_owner` int(11) NOT NULL DEFAULT 0,
  `version` varchar(100) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `sha1` varchar(40) DEFAULT NULL,
  `md5` varchar(32) DEFAULT NULL,
  `cid` int(11) NOT NULL DEFAULT 0,
  `gid` int(11) NOT NULL DEFAULT 0,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `aid` int(11) NOT NULL DEFAULT 0,
  `contacts` text DEFAULT NULL,
  `deals` text DEFAULT NULL,
  `leads` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(200) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(200) DEFAULT NULL,
  `customer_can_download` int(1) NOT NULL DEFAULT 0,
  `trash` int(1) NOT NULL DEFAULT 0,
  `archived` int(1) NOT NULL DEFAULT 0,
  `is_global` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_documents`
--

INSERT INTO `sys_documents` (`id`, `title`, `file_o_name`, `file_r_name`, `file_mime_type`, `file_path`, `file_dl_token`, `file_owner`, `version`, `link`, `sha1`, `md5`, `cid`, `gid`, `company_id`, `aid`, `contacts`, `deals`, `leads`, `created_at`, `created_by`, `updated_at`, `updated_by`, `customer_can_download`, `trash`, `archived`, `is_global`) VALUES
(3, 'asdasdasdas', NULL, NULL, 'txt', '_61f3a6db947692165169463410054407.txt', '92flwvzixjqapjbyh1bvajpdqopd78', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:03:55', NULL, NULL, NULL, 0, 0, 0, 0),
(4, 'asdasd', NULL, NULL, 'txt', '_1cc8a8ea415422165169464010359417.txt', 'l0j5e3egpvrhuqzimu3h9xsf1gzxcw', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:04:02', NULL, NULL, NULL, 0, 0, 0, 0),
(5, 'asdasd', NULL, NULL, 'txt', '_6412fef8885260165169464711081306.txt', '8z58nr66bm1oihttr29rpxpgd2x80h', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:04:08', NULL, NULL, NULL, 0, 0, 0, 0),
(6, 'asdasd', NULL, NULL, 'txt', '_f1903f23407291165169465310702380.txt', 'vk35zgs28kr6kwt656y7xx01m5wka6', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:04:14', NULL, NULL, NULL, 0, 0, 0, 0),
(7, 'dasd', NULL, NULL, 'txt', '_6562c5c148920416516946641032171.txt', 'rqj8j4poejofqdqiuqmnrbpf956ofb', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:04:24', NULL, NULL, NULL, 0, 0, 0, 0),
(8, 'asdasdas', NULL, NULL, 'txt', '_d339a893065691165169467110432123.txt', 'eopsdh4r12bwu3ef8oqm5c4d2sbmnx', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:04:32', NULL, NULL, NULL, 0, 0, 0, 0),
(9, 'asdasd', NULL, NULL, 'txt', '_d72a7ed3469813165169468011026243.txt', '6gwo72m3hfecnj73vgpybs7jyv6fe7', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:04:41', NULL, NULL, NULL, 0, 0, 0, 0),
(10, 'asdasd', NULL, NULL, 'txt', '_ad554d8c953917165169468610531309.txt', 'wn3pydy3e5c82johl55nkt9len1d0q', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:04:47', NULL, NULL, NULL, 0, 0, 0, 0),
(11, 'asd', NULL, NULL, 'txt', '_23af4b45165809165169469210346868.txt', 'o7q5mh83nfje0a35nspxzyll7hlmh1', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:04:54', NULL, NULL, NULL, 0, 0, 0, 0),
(12, 'asdasd', NULL, NULL, 'txt', '_87ba276e133262165169469910975633.txt', 'qctilqiw35kktq77zl0mwktc2o9vl7', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:05:00', NULL, NULL, NULL, 0, 0, 0, 0),
(13, 'asdasd', NULL, NULL, 'txt', '_c20bb2d9029431165169470410505791.txt', 'q8lgtudwhm56ybdzxsebmfbkrd9dk1', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:05:05', NULL, NULL, NULL, 0, 0, 0, 0),
(14, 'qweqwe', NULL, NULL, 'txt', '_866c7ee0788130165169471610059814.txt', 'ww389mm73uftfszccovz63ddst4pwv', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:05:16', NULL, NULL, NULL, 0, 0, 0, 0),
(15, 'asdasdasd', NULL, NULL, 'txt', '_6ae94857852227165169472211089251.txt', 'tdeqnmspgfjpzna65x0vc12meu710a', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:05:23', NULL, NULL, NULL, 0, 0, 0, 0),
(16, 'asdasd', NULL, NULL, 'txt', '_8a56257e42970516516947301053977.txt', '0gvnc10werj685qqbxtc2zzgdagw9n', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:05:31', NULL, NULL, NULL, 0, 0, 0, 0),
(17, 'asdasdasd', NULL, NULL, 'txt', '_7486cef2943137165169473810021166.txt', '7oid6m3cv4qf93g29bpomjn8n3ye34', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:05:39', NULL, NULL, NULL, 0, 0, 0, 0),
(18, 'ccc', NULL, NULL, 'txt', '_731309c4960499165169474610499324.txt', 'n9q3yety98sjdveqybm6fv2ol9kg5e', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:05:51', NULL, NULL, NULL, 0, 0, 0, 0),
(19, 'vvv', NULL, NULL, 'txt', '_8a057268306178165169475910002659.txt', 'm13us2untwagxuqd60prqt124hb6dx', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:06:00', NULL, NULL, NULL, 0, 0, 0, 0),
(20, 'asdas', NULL, NULL, 'txt', '_81e793dc464059165169476610699850.txt', 'b79grsldm1fwxa8wl2zjhfmp2h2xac', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:06:08', NULL, NULL, NULL, 0, 0, 0, 0),
(22, 'C:\\Users\\97605619\\Downloads\\test.txt', NULL, NULL, 'txt', '_0987b8b316300216516947781051286.txt', 'jnl64ksdfkwnbvboqirkk3gajper6h', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:06:19', NULL, NULL, NULL, 0, 0, 0, 0),
(23, 'C:\\Users\\97605619\\Downloads\\test.txt', NULL, NULL, 'txt', '_840b3784077358165169478410171380.txt', 'tclaqypexz97o4wf5vy7g4dy3ctklv', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:06:25', NULL, NULL, NULL, 0, 0, 0, 0),
(24, 'C:\\Users\\97605619\\Downloads\\test.txt', NULL, NULL, 'txt', '_0b105cf1622613165169479110278931.txt', 'qn3yahvqbz35kx85lhsnzj7g53edzn', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:06:32', NULL, NULL, NULL, 0, 0, 0, 0),
(25, 'C:\\Users\\97605619\\Downloads\\test.txt', NULL, NULL, 'txt', '_00003e3b140016165169479710933071.txt', 'skejxyl2ujcmza3ry6wgua4bs3axbg', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:06:39', NULL, NULL, NULL, 0, 0, 0, 0),
(26, 'C:\\Users\\97605619\\Downloads\\test.txt', NULL, NULL, 'txt', '_d8c24ca8813097165169480410572162.txt', 'xb5yy6ign2e5qr0o5in1t10nmwkr98', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:06:45', NULL, NULL, NULL, 0, 0, 0, 0),
(27, 'C:\\Users\\97605619\\Downloads\\test.txt', NULL, NULL, 'txt', '_3783f31a366353165169481311049098.txt', 'bponjn5pqhzr6lk8tkdyzn1ejftved', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:06:57', NULL, NULL, NULL, 0, 0, 0, 0),
(28, 'asdasd', NULL, NULL, 'txt', '_ba0a4d6e322284165169482110859925.txt', '43xnd3mgnfasrcjmgtwqzzuovxyf4w', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:07:03', NULL, NULL, NULL, 0, 0, 0, 0),
(29, 'asdasd', NULL, NULL, 'txt', '_a60937eb425462165169482710229026.txt', 'yrjy41t3yx7s15gnlxndc7j3xb86vo', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '2022-05-04 16:07:08', NULL, NULL, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_emailconfig`
--

CREATE TABLE `sys_emailconfig` (
  `id` int(11) NOT NULL,
  `method` varchar(50) NOT NULL,
  `host` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `apikey` varchar(200) NOT NULL,
  `port` varchar(10) NOT NULL,
  `secure` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_emailconfig`
--

INSERT INTO `sys_emailconfig` (`id`, `method`, `host`, `username`, `password`, `apikey`, `port`, `secure`) VALUES
(1, 'smtp', 'nubit.ar', 'demo@nubit.ar', 'Prueba2020', '', '587', 'tls');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_email_logs`
--

CREATE TABLE `sys_email_logs` (
  `id` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `sender` varchar(200) NOT NULL,
  `email` text NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `date` datetime DEFAULT NULL,
  `iid` int(11) NOT NULL DEFAULT 0,
  `rel_type` varchar(100) DEFAULT NULL,
  `rel_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_email_logs`
--

INSERT INTO `sys_email_logs` (`id`, `userid`, `sender`, `email`, `subject`, `message`, `date`, `iid`, `rel_type`, `rel_id`) VALUES
(1, 2, '', 'facundohernandez@outlook.com', 'test', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		Dear test 2,&nbsp;<br> Here is the quote you requested for.  The quote is valid until 2022-05-28.	</div><div style=\"padding:10px 5px\">    Quote Unique URL: <a href=\"http://localhost:8080/gestion/?ng=client/q/1/token_4630611777\" target=\"_blank\">http://localhost:8080/gestion/?ng=client/q/1/token_4630611777</a><br></div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">You may view the quote at any time and simply reply to this email with any further questions or requirement.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>LUMAT Team</div></div></div>', '2022-04-28 09:47:56', 0, NULL, 0),
(2, 2, '', 'customer@example.com', 'TEST', 'TEST', '2022-04-28 09:57:41', 0, NULL, 0),
(3, 3, '', 'facundohernandez@outlook.com', 'Asunto del pedido', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		Dear Facundo Hernández,&nbsp;<br> Here is the quote you requested for.  The quote is valid until 2022-05-28.	</div><div style=\"padding:10px 5px\">    Quote Unique URL: <a href=\"http://localhost/gestion/?ng=client/q/5/token_3336562608\" target=\"_blank\">http://localhost/gestion/?ng=client/q/5/token_3336562608</a><br></div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">You may view the quote at any time and simply reply to this email with any further questions or requirement.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>LUMAT Team</div></div></div>', '2022-04-29 11:14:50', 0, NULL, 0),
(4, 3, '', 'facundohernandez@outlook.com', 'Asunto del pedido', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		Dear Facundo Hernández,&nbsp;<br> Here is the quote you requested for.  The quote is valid until 2022-05-28.	</div><div style=\"padding:10px 5px\">    Quote Unique URL: <a href=\"http://localhost/gestion/?ng=client/q/5/token_3336562608\" target=\"_blank\">http://localhost/gestion/?ng=client/q/5/token_3336562608</a><br></div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">You may view the quote at any time and simply reply to this email with any further questions or requirement.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>LUMAT Team</div></div></div>', '2022-04-29 11:24:29', 0, NULL, 0),
(5, 3, '', 'facundohernandez@outlook.com', 'test', '<p>test</p>', '2022-04-29 11:26:04', 0, NULL, 0),
(6, 3, '', 'facundohernandez@outlook.com', 'test', '<p>asdasd</p>', '2022-04-29 11:51:15', 0, NULL, 0),
(7, 2, '', 'facundohernandezd@gmail.com', 'asdasd', '<p>asdasd</p>', '2022-04-29 11:51:46', 0, NULL, 0),
(8, 3, '', 'facundohernandez@outlook.com', 'Asunto del pedido', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		Dear Facundo Hernández,&nbsp;<br> Here is the quote you requested for.  The quote is valid until 2022-05-28.	</div><div style=\"padding:10px 5px\">    Quote Unique URL: <a href=\"http://localhost/gestion/?ng=client/q/5/token_3336562608\" target=\"_blank\">http://localhost/gestion/?ng=client/q/5/token_3336562608</a><br></div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">You may view the quote at any time and simply reply to this email with any further questions or requirement.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>LUMAT Team</div></div></div>', '2022-04-29 11:58:57', 0, NULL, 0),
(9, 3, '', 'facundohernandez@outlook.com', 'asd', '<p>asd</p>', '2022-04-29 12:00:00', 0, NULL, 0),
(10, 3, '', 'facundohernandez@outlook.com', 'asd', '<p>asd</p>', '2022-04-29 12:00:36', 0, NULL, 0),
(11, 3, '', 'facundohernandez@outlook.com', 'qqqq', '<p>qqqqqqqqqqqqq</p>', '2022-04-29 12:00:54', 0, NULL, 0),
(12, 3, '', 'facundohernandez@outlook.com', 'phpmail', '<p>phpmail</p>', '2022-04-29 12:03:11', 0, NULL, 0),
(13, 3, '', 'facundohernandez@outlook.com', 'test from crm', '<p>test</p>', '2022-04-29 12:40:54', 0, NULL, 0),
(14, 3, '', 'facundohernandez@outlook.com', 'test web', '<p>123123123</p>', '2022-04-29 12:46:24', 0, NULL, 0),
(15, 3, '', 'facundohernandez@outlook.com', 'Asunto del pedido', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		Dear Facundo Hernández,&nbsp;<br> Here is the quote you requested for.  The quote is valid until 2022-05-28.	</div><div style=\"padding:10px 5px\">    Quote Unique URL: <a href=\"http://localhost/gestion/?ng=client/q/5/token_3336562608\" target=\"_blank\">http://localhost/gestion/?ng=client/q/5/token_3336562608</a><br></div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">You may view the quote at any time and simply reply to this email with any further questions or requirement.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>LUMAT Team</div></div></div>', '2022-04-29 12:47:50', 0, NULL, 0),
(16, 4, '', 'facundohernandez@outlook.com', 'Asunto del presupuesto - Prueba', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">Esto es personalizable - automatico. Con el PDF adjunto.. etc etc</div><div style=\"padding:5px;font-size:11pt;font-weight:bold\">chau</div><div style=\"padding:0px 5px\"><div>LUMAT Team</div></div></div>', '2022-04-29 13:01:44', 0, NULL, 0),
(17, 3, '', 'facundohernandez@outlook.com', 'Asunto del pedido tesssssssssssst', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		Dear Facundo Hernández,&nbsp;<br> Here is the quote you requested for.  The quote is valid until 2022-05-28.	</div><div style=\"padding:10px 5px\">    Quote Unique URL: <a href=\"http://localhost/gestion/?ng=client/q/5/token_3336562608\" target=\"_blank\">http://localhost/gestion/?ng=client/q/5/token_3336562608</a><br></div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">You may view the quote at any time and simply reply to this email with any further questions or requirement.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>LUMAT Team</div></div></div>', '2022-04-29 13:05:26', 0, NULL, 0),
(18, 3, '', 'facundohernandez@outlook.com', 'test 5', '<p>test</p>', '2022-04-29 13:09:14', 0, NULL, 0),
(19, 3, '', 'facundohernandez@outlook.com', 'Cotización de prueba - Facundo Hernández', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		Dear Facundo Hernández,&nbsp;<br> Here is the quote you requested for.  The quote is valid until 2022-05-31.	</div><div style=\"padding:10px 5px\">    Quote Unique URL: <a href=\"http://localhost/gestion/?ng=client/q/3/token_1609541272\" target=\"_blank\">http://localhost/gestion/?ng=client/q/3/token_1609541272</a><br></div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">You may view the quote at any time and simply reply to this email with any further questions or requirement.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>LUMAT Team</div></div></div>', '2022-04-29 13:22:22', 0, NULL, 0),
(20, 2, '', 'facundohernandezd@gmail.com', 'TEST', 'TEST', '2022-04-29 15:37:55', 0, NULL, 0),
(21, 3, '', 'facundohernandez@outlook.com', 'Asunto de la cotizacion', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\"><span style=\"font-size: 10pt;\">Dear Facundo Hernández,&nbsp;</span><br></div><div style=\"padding:5px\"> Enviamos en adjunto la cotización&nbsp;<span style=\"font-size: 10pt;\">2022-05-31.</span></div><div style=\"padding:10px 5px\"><span style=\"font-size: 13.3333px;\">Quedamos a dsposición.</span><br></div><div style=\"padding:0px 5px\">	<div>Saludos.</div><div>Atte.-</div><div>LUMAT Team</div></div></div>', '2022-04-29 16:27:12', 0, NULL, 0),
(22, 6, '', 'facundo.hernandez@contratosac.com.ar', 'pedido', '<p><strong>teasdasd</strong></p>\n<p><strong>asdasdasdasdasdasdasdasd</strong></p>', '2022-04-29 18:08:52', 0, NULL, 0),
(23, 3, '', 'facundohernandez@outlook.com', 'LUMAT Invoice', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,\'droid sans\',\'lucida sans\',sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		This email serves as your official invoice from <strong>LUMAT. </strong>	</div><div style=\"padding:10px 5px\">    Invoice URL: <a href=\"http://localhost/gestion/?ng=client/iview/6/token_3338870480\" target=\"_blank\">http://localhost/gestion/?ng=client/iview/6/token_3338870480</a><a target=\"_blank\" style=\"color:#1da9c0;font-weight:bold;padding:3px;text-decoration:none\" href=\"{{app_url}}\"></a><br>Invoice ID: 6<br>Invoice Amount: 15,136.00<br>Due Date: 2022-05-04</div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">If you have any questions or need assistance, please don\'t hesitate to contact us.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>LUMAT Team</div></div></div>', '2022-05-02 10:36:12', 6, NULL, 0),
(24, 3, '', 'facundohernandez@outlook.com', 'LUMAT Invoice', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,\'droid sans\',\'lucida sans\',sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		This email serves as your official invoice from <strong>LUMAT. </strong>	</div><div style=\"padding:10px 5px\">    Invoice URL: <a href=\"http://localhost/gestion/?ng=client/iview/6/token_3338870480\" target=\"_blank\">http://localhost/gestion/?ng=client/iview/6/token_3338870480</a><a target=\"_blank\" style=\"color:#1da9c0;font-weight:bold;padding:3px;text-decoration:none\" href=\"{{app_url}}\"></a><br>Invoice ID: 6<br>Invoice Amount: 15,136.00<br>Due Date: 2022-05-04</div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">If you have any questions or need assistance, please don\'t hesitate to contact us.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>LUMAT Team</div></div></div>', '2022-05-02 10:42:14', 6, NULL, 0),
(25, 3, '', 'facundohernandez@outlook.com', 'LUMAT Invoice', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,\'droid sans\',\'lucida sans\',sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		This email serves as your official invoice from <strong>LUMAT. </strong>	</div><div style=\"padding:10px 5px\">    Invoice URL: <a href=\"{{invoice_url}}\" target=\"_blank\">{{invoice_url}}</a><a target=\"_blank\" style=\"color:#1da9c0;font-weight:bold;padding:3px;text-decoration:none\" href=\"{{app_url}}\"></a><br>Invoice ID: 6<br>Invoice Amount: 15,136.00<br>Due Date: 2022-05-04</div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">If you have any questions or need assistance, please don\'t hesitate to contact us.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>LUMAT Team</div></div></div>', '2022-05-02 10:46:55', 6, NULL, 0),
(26, 3, '', 'facundohernandez@outlook.com', 'LUMAT Invoice', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,\'droid sans\',\'lucida sans\',sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		This email serves as your official invoice from <strong>LUMAT. </strong>	</div><div style=\"padding:10px 5px\">    Invoice URL: <a href=\"{{invoice_url}}\" target=\"_blank\">{{invoice_url}}</a><a target=\"_blank\" style=\"color:#1da9c0;font-weight:bold;padding:3px;text-decoration:none\" href=\"{{app_url}}\"></a><br>Invoice ID: 6<br>Invoice Amount: 15,134.00<br>Due Date: 2022-05-04</div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">If you have any questions or need assistance, please don\'t hesitate to contact us.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>LUMAT Team</div></div></div>', '2022-05-02 11:27:37', 6, NULL, 0),
(27, 3, '', 'facundohernandez@outlook.com', 'LUMAT Invoice', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,\'droid sans\',\'lucida sans\',sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		This email serves as your official invoice from <strong>LUMAT. </strong>	</div><div style=\"padding:10px 5px\">    Invoice URL: <a href=\"{{invoice_url}}\" target=\"_blank\">{{invoice_url}}</a><a target=\"_blank\" style=\"color:#1da9c0;font-weight:bold;padding:3px;text-decoration:none\" href=\"{{app_url}}\"></a><br>Invoice ID: 6<br>Invoice Amount: 15,134.00<br>Due Date: 2022-05-04</div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">If you have any questions or need assistance, please don\'t hesitate to contact us.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>LUMAT Team</div></div></div>', '2022-05-02 12:01:25', 6, NULL, 0),
(28, 3, '', 'facundohernandez@outlook.com', 'LUMAT Invoice', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,\'droid sans\',\'lucida sans\',sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		This email serves as your official invoice from <strong>LUMAT. </strong>	</div><div style=\"padding:10px 5px\">    Invoice URL: <a href=\"{{invoice_url}}\" target=\"_blank\">{{invoice_url}}</a><a target=\"_blank\" style=\"color:#1da9c0;font-weight:bold;padding:3px;text-decoration:none\" href=\"{{app_url}}\"></a><br>Invoice ID: 00008<br>Invoice Amount: 23,667.60<br>Due Date: 2022-05-02</div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">If you have any questions or need assistance, please don\'t hesitate to contact us.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>LUMAT Team</div></div></div>', '2022-05-02 13:14:10', 8, NULL, 0),
(29, 3, '', 'facundohernandez@outlook.com', 'LUMAT Invoice', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,\'droid sans\',\'lucida sans\',sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		This email serves as your official invoice from <strong>LUMAT. </strong>	</div><div style=\"padding:10px 5px\">    Invoice URL: <a href=\"{{invoice_url}}\" target=\"_blank\">{{invoice_url}}</a><a target=\"_blank\" style=\"color:#1da9c0;font-weight:bold;padding:3px;text-decoration:none\" href=\"{{app_url}}\"></a><br>Invoice ID: 00008<br>Invoice Amount: 23,667.60<br>Due Date: 2022-05-02</div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">If you have any questions or need assistance, please don\'t hesitate to contact us.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>LUMAT Team</div></div></div>', '2022-05-02 13:15:10', 8, NULL, 0),
(30, 3, '', 'facundohernandez@outlook.com', 'LUMAT Invoice', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,\'droid sans\',\'lucida sans\',sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		This email serves as your official invoice from <strong>LUMAT. </strong>	</div><div style=\"padding:10px 5px\">    Invoice URL: <a href=\"{{invoice_url}}\" target=\"_blank\">{{invoice_url}}</a><a target=\"_blank\" style=\"color:#1da9c0;font-weight:bold;padding:3px;text-decoration:none\" href=\"{{app_url}}\"></a><br>Invoice ID: 00008<br>Invoice Amount: 23,667.60<br>Due Date: 2022-05-02</div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">If you have any questions or need assistance, please don\'t hesitate to contact us.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>LUMAT Team</div></div></div>', '2022-05-02 13:15:33', 8, NULL, 0),
(31, 0, '', 'facundohernandez@outlook.com', 'LUMAT Automation Activity', '================================================== <br>2022-05-12 16:14:32 : Schedule Jobs Started....... <br>2022-05-12 16:14:32 : Creating Accounting Snapshot <br>2022-05-12 16:14:32 : Accounting Snapshot created! <br>=============== Accounting Snaphsot ==================== <br>Accounting Snaphsot - Date: 2022-05-11<br>Total Income: $ 0.00<br>Total Expense: $ 0.00<br>================================================== <br>2022-05-12 16:14:32 : Creating Recurring Invoice <br>2022-05-12 16:14:32 : 0 Invoice created! <br>================================================== <br>', '2022-05-12 16:14:32', 0, NULL, 0),
(32, 300, '', 'facundohernandez@outlook.com', 'LUMAT Invoice', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,\'droid sans\',\'lucida sans\',sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		This email serves as your official invoice from <strong>LUMAT. </strong>	</div><div style=\"padding:10px 5px\">    Invoice URL: <a href=\"{{invoice_url}}\" target=\"_blank\">{{invoice_url}}</a><a target=\"_blank\" style=\"color:#1da9c0;font-weight:bold;padding:3px;text-decoration:none\" href=\"{{app_url}}\"></a><br>Invoice ID: 107<br>Invoice Amount: 555.00<br>Due Date: 2022-05-12</div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">If you have any questions or need assistance, please don\'t hesitate to contact us.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>LUMAT Team</div></div></div>', '2022-05-12 16:17:39', 107, NULL, 0),
(33, 301, '', 'facundohernandez@outlook.com', 'test', '<p>tesdt</p>', '2022-05-23 15:58:50', 0, NULL, 0),
(34, 301, '', 'facundohernandez@outlook.com', 'test2', '<p>test2</p>', '2022-05-23 16:00:08', 0, NULL, 0),
(35, 301, '', 'facundohernandez@outlook.com', 'test3', '<p>test</p>', '2022-05-23 16:04:57', 0, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_email_templates`
--

CREATE TABLE `sys_email_templates` (
  `id` int(11) NOT NULL,
  `tplname` varchar(128) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 1,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `send` varchar(50) DEFAULT 'Active',
  `core` enum('Yes','No') DEFAULT 'Yes',
  `hidden` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_email_templates`
--

INSERT INTO `sys_email_templates` (`id`, `tplname`, `language_id`, `subject`, `message`, `send`, `core`, `hidden`) VALUES
(3, 'Invoice:Invoice Created', 1, 'Pedido | {{business_name}} ', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,\'droid sans\',\'lucida sans\',sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"font-family: verdana, sans-serif; padding: 5px; font-size: 11pt; font-weight: bold;\"><span style=\"font-size: 10pt;\">Estimada/o {{contact_name}},&nbsp;</span><br></div><div style=\"padding: 5px; font-size: 11pt;\"><span style=\"font-size: 10pt;\">Enviamos adjunto el recibo de pago.</span><br></div><div style=\"padding:0px 5px\">	<div>Atte.-,<br>El equipo de {{business_name}}&nbsp;</div></div></div>', 'Yes', 'Yes', 0),
(7, 'Admin:Password Change Request', 1, '{{business_name}} password change request', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,\'droid sans\',\'lucida sans\',sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Hi {{name}},</div>	<div style=\"padding:5px\">		This is to confirm that we have received a Forgot Password request for your Account Username - {{username}} <br>From the IP Address - {{ip_address}}	</div>	<div style=\"padding:5px\">		Click this linke to reset your password- <br><a target=\"_blank\" style=\"color:#1da9c0;font-weight:bold;padding:3px;text-decoration:none\" href=\"{{password_reset_link}}\">{{password_reset_link}}</a>	</div><div style=\"padding:5px\">Please note: until your password has been changed, your current password will remain valid. The Forgot Password Link will be available for a limited time only.</div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>{{business_name}} Team</div></div></div>', 'Yes', 'Yes', 0),
(10, 'Admin:New Password', 1, '{{business_name}} New Password for Admin', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,\'droid sans\',\'lucida sans\',sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\">\n\n<div style=\"padding:5px;font-size:11pt;font-weight:bold\">\n   Hello {{name}}\n</div>\n\n\n	<div style=\"padding:5px\">\n		Here is your new password for <strong>{{business_name}}. </strong>\n	</div>\n\n	\n<div style=\"padding:10px 5px\">\n    Log in URL: <a target=\"_blank\" style=\"color:#1da9c0;font-weight:bold;padding:3px;text-decoration:none\" href=\"{{login_url}}\">{{login_url}}</a><br>Username: {{username}}<br>Password: {{password}}</div>\n\n<div style=\"padding:5px\">For security reason, Please change your password after login. </div>\n\n<div style=\"padding:0px 5px\">\n	<div>Best Regards,<br>{{business_name}} Team</div>\n\n</div>\n\n</div>', 'Yes', 'Yes', 0),
(12, 'Invoice:Invoice Payment Reminder', 1, '{{business_name}} Invoice Payment Reminder', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,\'droid sans\',\'lucida sans\',sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		This is a billing reminder that your invoice no. {{invoice_id}} which was generated on {{invoice_date}} is due on {{invoice_due_date}}. 	</div><div style=\"padding:10px 5px\">    Invoice URL: <a href=\"{{invoice_url}}\" target=\"_blank\">{{invoice_url}}</a><a target=\"_blank\" style=\"color:#1da9c0;font-weight:bold;padding:3px;text-decoration:none\" href=\"{{app_url}}\"></a><br>Invoice ID: {{invoice_id}}<br>Invoice Amount: {{invoice_amount}}<br>Due Date: {{invoice_due_date}}</div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">If you have any questions or need assistance, please don\'t hesitate to contact us.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>{{business_name}} Team</div></div></div>', 'Yes', 'Yes', 0),
(13, 'Invoice:Invoice Overdue Notice', 1, '{{business_name}} Invoice Overdue Notice', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,\'droid sans\',\'lucida sans\',sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		This is the notice that your invoice no. {{invoice_id}} which was generated on {{invoice_date}} is now overdue.	</div>	<div style=\"padding:10px 5px\">    Invoice URL: <a href=\"{{invoice_url}}\" target=\"_blank\">{{invoice_url}}</a><a target=\"_blank\" style=\"color:#1da9c0;font-weight:bold;padding:3px;text-decoration:none\" href=\"{{app_url}}\"></a><br>Invoice ID: {{invoice_id}}<br>Invoice Amount: {{invoice_amount}}<br>Due Date: {{invoice_due_date}}</div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">If you have any questions or need assistance, please don\'t hesitate to contact us.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>{{business_name}} Team</div></div></div>', 'Yes', 'Yes', 0),
(14, 'Invoice:Invoice Payment Confirmation', 1, '{{business_name}} Invoice Payment Confirmation', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,\'droid sans\',\'lucida sans\',sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\">\n\n<div style=\"padding:5px;font-size:11pt;font-weight:bold\">\n   Greetings,\n</div>\n\n\n\n	<div style=\"padding:5px\">\n		This is a payment receipt for Invoice {{invoice_id}} sent on {{invoice_date}}.\n	</div>\n\n\n	<div style=\"padding:5px\">\n		Login to your client Portal to view this invoice.\n	</div>\n\n\n<div style=\"padding:10px 5px\">\n    Invoice URL: <a href=\"{{invoice_url}}\" target=\"_blank\">{{invoice_url}}</a><a target=\"_blank\" style=\"color:#1da9c0;font-weight:bold;padding:3px;text-decoration:none\" href=\"{{app_url}}\"></a><br>Invoice ID: {{invoice_id}}<br>Invoice Amount: {{invoice_amount}}<br>Due Date: {{invoice_due_date}}</div>\n\n\n<div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">If you have any questions or need assistance, please don\'t hesitate to contact us.</span><br></div>\n\n\n<div style=\"padding:0px 5px\">\n	<div>Best Regards,<br>{{business_name}} Team</div>\n\n\n</div>\n\n\n</div>', 'Yes', 'Yes', 0),
(15, 'Invoice:Invoice Refund Confirmation', 1, '{{business_name}} Invoice Refund Confirmation', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,\'droid sans\',\'lucida sans\',sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\">   Greetings,</div>	<div style=\"padding:5px\">		This is confirmation that a refund has been processed for Invoice {{invoice_id}} sent on {{invoice_date}}.	</div><div style=\"padding:10px 5px\">    Invoice URL: <a href=\"{{invoice_url}}\" target=\"_blank\">{{invoice_url}}</a><a target=\"_blank\" style=\"color:#1da9c0;font-weight:bold;padding:3px;text-decoration:none\" href=\"{{app_url}}\"></a><br>Invoice ID: {{invoice_id}}<br>Invoice Amount: {{invoice_amount}}<br>Due Date: {{invoice_due_date}}</div><div style=\"padding:5px\"><span style=\"font-size: 13.3333330154419px; line-height: 21.3333320617676px;\">If you have any questions or need assistance, please don\'t hesitate to contact us.</span><br></div><div style=\"padding:0px 5px\">	<div>Best Regards,<br>{{business_name}} Team</div></div></div>', 'Yes', 'Yes', 0),
(16, 'Quote:Quote Created', 1, 'Presupuesto | {{quote_subject}}', '<div style=\"line-height:1.6;color:#222;text-align:left;width:550px;font-size:10pt;margin:0px 10px;font-family:verdana,sans-serif;padding:14px;border:3px solid #d8d8d8;border-top:3px solid #007bc3\"><div style=\"padding:5px;font-size:11pt;font-weight:bold\"><span style=\"font-size: 10pt;\">Estimada/o {{contact_name}},&nbsp;</span><br></div><div style=\"padding:5px\"> Enviamos en adjunto la cotización solicitada.</div><div style=\"padding:10px 5px\"><span style=\"font-size: 13.3333px;\">Estamos a disposición por cualquier duda o consulta.</span><br></div><div style=\"padding:0px 5px\">	<div>Saludos.</div><div>Atte.-</div><div>El equipo de {{business_name}}&nbsp;</div></div></div>', 'Yes', 'Yes', 0),
(17, 'Client:Client Signup Email', 1, 'Your {{business_name}} Login Info', '<p>Dear {{client_name}},</p>\n<p>Welcome to {{business_name}}.</p>\n<p>You can track your billing, profile, transactions from this portal.</p>\n<p>Your login information is as follows:</p>\n<p>---------------------------------------------------------------------------------------</p>\n<p>Login URL: {{client_login_url}} <br />Email Address: {{client_email}}<br /> Password: Your chosen password.</p>\n<p>----------------------------------------------------------------------------------------</p>\n<p>We very much appreciate you for choosing us.</p>\n<p>{{business_name}} Team</p>', 'Yes', 'Yes', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_events`
--

CREATE TABLE `sys_events` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `contacts` text DEFAULT NULL,
  `deals` text DEFAULT NULL,
  `owner` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `etype` varchar(200) DEFAULT NULL,
  `priority` varchar(200) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `o` varchar(200) DEFAULT NULL,
  `cid` int(11) NOT NULL DEFAULT 0,
  `aid` int(11) NOT NULL DEFAULT 0,
  `iid` int(11) NOT NULL DEFAULT 0,
  `oid` int(11) NOT NULL DEFAULT 0,
  `rid` int(11) NOT NULL DEFAULT 0,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `allday` int(1) NOT NULL DEFAULT 0,
  `notification` int(1) NOT NULL DEFAULT 0,
  `trash` int(1) NOT NULL DEFAULT 0,
  `archived` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_invoiceitems`
--

CREATE TABLE `sys_invoiceitems` (
  `id` int(10) NOT NULL,
  `invoiceid` int(10) NOT NULL DEFAULT 0,
  `userid` int(10) NOT NULL,
  `type` text NOT NULL,
  `relid` int(10) NOT NULL,
  `itemcode` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `qty` varchar(20) NOT NULL DEFAULT '1',
  `amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `taxed` int(1) NOT NULL,
  `taxamount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `duedate` date DEFAULT NULL,
  `paymentmethod` text NOT NULL,
  `notes` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_invoiceitems`
--

INSERT INTO `sys_invoiceitems` (`id`, `invoiceid`, `userid`, `type`, `relid`, `itemcode`, `description`, `qty`, `amount`, `taxed`, `taxamount`, `total`, `duedate`, `paymentmethod`, `notes`) VALUES
(19, 22, 1, '', 0, '', 'Item ingresado manualc con imp individual', '1', '2.00', 1, '0.00', '2.00', '2022-06-02', '', ''),
(20, 22, 1, '', 0, '', 'Eslinga de fibra sintética', '1', '22.00', 0, '0.00', '22.00', '2022-06-02', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_invoices`
--

CREATE TABLE `sys_invoices` (
  `id` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `account` varchar(200) NOT NULL,
  `cn` varchar(100) NOT NULL DEFAULT '',
  `invoicenum` text NOT NULL,
  `date` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `datepaid` datetime DEFAULT NULL,
  `subtotal` decimal(18,2) NOT NULL,
  `discount_type` varchar(1) NOT NULL DEFAULT 'f',
  `discount_value` decimal(14,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(10,2) NOT NULL DEFAULT 0.00,
  `taxname` varchar(100) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `tax2` decimal(10,2) NOT NULL,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `taxrate` decimal(10,2) NOT NULL,
  `taxrate2` decimal(10,2) NOT NULL,
  `status` text NOT NULL,
  `paymentmethod` text NOT NULL,
  `notes` text NOT NULL,
  `vtoken` varchar(20) NOT NULL,
  `ptoken` varchar(20) NOT NULL,
  `r` varchar(100) NOT NULL DEFAULT '0',
  `nd` date DEFAULT NULL,
  `eid` int(10) NOT NULL DEFAULT 0,
  `ename` varchar(200) NOT NULL DEFAULT '',
  `vid` int(11) NOT NULL DEFAULT 0,
  `currency` int(11) NOT NULL DEFAULT 0,
  `currency_symbol` varchar(10) DEFAULT NULL,
  `currency_prefix` varchar(10) DEFAULT NULL,
  `currency_suffix` varchar(10) DEFAULT NULL,
  `currency_rate` decimal(11,4) NOT NULL DEFAULT 1.0000,
  `recurring` tinyint(1) NOT NULL DEFAULT 0,
  `recurring_ends` date DEFAULT NULL,
  `last_recurring_date` date DEFAULT NULL,
  `source` varchar(200) DEFAULT NULL,
  `sale_agent` int(11) NOT NULL DEFAULT 0,
  `last_overdue_reminder` date DEFAULT NULL,
  `allowed_payment_methods` text DEFAULT NULL,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(50) DEFAULT NULL,
  `billing_country` varchar(100) DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` varchar(100) DEFAULT NULL,
  `q_hide` tinyint(1) NOT NULL DEFAULT 0,
  `show_quantity_as` varchar(100) DEFAULT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `is_credit_invoice` int(1) NOT NULL DEFAULT 0,
  `aid` int(11) NOT NULL DEFAULT 0,
  `aname` varchar(200) DEFAULT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_invoices`
--

INSERT INTO `sys_invoices` (`id`, `userid`, `account`, `cn`, `invoicenum`, `date`, `duedate`, `datepaid`, `subtotal`, `discount_type`, `discount_value`, `discount`, `credit`, `taxname`, `tax`, `tax2`, `total`, `taxrate`, `taxrate2`, `status`, `paymentmethod`, `notes`, `vtoken`, `ptoken`, `r`, `nd`, `eid`, `ename`, `vid`, `currency`, `currency_symbol`, `currency_prefix`, `currency_suffix`, `currency_rate`, `recurring`, `recurring_ends`, `last_recurring_date`, `source`, `sale_agent`, `last_overdue_reminder`, `allowed_payment_methods`, `billing_street`, `billing_city`, `billing_state`, `billing_zip`, `billing_country`, `shipping_street`, `shipping_city`, `shipping_state`, `shipping_zip`, `shipping_country`, `q_hide`, `show_quantity_as`, `pid`, `is_credit_invoice`, `aid`, `aname`, `description`) VALUES
(22, 1, 'Matias Cettour', '', '', '2022-06-02', '2022-06-02', NULL, '24.00', 'p', '0.00', '0.00', '0.00', 'IVA 10,5', '0.21', '0.00', '24.21', '10.50', '0.00', 'Unpaid', '', '<p>Origen: Cotización N° 10004<br /></p>', '2528581600', '4385242253', '0', '2022-06-02', 0, '', 0, 1, '$', NULL, NULL, '1.0000', 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_items`
--

CREATE TABLE `sys_items` (
  `id` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `unit` varchar(100) NOT NULL DEFAULT '',
  `sales_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `inventory` decimal(16,4) NOT NULL DEFAULT 0.0000,
  `weight` decimal(16,4) NOT NULL DEFAULT 0.0000,
  `width` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `length` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `height` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sku` varchar(50) DEFAULT NULL,
  `upc` varchar(50) DEFAULT NULL,
  `ean` varchar(50) DEFAULT NULL,
  `mpn` varchar(50) DEFAULT NULL,
  `isbn` varchar(50) DEFAULT NULL,
  `sid` int(11) NOT NULL DEFAULT 0,
  `supplier` varchar(200) DEFAULT NULL,
  `bid` int(11) NOT NULL DEFAULT 0,
  `brand` varchar(200) DEFAULT NULL,
  `sell_account` int(11) NOT NULL DEFAULT 0,
  `purchase_account` int(11) NOT NULL DEFAULT 0,
  `inventory_account` int(11) NOT NULL DEFAULT 0,
  `taxable` int(1) NOT NULL DEFAULT 0,
  `location` varchar(200) DEFAULT NULL,
  `item_number` varchar(100) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `type` enum('Service','Product') NOT NULL,
  `track_inventroy` enum('Yes','No') NOT NULL DEFAULT 'No',
  `negative_stock` enum('Yes','No') NOT NULL DEFAULT 'No',
  `available` int(11) NOT NULL DEFAULT 0,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `added` date DEFAULT NULL,
  `last_sold` date DEFAULT NULL,
  `e` mediumtext NOT NULL,
  `sorder` int(11) NOT NULL DEFAULT 0,
  `gid` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `supplier_id` int(11) NOT NULL DEFAULT 0,
  `gname` varchar(100) DEFAULT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `expire_days` int(11) NOT NULL DEFAULT 0,
  `image` text DEFAULT NULL,
  `flag` int(1) NOT NULL DEFAULT 0,
  `is_service` int(1) NOT NULL DEFAULT 0,
  `commission_percent` decimal(16,2) NOT NULL DEFAULT 0.00,
  `commission_percent_type` varchar(100) DEFAULT NULL,
  `commission_fixed` decimal(16,2) NOT NULL DEFAULT 0.00,
  `trash` int(1) NOT NULL DEFAULT 0,
  `payterm` varchar(200) DEFAULT NULL,
  `cost_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `unit_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `promo_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `setup` decimal(16,2) NOT NULL DEFAULT 0.00,
  `onetime` decimal(16,2) NOT NULL DEFAULT 0.00,
  `monthly` decimal(16,2) NOT NULL DEFAULT 0.00,
  `monthlysetup` decimal(16,2) NOT NULL DEFAULT 0.00,
  `quarterly` decimal(16,2) NOT NULL DEFAULT 0.00,
  `quarterlysetup` decimal(16,2) NOT NULL DEFAULT 0.00,
  `halfyearly` decimal(16,2) NOT NULL DEFAULT 0.00,
  `halfyearlysetup` decimal(16,2) NOT NULL DEFAULT 0.00,
  `annually` decimal(16,2) NOT NULL DEFAULT 0.00,
  `annuallysetup` decimal(16,2) NOT NULL DEFAULT 0.00,
  `biennially` decimal(16,2) NOT NULL DEFAULT 0.00,
  `bienniallysetup` decimal(16,2) NOT NULL DEFAULT 0.00,
  `triennially` decimal(16,2) NOT NULL DEFAULT 0.00,
  `trienniallysetup` decimal(16,2) NOT NULL DEFAULT 0.00,
  `has_domain` varchar(100) DEFAULT NULL,
  `free_domain` varchar(100) DEFAULT NULL,
  `email_rel` int(11) NOT NULL DEFAULT 0,
  `tags` text DEFAULT NULL,
  `c1` text DEFAULT NULL,
  `c2` text DEFAULT NULL,
  `c3` text DEFAULT NULL,
  `c4` text DEFAULT NULL,
  `c5` text DEFAULT NULL,
  `c6` text DEFAULT NULL,
  `c7` text DEFAULT NULL,
  `c8` text DEFAULT NULL,
  `c9` text DEFAULT NULL,
  `c10` text DEFAULT NULL,
  `c11` text DEFAULT NULL,
  `c12` text DEFAULT NULL,
  `c13` text DEFAULT NULL,
  `c14` text DEFAULT NULL,
  `c15` text DEFAULT NULL,
  `c16` text DEFAULT NULL,
  `c17` text DEFAULT NULL,
  `c18` text DEFAULT NULL,
  `c19` text DEFAULT NULL,
  `c20` text DEFAULT NULL,
  `c21` text DEFAULT NULL,
  `c22` text DEFAULT NULL,
  `c23` text DEFAULT NULL,
  `c24` text DEFAULT NULL,
  `c25` text DEFAULT NULL,
  `c26` text DEFAULT NULL,
  `c27` text DEFAULT NULL,
  `c28` text DEFAULT NULL,
  `c29` text DEFAULT NULL,
  `c30` text DEFAULT NULL,
  `sold_count` decimal(16,4) DEFAULT 0.0000,
  `total_amount` decimal(16,4) DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_items`
--

INSERT INTO `sys_items` (`id`, `name`, `unit`, `sales_price`, `inventory`, `weight`, `width`, `length`, `height`, `sku`, `upc`, `ean`, `mpn`, `isbn`, `sid`, `supplier`, `bid`, `brand`, `sell_account`, `purchase_account`, `inventory_account`, `taxable`, `location`, `item_number`, `description`, `type`, `track_inventroy`, `negative_stock`, `available`, `status`, `added`, `last_sold`, `e`, `sorder`, `gid`, `category_id`, `supplier_id`, `gname`, `product_id`, `size`, `start_date`, `end_date`, `expire_date`, `expire_days`, `image`, `flag`, `is_service`, `commission_percent`, `commission_percent_type`, `commission_fixed`, `trash`, `payterm`, `cost_price`, `unit_price`, `promo_price`, `setup`, `onetime`, `monthly`, `monthlysetup`, `quarterly`, `quarterlysetup`, `halfyearly`, `halfyearlysetup`, `annually`, `annuallysetup`, `biennially`, `bienniallysetup`, `triennially`, `trienniallysetup`, `has_domain`, `free_domain`, `email_rel`, `tags`, `c1`, `c2`, `c3`, `c4`, `c5`, `c6`, `c7`, `c8`, `c9`, `c10`, `c11`, `c12`, `c13`, `c14`, `c15`, `c16`, `c17`, `c18`, `c19`, `c20`, `c21`, `c22`, `c23`, `c24`, `c25`, `c26`, `c27`, `c28`, `c29`, `c30`, `sold_count`, `total_amount`, `created_at`, `updated_at`) VALUES
(10, 'Eslinga de fibra sintética', '', '22.00', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, '', 'Eslinga de fibra - descripción.', 'Product', 'No', 'No', 0, 'Active', NULL, NULL, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '0.00', NULL, '0.00', 0, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 0, '', 'ISO 2001', 'POLIESTER', '0:4', '2TON', '6TON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_items_old`
--

CREATE TABLE `sys_items_old` (
  `id` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `unit` varchar(100) NOT NULL DEFAULT '',
  `sales_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `inventory` decimal(16,4) NOT NULL DEFAULT 0.0000,
  `weight` decimal(16,4) NOT NULL DEFAULT 0.0000,
  `width` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `length` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `height` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sku` varchar(50) DEFAULT NULL,
  `upc` varchar(50) DEFAULT NULL,
  `ean` varchar(50) DEFAULT NULL,
  `mpn` varchar(50) DEFAULT NULL,
  `isbn` varchar(50) DEFAULT NULL,
  `sid` int(11) NOT NULL DEFAULT 0,
  `supplier` varchar(200) DEFAULT NULL,
  `bid` int(11) NOT NULL DEFAULT 0,
  `brand` varchar(200) DEFAULT NULL,
  `sell_account` int(11) NOT NULL DEFAULT 0,
  `purchase_account` int(11) NOT NULL DEFAULT 0,
  `inventory_account` int(11) NOT NULL DEFAULT 0,
  `taxable` int(1) NOT NULL DEFAULT 0,
  `location` varchar(200) DEFAULT NULL,
  `item_number` varchar(100) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `type` enum('Service','Product') NOT NULL,
  `track_inventroy` enum('Yes','No') NOT NULL DEFAULT 'No',
  `negative_stock` enum('Yes','No') NOT NULL DEFAULT 'No',
  `available` int(11) NOT NULL DEFAULT 0,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `added` date DEFAULT NULL,
  `last_sold` date DEFAULT NULL,
  `e` mediumtext NOT NULL,
  `sorder` int(11) NOT NULL DEFAULT 0,
  `gid` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `supplier_id` int(11) NOT NULL DEFAULT 0,
  `gname` varchar(100) DEFAULT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `expire_days` int(11) NOT NULL DEFAULT 0,
  `image` text DEFAULT NULL,
  `flag` int(1) NOT NULL DEFAULT 0,
  `is_service` int(1) NOT NULL DEFAULT 0,
  `commission_percent` decimal(16,2) NOT NULL DEFAULT 0.00,
  `commission_percent_type` varchar(100) DEFAULT NULL,
  `commission_fixed` decimal(16,2) NOT NULL DEFAULT 0.00,
  `trash` int(1) NOT NULL DEFAULT 0,
  `payterm` varchar(200) DEFAULT NULL,
  `cost_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `unit_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `promo_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `setup` decimal(16,2) NOT NULL DEFAULT 0.00,
  `onetime` decimal(16,2) NOT NULL DEFAULT 0.00,
  `monthly` decimal(16,2) NOT NULL DEFAULT 0.00,
  `monthlysetup` decimal(16,2) NOT NULL DEFAULT 0.00,
  `quarterly` decimal(16,2) NOT NULL DEFAULT 0.00,
  `quarterlysetup` decimal(16,2) NOT NULL DEFAULT 0.00,
  `halfyearly` decimal(16,2) NOT NULL DEFAULT 0.00,
  `halfyearlysetup` decimal(16,2) NOT NULL DEFAULT 0.00,
  `annually` decimal(16,2) NOT NULL DEFAULT 0.00,
  `annuallysetup` decimal(16,2) NOT NULL DEFAULT 0.00,
  `biennially` decimal(16,2) NOT NULL DEFAULT 0.00,
  `bienniallysetup` decimal(16,2) NOT NULL DEFAULT 0.00,
  `triennially` decimal(16,2) NOT NULL DEFAULT 0.00,
  `trienniallysetup` decimal(16,2) NOT NULL DEFAULT 0.00,
  `has_domain` varchar(100) DEFAULT NULL,
  `free_domain` varchar(100) DEFAULT NULL,
  `email_rel` int(11) NOT NULL DEFAULT 0,
  `tags` text DEFAULT NULL,
  `c1` text DEFAULT NULL,
  `c2` text DEFAULT NULL,
  `c3` text DEFAULT NULL,
  `c4` text DEFAULT NULL,
  `c5` text DEFAULT NULL,
  `c6` text DEFAULT NULL,
  `c7` text DEFAULT NULL,
  `c8` text DEFAULT NULL,
  `c9` text DEFAULT NULL,
  `c10` text DEFAULT NULL,
  `c11` text DEFAULT NULL,
  `c12` text DEFAULT NULL,
  `c13` text DEFAULT NULL,
  `c14` text DEFAULT NULL,
  `c15` text DEFAULT NULL,
  `c16` text DEFAULT NULL,
  `c17` text DEFAULT NULL,
  `c18` text DEFAULT NULL,
  `c19` text DEFAULT NULL,
  `c20` text DEFAULT NULL,
  `c21` text DEFAULT NULL,
  `c22` text DEFAULT NULL,
  `c23` text DEFAULT NULL,
  `c24` text DEFAULT NULL,
  `c25` text DEFAULT NULL,
  `c26` text DEFAULT NULL,
  `c27` text DEFAULT NULL,
  `c28` text DEFAULT NULL,
  `c29` text DEFAULT NULL,
  `c30` text DEFAULT NULL,
  `sold_count` decimal(16,4) DEFAULT 0.0000,
  `total_amount` decimal(16,4) DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_items_old`
--

INSERT INTO `sys_items_old` (`id`, `name`, `unit`, `sales_price`, `inventory`, `weight`, `width`, `length`, `height`, `sku`, `upc`, `ean`, `mpn`, `isbn`, `sid`, `supplier`, `bid`, `brand`, `sell_account`, `purchase_account`, `inventory_account`, `taxable`, `location`, `item_number`, `description`, `type`, `track_inventroy`, `negative_stock`, `available`, `status`, `added`, `last_sold`, `e`, `sorder`, `gid`, `category_id`, `supplier_id`, `gname`, `product_id`, `size`, `start_date`, `end_date`, `expire_date`, `expire_days`, `image`, `flag`, `is_service`, `commission_percent`, `commission_percent_type`, `commission_fixed`, `trash`, `payterm`, `cost_price`, `unit_price`, `promo_price`, `setup`, `onetime`, `monthly`, `monthlysetup`, `quarterly`, `quarterlysetup`, `halfyearly`, `halfyearlysetup`, `annually`, `annuallysetup`, `biennially`, `bienniallysetup`, `triennially`, `trienniallysetup`, `has_domain`, `free_domain`, `email_rel`, `tags`, `c1`, `c2`, `c3`, `c4`, `c5`, `c6`, `c7`, `c8`, `c9`, `c10`, `c11`, `c12`, `c13`, `c14`, `c15`, `c16`, `c17`, `c18`, `c19`, `c20`, `c21`, `c22`, `c23`, `c24`, `c25`, `c26`, `c27`, `c28`, `c29`, `c30`, `sold_count`, `total_amount`, `created_at`, `updated_at`) VALUES
(1, 'Eslinga de fibra sintetica 2ton', '', '5000.00', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, '1', 'Eslinga de fibra sintética 2ton', 'Product', 'No', 'No', 0, 'Active', NULL, NULL, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '0.00', NULL, '0.00', 0, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL),
(2, 'test', '', '2.00', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, '2', 'adasdasd', 'Product', 'No', 'No', 0, 'Active', NULL, NULL, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '0.00', NULL, '0.00', 0, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL),
(3, 'Producto nuevo  Esligna de LANA', '', '555.00', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, '3', 'se pueden agregar campos...', 'Product', 'No', 'No', 0, 'Active', NULL, NULL, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '0.00', NULL, '0.00', 0, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL),
(4, 'asdasdasd', '', '0.00', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, '4', '', 'Product', 'No', 'No', 0, 'Active', NULL, NULL, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '0.00', NULL, '0.00', 0, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL),
(5, 'hh', '', '88.00', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, '5', '', 'Product', 'No', 'No', 0, 'Active', NULL, NULL, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '0.00', NULL, '0.00', 0, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL),
(6, 'asdasd', '1', '10.00', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, '', '', '', 'No', 'No', 0, 'Active', NULL, NULL, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '0.00', NULL, '0.00', 0, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL),
(7, 'qweqweqweqwe', '', '222222.00', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, '7', 'sdasdasd', 'Product', 'No', 'No', 0, 'Active', NULL, NULL, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '0.00', NULL, '0.00', 0, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL),
(8, 'adasd', '', '222.00', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, '8', 'asdasd', 'Product', 'No', 'No', 0, 'Active', NULL, NULL, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '0.00', NULL, '0.00', 0, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL),
(9, 'qweqwe', '', '12.00', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, '9', 'asdasd', 'Product', 'No', 'No', 0, 'Active', NULL, NULL, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '0.00', NULL, '0.00', 0, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL),
(10, 'qweqweqw', '', '222.00', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, '10', 'asdasd', 'Product', 'No', 'No', 0, 'Active', NULL, NULL, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '0.00', NULL, '0.00', 0, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL),
(11, 'asdasd', '', '6777.00', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, '11', 'asdasd', 'Product', 'No', 'No', 0, 'Active', NULL, NULL, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '0.00', NULL, '0.00', 0, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL),
(12, 'uuuuuuuuuu', '', '6.00', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, '12', 'uuuuuuuuuuuuu6', 'Product', 'No', 'No', 0, 'Active', NULL, NULL, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '0.00', NULL, '0.00', 0, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL),
(13, 'asdasd', '', '2.00', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, '13', 'asdasd', 'Product', 'No', 'No', 0, 'Active', NULL, NULL, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '0.00', NULL, '0.00', 0, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL),
(14, 'qweqweasd', '', '2.00', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, '14', 'asdasd', 'Product', 'No', 'No', 0, 'Active', NULL, NULL, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '0.00', NULL, '0.00', 0, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL),
(15, 'asdasdasdasdasdasdasd', '', '777777.00', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, '15', 'asdasdasdasdasd', 'Product', 'No', 'No', 0, 'Active', NULL, NULL, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '0.00', NULL, '0.00', 0, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL),
(16, '2', '', '0.00', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, '16', '', 'Service', 'No', 'No', 0, 'Active', NULL, NULL, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, '0.00', NULL, '0.00', 0, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_item_cats`
--

CREATE TABLE `sys_item_cats` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `name` varchar(200) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sorder` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_leads`
--

CREATE TABLE `sys_leads` (
  `id` int(11) NOT NULL,
  `fullname` varchar(200) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `source` varchar(200) DEFAULT NULL,
  `added_from` varchar(200) DEFAULT NULL,
  `o` varchar(200) DEFAULT NULL,
  `cid` int(11) NOT NULL DEFAULT 0,
  `aid` int(11) NOT NULL DEFAULT 0,
  `iid` int(11) NOT NULL DEFAULT 0,
  `oid` int(11) NOT NULL DEFAULT 0,
  `rid` int(11) NOT NULL DEFAULT 0,
  `sorder` int(11) NOT NULL DEFAULT 0,
  `assigned` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(200) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(200) DEFAULT NULL,
  `last_contact` datetime DEFAULT NULL,
  `last_contact_by` varchar(200) DEFAULT NULL,
  `date_converted` datetime DEFAULT NULL,
  `public` int(1) NOT NULL DEFAULT 0,
  `ratings` varchar(50) DEFAULT NULL,
  `flag` int(1) NOT NULL DEFAULT 0,
  `lost` int(1) NOT NULL DEFAULT 0,
  `junk` int(1) NOT NULL DEFAULT 0,
  `trash` int(1) NOT NULL DEFAULT 0,
  `archived` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_logs`
--

CREATE TABLE `sys_logs` (
  `id` int(10) NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `userid` int(10) NOT NULL,
  `ip` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_logs`
--

INSERT INTO `sys_logs` (`id`, `date`, `type`, `description`, `userid`, `ip`) VALUES
(126, '2022-05-13 13:14:03', 'Admin', 'Nuevo Contacto añadido Cliente demo [CID: 302]', 1, '::1'),
(127, '2022-05-13 15:26:34', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(125, '2022-05-12 16:11:35', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(124, '2022-05-12 15:51:04', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(123, '2022-05-12 15:50:45', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(122, '2022-05-12 15:50:42', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(121, '2022-05-12 15:50:35', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(120, '2022-05-12 15:50:26', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(119, '2022-05-12 15:50:20', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(118, '2022-05-12 15:34:09', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(117, '2022-05-12 15:33:48', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(116, '2022-05-12 10:54:57', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(14, '2022-04-28 09:12:17', 'Admin', 'Login Successful demo@example.com', 1, '::1'),
(15, '2022-04-28 09:56:16', 'Admin', 'New Deposit: Factura 1 Pago [TrID: 1 | Amount: 5002]', 1, '::1'),
(16, '2022-04-28 10:00:18', 'Admin', 'New Expense: asd [TrID: 2 | Amount: 0]', 1, '::1'),
(17, '2022-04-28 10:19:59', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(18, '2022-04-28 10:40:50', 'Admin', 'Autenticado con éxito facundohernandez@outlook.com', 4, '::1'),
(19, '2022-04-28 14:34:54', 'Admin', 'Nuevo Contacto añadido Facundo Hernández [CID: 3]', 4, '::1'),
(20, '2022-04-28 14:40:47', 'Admin', 'New Deposit: Pedido 4 Pago [TrID: 5 | Amount: 5527.21]', 4, '::1'),
(21, '2022-04-28 14:44:49', 'Admin', 'Autenticado con éxito facundohernandez@outlook.com', 4, '::1'),
(22, '2022-04-28 14:47:07', 'Admin', 'Autenticado con éxito facundohernandez@outlook.com', 4, '::1'),
(23, '2022-04-28 15:19:48', 'Admin', 'Autenticado con éxito facundohernandez@outlook.com', 4, '::1'),
(24, '2022-04-28 15:20:01', 'Admin', 'Autenticado con éxito facundohernandez@outlook.com', 4, '::1'),
(25, '2022-04-28 15:26:35', 'Admin', 'Autenticación fallida facundohernandez@outlook.com', 0, '::1'),
(26, '2022-04-28 15:26:42', 'Admin', 'Autenticado con éxito facundohernandez@outlook.com', 4, '::1'),
(27, '2022-04-28 15:30:06', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(28, '2022-04-28 15:31:33', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(29, '2022-04-28 15:31:55', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(30, '2022-04-28 15:33:23', 'Admin', 'Autenticado con éxito facundohernandez@outlook.com', 4, '::1'),
(31, '2022-04-28 15:34:01', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(32, '2022-04-28 15:35:17', 'Admin', 'New Deposit: Pedido 5 Pago [TrID: 6 | Amount: 12322222]', 5, '::1'),
(33, '2022-04-28 15:47:31', 'Admin', 'New Deposit: test [TrID: 7 | Amount: 77000]', 5, '::1'),
(34, '2022-04-28 15:48:06', 'Admin', 'New Deposit: Pedido 4 Pago [TrID: 8 | Amount: 9990]', 5, '::1'),
(35, '2022-04-28 16:17:48', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(36, '2022-04-28 16:18:07', 'Admin', 'Autenticación fallida demo@example.com', 0, '::1'),
(37, '2022-04-28 16:18:14', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(38, '2022-04-28 16:27:56', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(39, '2022-04-28 16:40:00', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(40, '2022-04-29 10:32:19', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(41, '2022-04-29 12:57:21', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(42, '2022-04-29 12:58:18', 'Admin', 'Nuevo Contacto añadido Facundito [CID: 4]', 5, '::1'),
(43, '2022-04-29 13:07:40', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(44, '2022-04-29 16:24:15', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(45, '2022-04-29 16:29:16', 'Admin', 'New Deposit: Pedido 11 Pago [TrID: 9 | Amount: 6052]', 1, '::1'),
(46, '2022-04-29 16:31:18', 'Admin', 'New Deposit: Pedido 7 Pago [TrID: 10 | Amount: 377712.25]', 1, '::1'),
(47, '2022-04-29 16:32:52', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(48, '2022-04-29 17:44:28', 'Admin', 'Nuevo Contacto añadido test [CID: 5]', 5, '::1'),
(49, '2022-04-29 18:05:14', 'Admin', 'Nuevo Contacto añadido Matias [CID: 6]', 5, '::1'),
(50, '2022-04-29 18:15:25', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(51, '2022-04-29 18:17:25', 'Admin', 'New Deposit: Pedido 12 Pago [TrID: 11 | Amount: 2]', 1, '::1'),
(52, '2022-04-30 12:58:07', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(53, '2022-04-30 12:58:27', 'Admin', 'Autenticación fallida demo@example.com', 0, '::1'),
(54, '2022-04-30 12:58:40', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(55, '2022-04-30 13:02:11', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(56, '2022-04-30 13:11:16', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(57, '2022-04-30 13:26:23', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(58, '2022-05-02 10:41:17', 'Admin', 'New Deposit: 6 Pago [TrID: 12 | Amount: 95136]', 5, '::1'),
(59, '2022-05-02 11:57:44', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(60, '2022-05-02 13:55:46', 'Admin', 'New Deposit: 8 Pago [TrID: 13 | Amount: 23667.6]', 5, '::1'),
(61, '2022-05-02 14:47:50', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(62, '2022-05-02 14:58:12', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(63, '2022-05-02 15:09:40', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(64, '2022-05-02 17:04:11', 'Admin', 'Nuevo Contacto añadido Pedro [CID: 7]', 1, '::1'),
(65, '2022-05-02 17:17:18', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(66, '2022-05-02 17:17:24', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(67, '2022-05-02 17:17:34', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(68, '2022-05-02 17:18:28', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(69, '2022-05-02 17:19:12', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(70, '2022-05-02 17:19:17', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(71, '2022-05-02 17:20:11', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(72, '2022-05-02 17:23:35', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(73, '2022-05-03 09:38:02', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(74, '2022-05-03 09:48:53', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(75, '2022-05-03 11:01:30', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(76, '2022-05-03 13:03:48', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(77, '2022-05-04 15:48:41', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(78, '2022-05-05 10:50:43', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(79, '2022-05-05 11:04:00', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(80, '2022-05-05 11:10:47', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(81, '2022-05-05 11:12:37', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(82, '2022-05-05 12:03:02', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(83, '2022-05-05 12:07:46', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(84, '2022-05-05 12:09:07', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(85, '2022-05-05 12:13:15', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(86, '2022-05-05 12:14:20', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(87, '2022-05-06 07:29:49', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(88, '2022-05-06 10:12:35', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(89, '2022-05-06 11:10:32', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(90, '2022-05-06 12:18:32', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(91, '2022-05-06 14:28:01', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(92, '2022-05-06 14:28:36', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(93, '2022-05-06 14:30:37', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(94, '2022-05-07 10:56:12', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(95, '2022-05-07 11:07:22', 'Admin', 'Nuevo Contacto añadido CBU BBVA [CID: 299]', 5, '::1'),
(96, '2022-05-07 11:38:13', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(97, '2022-05-09 09:25:21', 'Admin', 'Nuevo Contacto añadido CBU BBVA [CID: 300]', 5, '::1'),
(98, '2022-05-09 12:26:19', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(99, '2022-05-09 13:15:58', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(100, '2022-05-09 13:16:22', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(101, '2022-05-09 13:17:08', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(102, '2022-05-09 13:17:16', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(103, '2022-05-09 13:20:36', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(104, '2022-05-09 13:31:42', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(105, '2022-05-09 13:32:30', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(106, '2022-05-09 13:50:57', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(107, '2022-05-09 13:51:39', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(108, '2022-05-09 14:25:27', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(109, '2022-05-09 14:26:24', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(110, '2022-05-09 14:26:58', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(111, '2022-05-10 16:50:22', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(112, '2022-05-11 17:12:26', 'Admin', 'Product Deleted: asdasdasdasdasdasdasd [ID: 260]', 5, '::1'),
(113, '2022-05-11 17:25:25', 'Admin', 'Contact Deleted: Facundo Hernández', 5, '::1'),
(114, '2022-05-11 17:26:58', 'Admin', 'Nuevo Contacto añadido Facundito [CID: 301]', 5, '::1'),
(115, '2022-05-12 08:15:00', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(128, '2022-05-14 10:18:09', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(129, '2022-05-14 10:18:50', 'Admin', 'Autenticado con éxito demo@example.com', 1, '192.168.1.6'),
(130, '2022-05-14 10:19:56', 'Admin', 'Autenticación fallida Test@test.com', 0, '192.168.1.8'),
(131, '2022-05-14 10:20:11', 'Admin', 'Autenticado con éxito test@test.com', 5, '192.168.1.8'),
(132, '2022-05-14 10:46:22', 'Admin', 'Autenticado con éxito demo@example.com', 1, '192.168.1.6'),
(133, '2022-05-14 10:54:38', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(134, '2022-05-14 17:31:43', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(135, '2022-05-16 13:43:23', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(136, '2022-05-16 15:33:37', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(137, '2022-05-16 15:38:44', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(138, '2022-05-16 15:42:03', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(139, '2022-05-16 15:42:40', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(140, '2022-05-16 15:48:34', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(141, '2022-05-16 16:01:42', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(142, '2022-05-16 16:05:46', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(143, '2022-05-16 16:07:20', 'Admin', 'Product Deleted: adasd [ID: 8]', 1, '::1'),
(144, '2022-05-16 16:07:28', 'Admin', 'Product Deleted: asdasd [ID: 11]', 1, '::1'),
(145, '2022-05-16 16:56:50', 'Admin', 'Nuevo Contacto añadido test [CID: 303]', 1, '::1'),
(146, '2022-05-16 18:28:05', 'Admin', 'Nuevo Contacto añadido Alberto Fernandez [CID: 304]', 1, '::1'),
(147, '2028-05-16 18:53:16', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(148, '2028-05-16 19:17:44', 'Admin', 'Nuevo Contacto añadido Sixtino Pindonga [CID: 305]', 1, '::1'),
(149, '2022-05-17 07:51:37', 'Admin', 'Nuevo Contacto añadido Facunditos [CID: 306]', 1, '::1'),
(150, '2022-05-17 07:56:02', 'Admin', 'Nuevo Contacto añadido test3 [CID: 307]', 1, '::1'),
(151, '2022-05-18 14:36:45', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(152, '2022-05-18 14:49:06', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(153, '2022-05-19 12:33:57', 'Admin', 'Nuevo Contacto añadido Fernando Robin [CID: 308]', 1, '::1'),
(154, '2022-05-19 15:05:45', 'Admin', 'Nuevo Contacto añadido Nombre de la Cuenta demo [CID: 309]', 1, '::1'),
(155, '2022-05-19 15:10:02', 'Admin', 'Nuevo Contacto añadido Diego Roque [CID: 310]', 1, '::1'),
(156, '2022-05-19 15:11:44', 'Admin', 'Nuevo Contacto añadido Facundito3 [CID: 311]', 1, '::1'),
(157, '2022-05-19 15:15:29', 'Admin', 'Nuevo Contacto añadido Nombre de la Cuenta [CID: 312]', 1, '::1'),
(158, '2022-05-19 15:41:32', 'Admin', 'Nuevo Contacto añadido asdasdasd [CID: 313]', 1, '::1'),
(159, '2022-05-19 15:45:25', 'Admin', 'Nuevo Contacto añadido Nuevo contacto test [CID: 314]', 1, '::1'),
(160, '2022-05-19 15:48:06', 'Admin', 'Nuevo Contacto añadido Demo nuevo [CID: 315]', 1, '::1'),
(161, '2022-05-19 15:49:25', 'Admin', 'Nuevo Contacto añadido demostracino [CID: 316]', 1, '::1'),
(162, '2022-05-19 15:53:49', 'Admin', 'Nuevo Contacto añadido Facundito5 [CID: 317]', 1, '::1'),
(163, '2022-05-19 15:54:47', 'Admin', 'Nuevo Contacto añadido Nombre de la Cuenta asd [CID: 318]', 1, '::1'),
(164, '2022-05-19 16:34:09', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(165, '2022-05-19 16:51:59', 'Admin', 'Nuevo Contacto añadido Ricardo Ruben [CID: 319]', 1, '::1'),
(166, '2022-05-19 16:53:43', 'Admin', 'Nuevo Contacto añadido Gaston Roccete [CID: 320]', 1, '::1'),
(167, '2022-05-19 16:55:43', 'Admin', 'Nuevo Contacto añadido Ruperto Planes [CID: 321]', 1, '::1'),
(168, '2022-05-19 17:08:09', 'Admin', 'Nuevo Contacto añadido Rene Acosta [CID: 322]', 1, '::1'),
(169, '2022-05-19 18:00:25', 'Admin', 'Nuevo Contacto añadido 1234 [CID: 323]', 1, '::1'),
(170, '2022-05-19 18:01:04', 'Admin', 'Nuevo Contacto añadido 345 [CID: 324]', 1, '::1'),
(171, '2022-05-19 18:09:31', 'Admin', 'Nuevo Contacto añadido Abel Sampaoli [CID: 325]', 1, '::1'),
(172, '2022-05-19 18:15:42', 'Admin', 'Nuevo Contacto añadido Facundito5 [CID: 326]', 1, '::1'),
(173, '2022-05-19 18:18:38', 'Admin', 'Nuevo Contacto añadido qqqqqqqqqq [CID: 327]', 1, '::1'),
(174, '2022-05-19 18:19:39', 'Admin', 'Nuevo Contacto añadido q [CID: 328]', 1, '::1'),
(175, '2022-05-19 18:24:05', 'Admin', 'Nuevo Contacto añadido hg [CID: 329]', 1, '::1'),
(176, '2022-05-19 18:27:11', 'Admin', 'Nuevo Contacto añadido 123123123123123 [CID: 330]', 1, '::1'),
(177, '2022-05-19 19:03:29', 'Admin', 'Nuevo Contacto añadido Contacto añadido desde pedido y empresa [CID: 331]', 1, '::1'),
(178, '2022-05-19 20:35:35', 'Admin', 'Nuevo Contacto añadido FERNANDO PERRI [CID: 332]', 1, '::1'),
(179, '2022-05-23 15:57:03', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(180, '2022-05-23 18:17:17', 'Admin', 'Nuevo Contacto añadido Hernan Roul [CID: 333]', 1, '::1'),
(181, '2022-05-23 18:22:04', 'Admin', 'Nuevo Contacto añadido Mauricio Macri [CID: 334]', 1, '::1'),
(182, '2022-05-23 18:28:26', 'Admin', 'Nuevo Contacto añadido Facundito [CID: 335]', 1, '::1'),
(183, '2022-05-23 18:29:19', 'Admin', 'Nuevo Contacto añadido Sandro Cohelo [CID: 336]', 1, '::1'),
(184, '2022-05-23 18:30:06', 'Admin', 'Nuevo Contacto añadido Carlo Boso [CID: 337]', 1, '::1'),
(185, '2022-05-23 18:38:13', 'Admin', 'Nuevo Contacto añadido Pelado cabeza de stanley [CID: 338]', 1, '::1'),
(186, '2022-05-23 18:41:18', 'Admin', 'Nuevo Contacto añadido Dario Robin [CID: 339]', 1, '::1'),
(187, '2022-05-23 18:45:56', 'Admin', 'Nuevo Contacto añadido Pelado con trenzas [CID: 340]', 1, '::1'),
(188, '2022-05-23 18:46:39', 'Admin', 'Nuevo Contacto añadido otro pelado [CID: 341]', 1, '::1'),
(189, '2022-05-23 18:51:06', 'Admin', 'Nuevo Contacto añadido Cabeza de rodilla [CID: 342]', 1, '::1'),
(190, '2022-05-24 12:58:58', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(191, '2022-05-24 13:21:07', 'Admin', 'Nuevo Contacto añadido Jacinto Gomez [CID: 343]', 1, '::1'),
(192, '2022-05-24 13:32:43', 'Admin', 'Nuevo Contacto añadido Facundito [CID: 344]', 1, '::1'),
(193, '2022-05-24 14:21:43', 'Admin', 'Nuevo Contacto añadido Saul Goodman [CID: 345]', 1, '::1'),
(194, '2022-05-24 14:53:11', 'Admin', 'Nuevo Contacto añadido Benjamin Valdez [CID: 346]', 1, '::1'),
(195, '2022-05-24 15:13:53', 'Admin', 'Nuevo Contacto añadido Teresa Suarez [CID: 347]', 1, '::1'),
(196, '2022-05-24 15:17:34', 'Admin', 'Nuevo Contacto añadido Jose Maria Gomez [CID: 348]', 1, '::1'),
(197, '2022-05-24 15:20:50', 'Admin', 'Nuevo Contacto añadido Norberto Robles [CID: 349]', 1, '::1'),
(198, '2022-05-24 15:23:30', 'Admin', 'Nuevo Contacto añadido Daniel Alejo [CID: 350]', 1, '::1'),
(199, '2022-05-24 15:33:12', 'Admin', 'Nuevo Contacto añadido Pedro Arnaldo [CID: 351]', 1, '::1'),
(200, '2022-05-26 11:26:49', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(201, '2022-05-26 11:27:21', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(202, '2022-05-26 11:30:08', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(203, '2022-05-26 11:41:58', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(204, '2022-05-26 11:47:59', 'Admin', 'Product Deleted: asdasdasdasdasdasdasd [ID: 256]', 1, '::1'),
(205, '2022-05-26 11:48:08', 'Admin', 'Product Deleted: test1 [ID: 2]', 1, '::1'),
(206, '2022-05-26 11:48:28', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(207, '2022-05-26 11:48:52', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(208, '2022-05-26 11:54:13', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(209, '2022-05-26 11:54:37', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(210, '2022-05-26 12:14:18', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(211, '2022-05-26 12:45:41', 'Admin', 'Product Deleted: 1234 [ID: 259]', 1, '::1'),
(212, '2022-05-26 12:45:45', 'Admin', 'Product Deleted: asdasdasdasdasdasdasd [ID: 258]', 1, '::1'),
(213, '2022-05-26 12:45:53', 'Admin', 'Product Deleted: asdasdasdasdasdasdasd [ID: 262]', 1, '::1'),
(214, '2022-05-26 13:24:47', 'Admin', 'Product Deleted: 123 [ID: 263]', 1, '::1'),
(215, '2022-05-26 14:48:40', 'Admin', 'Product Deleted: Producto nuevo  Esligna de LANA [ID: 3]', 1, '::1'),
(216, '2022-05-26 16:32:02', 'Admin', 'Product Deleted: asdasdasdasdasdasdasd [ID: 267]', 1, '::1'),
(217, '2022-05-26 16:32:07', 'Admin', 'Product Deleted: 1 [ID: 264]', 1, '::1'),
(218, '2022-05-26 16:32:10', 'Admin', 'Product Deleted: asdasdasdasdasdasdasd [ID: 268]', 1, '::1'),
(219, '2022-05-26 16:32:12', 'Admin', 'Product Deleted: asdasdasdasdasdasdasd [ID: 269]', 1, '::1'),
(220, '2022-05-26 19:26:40', 'Admin', 'Nuevo Contacto añadido renato [CID: 352]', 1, '::1'),
(221, '2022-05-26 19:32:47', 'Admin', 'Product Deleted: 2 [ID: 261]', 1, '::1'),
(222, '2022-05-26 20:28:29', 'Admin', 'Product Deleted: 1 [ID: 3]', 1, '::1'),
(223, '2022-05-27 10:15:22', 'Admin', 'Product Deleted: 1 [ID: 4]', 1, '::1'),
(224, '2022-05-27 10:15:25', 'Admin', 'Product Deleted: 1 [ID: 5]', 1, '::1'),
(225, '2022-05-27 10:15:29', 'Admin', 'Product Deleted: 1 [ID: 6]', 1, '::1'),
(226, '2022-05-27 10:15:32', 'Admin', 'Product Deleted: 1 [ID: 7]', 1, '::1'),
(227, '2022-05-27 10:15:35', 'Admin', 'Product Deleted: 1 [ID: 8]', 1, '::1'),
(228, '2022-05-27 10:58:36', 'Admin', 'Nuevo Contacto añadido Facundo Hernández [CID: 1]', 1, '::1'),
(229, '2022-05-27 13:24:27', 'Admin', 'Nuevo Contacto añadido Abel [CID: 2]', 1, '::1'),
(230, '2022-05-27 13:39:06', 'Admin', 'Nuevo Contacto añadido Facundito [CID: 3]', 1, '::1'),
(231, '2022-05-27 13:42:05', 'Admin', 'Nuevo Contacto añadido Raul Portal [CID: 4]', 1, '::1'),
(232, '2022-05-27 13:42:24', 'Admin', 'Nuevo Contacto añadido test [CID: 5]', 1, '::1'),
(233, '2022-05-27 13:43:10', 'Admin', 'Nuevo Contacto añadido Facundito [CID: 6]', 1, '::1'),
(234, '2022-05-27 13:49:03', 'Admin', 'Nuevo Contacto añadido asd [CID: 7]', 1, '::1'),
(235, '2022-05-27 13:49:16', 'Admin', 'Nuevo Contacto añadido test33 [CID: 8]', 1, '::1'),
(236, '2022-05-27 14:09:27', 'Admin', 'Nuevo Contacto añadido Facundito [CID: 9]', 1, '::1'),
(237, '2022-05-27 14:22:43', 'Admin', 'Nuevo Contacto añadido CBU BBVA [CID: 10]', 1, '::1'),
(238, '2022-05-27 14:27:47', 'Admin', 'Nuevo Contacto añadido Fernando Ferreyra [CID: 11]', 1, '::1'),
(239, '2022-05-27 15:34:56', 'Admin', 'Nuevo Contacto añadido FAC [CID: 12]', 1, '::1'),
(240, '2022-05-27 15:48:50', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(241, '2022-05-27 15:53:56', 'Admin', 'Nuevo Contacto añadido Q [CID: 13]', 1, '::1'),
(242, '2022-05-27 15:55:04', 'Admin', 'Nuevo Contacto añadido RENE [CID: 14]', 1, '::1'),
(243, '2022-05-27 15:56:19', 'Admin', 'Nuevo Contacto añadido darop prso [CID: 15]', 1, '::1'),
(244, '2022-05-27 16:01:04', 'Admin', 'Nuevo Contacto añadido Facundito [CID: 16]', 1, '::1'),
(245, '2022-05-27 16:01:29', 'Admin', 'Nuevo Contacto añadido Aristoteles [CID: 17]', 1, '::1'),
(246, '2022-05-27 16:02:09', 'Admin', 'Nuevo Contacto añadido aaaaaaaaaaaa [CID: 18]', 1, '::1'),
(247, '2022-05-27 16:03:36', 'Admin', 'Nuevo Contacto añadido Oscar Arr [CID: 19]', 1, '::1'),
(248, '2022-05-27 16:04:36', 'Admin', 'Nuevo Contacto añadido asdasd [CID: 20]', 1, '::1'),
(249, '2022-05-27 16:04:42', 'Admin', 'Nuevo Contacto añadido asdasd [CID: 21]', 1, '::1'),
(250, '2022-05-27 16:05:46', 'Admin', 'Nuevo Contacto añadido demo [CID: 22]', 1, '::1'),
(251, '2022-05-27 16:06:39', 'Admin', 'Nuevo Contacto añadido  [CID: 23]', 1, '::1'),
(252, '2022-05-27 16:08:45', 'Admin', 'Nuevo Contacto añadido asd [CID: 24]', 1, '::1'),
(253, '2022-05-27 16:09:47', 'Admin', 'Nuevo Contacto añadido asdasd [CID: 25]', 1, '::1'),
(254, '2022-05-27 16:10:08', 'Admin', 'Nuevo Contacto añadido qqq [CID: 26]', 1, '::1'),
(255, '2022-05-27 16:12:07', 'Admin', 'Nuevo Contacto añadido mnmn [CID: 27]', 1, '::1'),
(256, '2022-05-27 16:12:53', 'Admin', 'Nuevo Contacto añadido demodemo [CID: 28]', 1, '::1'),
(257, '2022-05-27 16:14:01', 'Admin', 'Nuevo Contacto añadido mmmm [CID: 29]', 1, '::1'),
(258, '2022-05-27 16:14:47', 'Admin', 'Nuevo Contacto añadido Pepo [CID: 30]', 1, '::1'),
(259, '2022-05-27 16:17:29', 'Admin', 'Nuevo Contacto añadido Omar o [CID: 31]', 1, '::1'),
(260, '2022-05-27 16:17:50', 'Admin', 'Nuevo Contacto añadido qwe [CID: 32]', 1, '::1'),
(261, '2022-05-27 16:18:47', 'Admin', 'Nuevo Contacto añadido Saturdino S [CID: 33]', 1, '::1'),
(262, '2022-05-27 16:20:50', 'Admin', 'Nuevo Contacto añadido kkkkkkkkk [CID: 34]', 1, '::1'),
(263, '2022-05-27 16:23:51', 'Admin', 'Nuevo Contacto añadido Platon [CID: 35]', 1, '::1'),
(264, '2022-05-27 16:23:55', 'Admin', 'Nuevo Contacto añadido Platon [CID: 36]', 1, '::1'),
(265, '2022-05-27 16:25:47', 'Admin', 'Nuevo Contacto añadido nbnbnbn [CID: 37]', 1, '::1'),
(266, '2022-05-27 16:27:02', 'Admin', 'Nuevo Contacto añadido qwqwqw [CID: 38]', 1, '::1'),
(267, '2022-05-27 16:28:14', 'Admin', 'Nuevo Contacto añadido ui [CID: 39]', 1, '::1'),
(268, '2022-05-27 16:33:05', 'Admin', 'Nuevo Contacto añadido Facundo [CID: 40]', 1, '::1'),
(269, '2022-05-27 16:35:02', 'Admin', 'Nuevo Contacto añadido Ricardones [CID: 41]', 1, '::1'),
(270, '2022-05-27 17:18:36', 'Admin', 'Nuevo Contacto añadido Contacto lanzamiento [CID: 42]', 1, '::1'),
(271, '2022-05-27 17:40:50', 'Admin', 'Nuevo Contacto añadido ASD [CID: 43]', 1, '::1'),
(272, '2022-05-27 18:25:55', 'Admin', 'Nuevo Contacto añadido asdasd [CID: 44]', 1, '::1'),
(273, '2022-05-27 18:26:22', 'Admin', 'Nuevo Contacto añadido qw12 [CID: 45]', 1, '::1'),
(274, '2022-05-27 18:28:43', 'Admin', 'Nuevo Contacto añadido 222 [CID: 46]', 1, '::1'),
(275, '2022-05-28 16:22:44', 'Admin', 'Nuevo Contacto añadido Facundito [CID: 47]', 1, '::1'),
(276, '2022-05-28 16:25:41', 'Admin', 'Nuevo Contacto añadido Carlos Marea [CID: 48]', 1, '::1'),
(277, '2022-05-28 16:27:45', 'Admin', 'Nuevo Contacto añadido Orlando Olia [CID: 49]', 1, '::1'),
(278, '2022-05-28 16:31:28', 'Admin', 'Nuevo Contacto añadido Ramon Mole [CID: 50]', 1, '::1'),
(279, '2022-05-28 16:32:56', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(280, '2022-05-29 09:45:08', 'Admin', 'Autenticado con éxito demo@example.com', 1, '::1'),
(281, '2022-05-29 19:58:00', 'Admin', 'Product Deleted: Eslinga de fibra [ID: 1]', 1, '::1'),
(282, '2022-05-30 11:26:57', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(283, '2022-05-30 17:11:49', 'Admin', 'Contact Deleted: 222', 5, '::1'),
(284, '2022-05-30 17:11:57', 'Admin', 'Contact Deleted: asd', 5, '::1'),
(285, '2022-05-30 17:12:04', 'Admin', 'Contact Deleted: asdasd', 5, '::1'),
(286, '2022-05-30 17:12:10', 'Admin', 'Contact Deleted: asd', 5, '::1'),
(287, '2022-05-30 20:38:47', 'Admin', 'Nuevo Contacto añadido Ernesto Maria [CID: 51]', 5, '::1'),
(288, '2022-05-30 20:46:52', 'Admin', 'Nuevo Contacto añadido Matias Cettour [CID: 1]', 5, '::1'),
(289, '2022-06-01 18:40:06', 'Admin', 'Autenticado con éxito test@test.com', 5, '::1'),
(290, '2022-06-02 11:14:31', 'Admin', 'Nuevo Contacto añadido Contacto Cliente nuevo [CID: 2]', 5, '::1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_orders`
--

CREATE TABLE `sys_orders` (
  `id` int(11) NOT NULL,
  `ordernum` varchar(50) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `sales_person` varchar(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `cname` varchar(100) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `contract_id` int(11) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `date_expiry` date DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `stitle` varchar(200) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `iid` int(11) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `recurring` decimal(16,2) NOT NULL DEFAULT 0.00,
  `setup_fee` decimal(16,2) NOT NULL DEFAULT 0.00,
  `billing_cycle` text DEFAULT NULL,
  `addon_ids` text DEFAULT NULL,
  `related_orders` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `upgrade_ids` text DEFAULT NULL,
  `xdata` text DEFAULT NULL,
  `xsecret` varchar(100) DEFAULT NULL,
  `promo_code` text DEFAULT NULL,
  `promo_type` text DEFAULT NULL,
  `promo_value` text DEFAULT NULL,
  `payment_method` text DEFAULT NULL,
  `ipaddress` text DEFAULT NULL,
  `fraud_module` text DEFAULT NULL,
  `fraud_output` text DEFAULT NULL,
  `activation_subject` text DEFAULT NULL,
  `activation_message` text DEFAULT NULL,
  `trash` int(1) NOT NULL DEFAULT 0,
  `archived` int(1) NOT NULL DEFAULT 0,
  `c1` text DEFAULT NULL,
  `c2` text DEFAULT NULL,
  `c3` text DEFAULT NULL,
  `c4` text DEFAULT NULL,
  `c5` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_orders`
--

INSERT INTO `sys_orders` (`id`, `ordernum`, `source`, `status`, `sales_person`, `branch_name`, `cname`, `cid`, `contract_id`, `bid`, `date_added`, `date_expiry`, `pid`, `stitle`, `sid`, `iid`, `aid`, `amount`, `recurring`, `setup_fee`, `billing_cycle`, `addon_ids`, `related_orders`, `description`, `upgrade_ids`, `xdata`, `xsecret`, `promo_code`, `promo_type`, `promo_value`, `payment_method`, `ipaddress`, `fraud_module`, `fraud_output`, `activation_subject`, `activation_message`, `trash`, `archived`, `c1`, `c2`, `c3`, `c4`, `c5`) VALUES
(1, '9416523871', NULL, 'Active', NULL, NULL, 'test 2', 2, NULL, NULL, '2022-04-28', NULL, 1, 'Eslinga de fibra sintetica 2ton', NULL, 0, NULL, '5000.00', '0.00', '0.00', 'One Time', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TEST', 'TEST', 0, 0, NULL, NULL, NULL, NULL, NULL),
(2, '4286058510', NULL, 'Pending', NULL, NULL, 'Matias', 6, NULL, NULL, '2022-04-29', NULL, 2, 'test', NULL, 12, NULL, '2.00', '0.00', '0.00', 'One Time', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pedido', '<p><strong>teasdasd</strong></p>\n<p><strong>asdasdasdasdasdasdasdasd</strong></p>', 0, 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_permissions`
--

CREATE TABLE `sys_permissions` (
  `id` int(11) NOT NULL,
  `pname` varchar(200) DEFAULT NULL,
  `shortname` varchar(200) DEFAULT NULL,
  `available` int(1) NOT NULL DEFAULT 0,
  `core` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_permissions`
--

INSERT INTO `sys_permissions` (`id`, `pname`, `shortname`, `available`, `core`) VALUES
(1, 'Customers', 'customers', 0, 1),
(2, 'Companies', 'companies', 0, 1),
(3, 'Transactions', 'transactions', 0, 1),
(4, 'Sales', 'sales', 0, 1),
(5, 'Bank & Cash', 'bank_n_cash', 0, 1),
(6, 'Products & Services', 'products_n_services', 0, 1),
(7, 'Reports', 'reports', 0, 1),
(8, 'Utilities', 'utilities', 0, 1),
(9, 'Appearance', 'appearance', 0, 1),
(10, 'Plugins', 'plugins', 0, 1),
(11, 'Calendar', 'calendar', 0, 1),
(12, 'Leads', 'leads', 0, 1),
(13, 'Tasks', 'tasks', 0, 1),
(14, 'Contracts', 'contracts', 0, 1),
(15, 'Orders', 'orders', 0, 1),
(16, 'Settings', 'settings', 0, 1),
(17, 'Documents', 'documents', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_pg`
--

CREATE TABLE `sys_pg` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `settings` text NOT NULL,
  `value` text NOT NULL,
  `processor` text NOT NULL,
  `ins` text NOT NULL,
  `c1` text NOT NULL,
  `c2` text NOT NULL,
  `c3` text NOT NULL,
  `c4` text NOT NULL,
  `c5` text NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `sorder` int(2) NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `mode` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_pg`
--

INSERT INTO `sys_pg` (`id`, `name`, `settings`, `value`, `processor`, `ins`, `c1`, `c2`, `c3`, `c4`, `c5`, `status`, `sorder`, `logo`, `mode`) VALUES
(1, 'Paypal', 'Paypal Email', 'demo@example.com', 'paypal', 'Invoices', 'USD', '1', '', '', '', 'Inactive', 1, NULL, ''),
(2, 'Stripe', 'API Key', 'sk_test_ARblMczqDw61NusMMs7o1RVK', 'stripe', '', 'USD', '', '', '', '', 'Inactive', 3, NULL, ''),
(3, 'Datos para transferencia bancaria', 'Instructions', 'Make a Payment to Our Bank Account <br />Bank Name: City Bank <br />Account Name: Sadia Sharmin <br />Account Number: 1505XXXXXXXX <br />', 'manualpayment', '', '', '', '', '', '', 'Active', 2, NULL, ''),
(4, 'Authorize.net', 'API_LOGIN_ID', 'Insert API Login ID here', 'authorize_net', '', 'Insert Transaction Key Here', '', '', '', '', 'Inactive', 4, NULL, ''),
(5, 'Braintree', 'Merchant ID', 'your merchant id', 'braintree', '', 'your public key', 'your private key', 'bank account', 'sandbox', '', 'Inactive', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_pl`
--

CREATE TABLE `sys_pl` (
  `id` int(11) NOT NULL,
  `c` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `sorder` int(11) NOT NULL DEFAULT 0,
  `build` int(10) DEFAULT 1,
  `c1` text DEFAULT NULL,
  `c2` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_pmethods`
--

CREATE TABLE `sys_pmethods` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sorder` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_pmethods`
--

INSERT INTO `sys_pmethods` (`id`, `name`, `sorder`) VALUES
(1, 'Efectivo', 1),
(2, 'Cheque', 4),
(3, 'Tarjeta de crédito', 5),
(4, 'Debito', 6),
(5, 'Transferencia bancaria', 7),
(9, 'e-cheq', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_quoteitems`
--

CREATE TABLE `sys_quoteitems` (
  `id` int(10) NOT NULL,
  `qid` int(10) NOT NULL,
  `itemcode` text NOT NULL,
  `description` text NOT NULL,
  `qty` text NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `taxable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_quoteitems`
--

INSERT INTO `sys_quoteitems` (`id`, `qid`, `itemcode`, `description`, `qty`, `amount`, `discount`, `total`, `taxable`) VALUES
(15, 10004, '', 'Item ingresado manualc con imp individual', '1', '2.00', '0.00', '2.00', 1),
(16, 10004, '', ' Eslinga de fibra sintética ', '1', '22.00', '0.00', '22.00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_quotes`
--

CREATE TABLE `sys_quotes` (
  `id` int(10) NOT NULL,
  `subject` text NOT NULL,
  `stage` enum('Draft','Delivered','On Hold','Accepted','Lost','Dead') NOT NULL,
  `validuntil` date NOT NULL,
  `userid` int(10) NOT NULL,
  `invoicenum` text NOT NULL,
  `cn` text NOT NULL,
  `account` text NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `companyname` text NOT NULL,
  `email` text NOT NULL,
  `address1` text NOT NULL,
  `address2` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `postcode` text NOT NULL,
  `country` text NOT NULL,
  `phonenumber` text NOT NULL,
  `currency` int(10) NOT NULL,
  `subtotal` decimal(18,2) NOT NULL,
  `discount_type` text NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `taxname` text NOT NULL,
  `taxrate` decimal(10,2) NOT NULL,
  `tax1` decimal(10,2) NOT NULL,
  `tax2` decimal(10,2) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `proposal` text NOT NULL,
  `customernotes` text NOT NULL,
  `adminnotes` text NOT NULL,
  `datecreated` date NOT NULL,
  `lastmodified` date NOT NULL,
  `datesent` date NOT NULL,
  `dateaccepted` date NOT NULL,
  `vtoken` text NOT NULL,
  `currency_symbol` varchar(10) DEFAULT NULL,
  `currency_prefix` varchar(10) DEFAULT NULL,
  `currency_sufix` varchar(10) DEFAULT NULL,
  `currency_rate` decimal(11,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_quotes`
--

INSERT INTO `sys_quotes` (`id`, `subject`, `stage`, `validuntil`, `userid`, `invoicenum`, `cn`, `account`, `firstname`, `lastname`, `companyname`, `email`, `address1`, `address2`, `city`, `state`, `postcode`, `country`, `phonenumber`, `currency`, `subtotal`, `discount_type`, `discount_value`, `discount`, `taxname`, `taxrate`, `tax1`, `tax2`, `total`, `proposal`, `customernotes`, `adminnotes`, `datecreated`, `lastmodified`, `datesent`, `dateaccepted`, `vtoken`, `currency_symbol`, `currency_prefix`, `currency_sufix`, `currency_rate`) VALUES
(10004, 'Asunto de la cotizacion', 'Delivered', '2022-07-02', 1, '', '', 'Matias Cettour', '', '', '', '', '', '', '', '', '', '', '', 1, '24.00', 'p', '0.00', '0.00', 'IVA 10,5', '10.50', '0.21', '0.00', '24.21', '<p>Texto encabezado-Texto encabezado-Texto encabezado<span class=\"redactor-invisible-space\">Texto encabezado<span class=\"redactor-invisible-space\">Texto encabezado<span class=\"redactor-invisible-space\">-Texto encabezado<span class=\"redactor-invisible-space\">-Texto encabezado<span class=\"redactor-invisible-space\"></span></span></span></span></span></p>', '<p>texto pie - texto pie - texto pie - <span class=\"redactor-invisible-space\">texto pie - <span class=\"redactor-invisible-space\">texto pie - <span class=\"redactor-invisible-space\">texto pie - <span class=\"redactor-invisible-space\">texto pie - <span class=\"redactor-invisible-space\">texto pie - <span class=\"redactor-invisible-space\">texto pie - <span class=\"redactor-invisible-space\"></span></span></span></span></span></span></span></p>', '', '2022-06-02', '2022-06-02', '2022-06-02', '2022-06-02', '5191766014', '$', NULL, NULL, '1.0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_recibos`
--

CREATE TABLE `sys_recibos` (
  `id` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `account` varchar(200) NOT NULL,
  `cn` varchar(100) NOT NULL DEFAULT '',
  `invoicenum` text NOT NULL,
  `date` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `datepaid` datetime DEFAULT NULL,
  `subtotal` decimal(18,2) NOT NULL,
  `discount_type` varchar(1) NOT NULL DEFAULT 'f',
  `discount_value` decimal(14,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(10,2) NOT NULL DEFAULT 0.00,
  `taxname` varchar(100) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `tax2` decimal(10,2) NOT NULL,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `taxrate` decimal(10,2) NOT NULL,
  `taxrate2` decimal(10,2) NOT NULL,
  `status` text NOT NULL,
  `paymentmethod` text NOT NULL,
  `notes` text NOT NULL,
  `vtoken` varchar(20) NOT NULL,
  `ptoken` varchar(20) NOT NULL,
  `r` varchar(100) NOT NULL DEFAULT '0',
  `nd` date DEFAULT NULL,
  `eid` int(10) NOT NULL DEFAULT 0,
  `ename` varchar(200) NOT NULL DEFAULT '',
  `vid` int(11) NOT NULL DEFAULT 0,
  `currency` int(11) NOT NULL DEFAULT 0,
  `currency_symbol` varchar(10) DEFAULT NULL,
  `currency_prefix` varchar(10) DEFAULT NULL,
  `currency_suffix` varchar(10) DEFAULT NULL,
  `currency_rate` decimal(11,4) NOT NULL DEFAULT 1.0000,
  `recurring` tinyint(1) NOT NULL DEFAULT 0,
  `recurring_ends` date DEFAULT NULL,
  `last_recurring_date` date DEFAULT NULL,
  `source` varchar(200) DEFAULT NULL,
  `sale_agent` int(11) NOT NULL DEFAULT 0,
  `last_overdue_reminder` date DEFAULT NULL,
  `allowed_payment_methods` text DEFAULT NULL,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(50) DEFAULT NULL,
  `billing_country` varchar(100) DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` varchar(100) DEFAULT NULL,
  `q_hide` tinyint(1) NOT NULL DEFAULT 0,
  `show_quantity_as` varchar(100) DEFAULT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `is_credit_invoice` int(1) NOT NULL DEFAULT 0,
  `aid` int(11) NOT NULL DEFAULT 0,
  `aname` varchar(200) DEFAULT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_recibositems`
--

CREATE TABLE `sys_recibositems` (
  `id` int(10) NOT NULL,
  `invoiceid` int(10) NOT NULL DEFAULT 0,
  `userid` int(10) NOT NULL,
  `type` text NOT NULL,
  `relid` int(10) NOT NULL,
  `itemcode` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `qty` varchar(20) NOT NULL DEFAULT '1',
  `amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `taxed` int(1) NOT NULL,
  `taxamount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `duedate` date DEFAULT NULL,
  `paymentmethod` text NOT NULL,
  `notes` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_recibositems`
--

INSERT INTO `sys_recibositems` (`id`, `invoiceid`, `userid`, `type`, `relid`, `itemcode`, `description`, `qty`, `amount`, `taxed`, `taxamount`, `total`, `duedate`, `paymentmethod`, `notes`) VALUES
(8, 10005, 1, '', 0, '', 'test', '1', '1.00', 0, '0.00', '1.00', '2022-06-01', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_remitos`
--

CREATE TABLE `sys_remitos` (
  `id` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `account` varchar(200) NOT NULL,
  `cn` varchar(100) NOT NULL DEFAULT '',
  `invoicenum` text NOT NULL,
  `date` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `datepaid` datetime DEFAULT NULL,
  `subtotal` decimal(18,2) NOT NULL,
  `discount_type` varchar(1) NOT NULL DEFAULT 'f',
  `discount_value` decimal(14,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(10,2) NOT NULL DEFAULT 0.00,
  `taxname` varchar(100) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `tax2` decimal(10,2) NOT NULL,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `taxrate` decimal(10,2) NOT NULL,
  `taxrate2` decimal(10,2) NOT NULL,
  `status` text NOT NULL,
  `paymentmethod` text NOT NULL,
  `notes` text NOT NULL,
  `vtoken` varchar(20) NOT NULL,
  `ptoken` varchar(20) NOT NULL,
  `r` varchar(100) NOT NULL DEFAULT '0',
  `nd` date DEFAULT NULL,
  `eid` int(10) NOT NULL DEFAULT 0,
  `ename` varchar(200) NOT NULL DEFAULT '',
  `vid` int(11) NOT NULL DEFAULT 0,
  `currency` int(11) NOT NULL DEFAULT 0,
  `currency_symbol` varchar(10) DEFAULT NULL,
  `currency_prefix` varchar(10) DEFAULT NULL,
  `currency_suffix` varchar(10) DEFAULT NULL,
  `currency_rate` decimal(11,4) NOT NULL DEFAULT 1.0000,
  `recurring` tinyint(1) NOT NULL DEFAULT 0,
  `recurring_ends` date DEFAULT NULL,
  `last_recurring_date` date DEFAULT NULL,
  `source` varchar(200) DEFAULT NULL,
  `sale_agent` int(11) NOT NULL DEFAULT 0,
  `last_overdue_reminder` date DEFAULT NULL,
  `allowed_payment_methods` text DEFAULT NULL,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(50) DEFAULT NULL,
  `billing_country` varchar(100) DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` varchar(100) DEFAULT NULL,
  `q_hide` tinyint(1) NOT NULL DEFAULT 0,
  `show_quantity_as` varchar(100) DEFAULT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `is_credit_invoice` int(1) NOT NULL DEFAULT 0,
  `aid` int(11) NOT NULL DEFAULT 0,
  `aname` varchar(200) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `transporte_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_remitos`
--

INSERT INTO `sys_remitos` (`id`, `userid`, `account`, `cn`, `invoicenum`, `date`, `duedate`, `datepaid`, `subtotal`, `discount_type`, `discount_value`, `discount`, `credit`, `taxname`, `tax`, `tax2`, `total`, `taxrate`, `taxrate2`, `status`, `paymentmethod`, `notes`, `vtoken`, `ptoken`, `r`, `nd`, `eid`, `ename`, `vid`, `currency`, `currency_symbol`, `currency_prefix`, `currency_suffix`, `currency_rate`, `recurring`, `recurring_ends`, `last_recurring_date`, `source`, `sale_agent`, `last_overdue_reminder`, `allowed_payment_methods`, `billing_street`, `billing_city`, `billing_state`, `billing_zip`, `billing_country`, `shipping_street`, `shipping_city`, `shipping_state`, `shipping_zip`, `shipping_country`, `q_hide`, `show_quantity_as`, `pid`, `is_credit_invoice`, `aid`, `aname`, `description`, `transporte_id`) VALUES
(10006, 1, 'Matias Cettour', '', '0001 000', '2022-06-02', '2022-06-02', NULL, '24.00', 'f', '0.00', '0.00', '0.00', 'IVA 10,5', '0.00', '0.00', '24.00', '10.50', '0.00', 'Paid', '', '', '', '', '0', '2022-06-02', 0, '', 0, 1, '$', NULL, NULL, '1.0000', 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 'Remito generado desde pedido N° 22', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_remitositems`
--

CREATE TABLE `sys_remitositems` (
  `id` int(10) NOT NULL,
  `invoiceid` int(10) NOT NULL DEFAULT 0,
  `userid` int(10) NOT NULL,
  `type` text NOT NULL,
  `relid` int(10) NOT NULL,
  `itemcode` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `qty` varchar(20) NOT NULL DEFAULT '1',
  `amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `taxed` int(1) NOT NULL,
  `taxamount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `duedate` date DEFAULT NULL,
  `paymentmethod` text NOT NULL,
  `notes` text NOT NULL,
  `un` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_remitositems`
--

INSERT INTO `sys_remitositems` (`id`, `invoiceid`, `userid`, `type`, `relid`, `itemcode`, `description`, `qty`, `amount`, `taxed`, `taxamount`, `total`, `duedate`, `paymentmethod`, `notes`, `un`) VALUES
(2, 2, 1, '', 0, '', 'asd', '0', '0.00', 0, '0.00', '0.00', '2022-05-30', '', '', 'UN'),
(42, 10006, 1, '', 0, '', 'Item ingresado manualc con imp individual', '1', '2.00', 0, '0.00', '2.00', '2022-06-02', '', '', 'KG'),
(43, 10006, 1, '', 0, '', 'Eslinga de fibra sintética', '1', '22.00', 0, '0.00', '22.00', '2022-06-02', '', '', 'Mts');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_roles`
--

CREATE TABLE `sys_roles` (
  `id` int(11) NOT NULL,
  `rname` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_roles`
--

INSERT INTO `sys_roles` (`id`, `rname`) VALUES
(1, 'Employee'),
(2, 'vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_sales`
--

CREATE TABLE `sys_sales` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT 0,
  `oid` int(11) NOT NULL DEFAULT 0,
  `oname` varchar(200) NOT NULL,
  `description` mediumtext NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `term` varchar(100) NOT NULL,
  `milestone` varchar(100) NOT NULL,
  `p` int(11) NOT NULL,
  `o` int(11) NOT NULL,
  `open` date NOT NULL,
  `close` date NOT NULL,
  `status` enum('New','In Progress','Won','Lost') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_schedule`
--

CREATE TABLE `sys_schedule` (
  `id` int(11) NOT NULL,
  `cname` mediumtext NOT NULL,
  `val` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_schedule`
--

INSERT INTO `sys_schedule` (`id`, `cname`, `val`) VALUES
(1, 'accounting_snapshot', 'Active'),
(2, 'recurring_invoice', 'Active'),
(3, 'notify', 'Active'),
(4, 'notifyemail', 'facundohernandez@outlook.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_schedulelogs`
--

CREATE TABLE `sys_schedulelogs` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `logs` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_schedulelogs`
--

INSERT INTO `sys_schedulelogs` (`id`, `date`, `logs`) VALUES
(4, '2015-03-14', '2015-03-14 20:17:15 : Schedule Jobs Started....... <br>2015-03-14 20:17:15 : Creating Accounting Snapshot <br>2015-03-14 20:17:15 : Accounting Snapshot created! <br>=============== Accounting Snaphsot ==================== <br>Accounting Snaphsot - Date: 2015-03-13<br>Total Income: Tk. 0.00<br>Total Expense: Tk. 0.00<br>================================================== <br>2015-03-14 20:17:15 : Creating Recurring Invoice <br>2015-03-14 20:17:15 : 1 Invoice created! <br>================================================== <br>'),
(5, '2022-05-12', '================================================== <br>2022-05-12 16:14:32 : Schedule Jobs Started....... <br>2022-05-12 16:14:32 : Creating Accounting Snapshot <br>2022-05-12 16:14:32 : Accounting Snapshot created! <br>=============== Accounting Snaphsot ==================== <br>Accounting Snaphsot - Date: 2022-05-11<br>Total Income: $ 0.00<br>Total Expense: $ 0.00<br>================================================== <br>2022-05-12 16:14:32 : Creating Recurring Invoice <br>2022-05-12 16:14:32 : 0 Invoice created! <br>================================================== <br>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_staffpermissions`
--

CREATE TABLE `sys_staffpermissions` (
  `id` int(11) NOT NULL,
  `rid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `shortname` varchar(50) DEFAULT NULL,
  `can_view` int(1) NOT NULL DEFAULT 0,
  `can_edit` int(1) NOT NULL DEFAULT 0,
  `can_create` int(1) NOT NULL DEFAULT 0,
  `can_delete` int(1) NOT NULL DEFAULT 0,
  `all_data` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_staffpermissions`
--

INSERT INTO `sys_staffpermissions` (`id`, `rid`, `pid`, `shortname`, `can_view`, `can_edit`, `can_create`, `can_delete`, `all_data`) VALUES
(86, 2, 1, 'customers', 1, 1, 1, 1, 0),
(87, 2, 2, 'companies', 1, 1, 1, 1, 0),
(88, 2, 3, 'transactions', 1, 1, 1, 1, 0),
(89, 2, 4, 'sales', 1, 1, 1, 1, 0),
(90, 2, 5, 'bank_n_cash', 1, 1, 1, 1, 0),
(91, 2, 6, 'products_n_services', 1, 1, 1, 1, 0),
(92, 2, 7, 'reports', 1, 1, 1, 1, 0),
(93, 2, 8, 'utilities', 0, 0, 0, 0, 0),
(94, 2, 9, 'appearance', 0, 0, 0, 0, 0),
(95, 2, 10, 'plugins', 0, 0, 0, 0, 0),
(96, 2, 11, 'calendar', 0, 0, 0, 0, 0),
(97, 2, 12, 'leads', 0, 0, 0, 0, 0),
(98, 2, 13, 'tasks', 0, 0, 0, 0, 0),
(99, 2, 14, 'contracts', 1, 1, 1, 1, 0),
(100, 2, 15, 'orders', 0, 0, 0, 0, 0),
(101, 2, 16, 'settings', 1, 1, 1, 0, 0),
(102, 2, 17, 'documents', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_tags`
--

CREATE TABLE `sys_tags` (
  `id` int(11) NOT NULL,
  `text` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_tags`
--

INSERT INTO `sys_tags` (`id`, `text`, `type`) VALUES
(1, 'test', 'Income'),
(3, 'Transportes', 'Contacts'),
(4, 'Siderurgica', 'Contacts');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_tasks`
--

CREATE TABLE `sys_tasks` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `cid` int(11) NOT NULL DEFAULT 0,
  `oid` int(11) NOT NULL DEFAULT 0,
  `iid` int(11) NOT NULL DEFAULT 0,
  `aid` int(11) NOT NULL DEFAULT 0,
  `tid` int(11) NOT NULL DEFAULT 0,
  `eid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `did` int(11) NOT NULL DEFAULT 0,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `subscribers` text DEFAULT NULL,
  `assigned_to` text DEFAULT NULL,
  `priority` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(200) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(200) DEFAULT NULL,
  `vtoken` varchar(50) DEFAULT NULL,
  `ptoken` varchar(50) DEFAULT NULL,
  `started` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `stime` varchar(50) DEFAULT NULL,
  `dtime` varchar(50) DEFAULT NULL,
  `time_spent` varchar(50) DEFAULT NULL,
  `date_finished` date DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `flag` int(1) NOT NULL DEFAULT 0,
  `finished` int(1) NOT NULL DEFAULT 0,
  `ratings` varchar(50) DEFAULT NULL,
  `rel_type` varchar(50) DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `is_public` int(1) NOT NULL DEFAULT 0,
  `billable` int(1) NOT NULL DEFAULT 0,
  `billed` int(1) NOT NULL DEFAULT 0,
  `hourly_rate` decimal(14,2) NOT NULL DEFAULT 0.00,
  `milestone` int(11) DEFAULT NULL,
  `progress` int(3) DEFAULT NULL,
  `visible_to_client` int(1) NOT NULL DEFAULT 0,
  `notification` int(1) NOT NULL DEFAULT 0,
  `trash` int(1) NOT NULL DEFAULT 0,
  `archived` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_tax`
--

CREATE TABLE `sys_tax` (
  `id` int(10) NOT NULL,
  `name` text NOT NULL,
  `state` text NOT NULL,
  `country` text NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `aid` int(11) NOT NULL,
  `bal` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_tax`
--

INSERT INTO `sys_tax` (`id`, `name`, `state`, `country`, `rate`, `aid`, `bal`) VALUES
(2, 'IVA 21', '', '', '21.00', 1, '0.00'),
(3, 'IVA 10,5', '', '', '10.50', 1, '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_transactions`
--

CREATE TABLE `sys_transactions` (
  `id` int(11) NOT NULL,
  `account` varchar(200) NOT NULL,
  `type` enum('Income','Expense','Transfer') NOT NULL,
  `category` varchar(200) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL,
  `payer` varchar(200) DEFAULT NULL,
  `payee` varchar(200) DEFAULT NULL,
  `payerid` int(11) NOT NULL DEFAULT 0,
  `payeeid` int(11) NOT NULL DEFAULT 0,
  `method` varchar(200) DEFAULT NULL,
  `ref` varchar(200) DEFAULT NULL,
  `status` enum('Cleared','Uncleared','Reconciled','Void') NOT NULL DEFAULT 'Cleared',
  `description` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `tax` decimal(18,2) NOT NULL DEFAULT 0.00,
  `date` date NOT NULL,
  `dr` decimal(18,2) NOT NULL DEFAULT 0.00,
  `cr` decimal(18,2) NOT NULL DEFAULT 0.00,
  `bal` decimal(18,2) NOT NULL DEFAULT 0.00,
  `iid` int(11) NOT NULL DEFAULT 0,
  `currency` int(11) NOT NULL DEFAULT 0,
  `currency_symbol` varchar(10) DEFAULT NULL,
  `currency_prefix` varchar(10) DEFAULT NULL,
  `currency_suffix` varchar(10) DEFAULT NULL,
  `currency_rate` decimal(11,4) NOT NULL DEFAULT 1.0000,
  `base_amount` decimal(16,4) NOT NULL DEFAULT 0.0000,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `vid` int(11) NOT NULL DEFAULT 0,
  `aid` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NOT NULL DEFAULT 0,
  `attachments` text DEFAULT NULL,
  `source` varchar(200) DEFAULT NULL,
  `rid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `archived` int(1) NOT NULL DEFAULT 0,
  `trash` int(1) NOT NULL DEFAULT 0,
  `flag` int(1) NOT NULL DEFAULT 0,
  `c1` text DEFAULT NULL,
  `c2` text DEFAULT NULL,
  `c3` text DEFAULT NULL,
  `c4` text DEFAULT NULL,
  `c5` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_transportes`
--

CREATE TABLE `sys_transportes` (
  `id` int(11) NOT NULL,
  `nombre_transporte` varchar(255) NOT NULL,
  `direccion_transporte` varchar(255) NOT NULL,
  `telefono_transporte` varchar(255) NOT NULL,
  `horario_transporte` varchar(255) NOT NULL,
  `alcance_transporte` varchar(255) NOT NULL,
  `formadepago_transporte` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sys_transportes`
--

INSERT INTO `sys_transportes` (`id`, `nombre_transporte`, `direccion_transporte`, `telefono_transporte`, `horario_transporte`, `alcance_transporte`, `formadepago_transporte`) VALUES
(2, 'Expreso Mustang', 'Vélez Sarsfield 6515', '(0341) 5688712', ' de 08:00 a 17:00', '', ''),
(3, 'Lo Bruno', 'Bs As 3830', '(0341) 465-3036 / 462-7979', ' de 08:00 a 17:00', 'SANTIAGO DEL ESTERO - ROSARIO - CORDOBA - BS AS - SAN MIGUEL DE TUCUMAN - \nCATAMARCA - RAFAELA - SAN FRANCISCO', ''),
(4, 'Ex Brio / Credifin / Entrega en Planta SN', '', '', '', '', ''),
(5, 'Tavares', 'Avellaneda 2530', '0341-4314829', ' de 08:00 a 17:00', '', ''),
(6, 'BIANCHI - EST VICA', 'Iriondo 3040', '3414321568', ' de 08:00 a 17:00', 'CORONDA', ''),
(7, 'NEXO - EST VICA', 'Irionda 3040', '03414321568', ' de 08:00 a 17:00', 'SAN JORGE', ''),
(8, 'BUGENIS  - EST VICA', 'Iriondo 3040', '3414321568', ' de 08:00 a 17:00', 'ISLA VERDE', ''),
(9, 'EL RAYO - EST VICA', 'Iriondo 3040', '3414321568', ' de 08:00 a 17:00', 'ARRECIFES', ''),
(10, 'EL BIYO  - EST VICA', 'Iriondo 3040', '0341-4321568', ' de 08:00 a 17:00', ' VILLA ANGELA', ''),
(11, 'Cruz del Sur', 'Venezuela 1291 - Rosario', '(0341) 452 0111 / 0200', ' de 08:00 a 17:00', '', ''),
(12, 'CARLITOS  - EST VICA', 'Iriondo 3040', '3414321568', ' de 08:00 a 17:00', 'RAFAELA', ''),
(13, 'CORRER - EST VICA', 'Iriondo 3040', '3414321568', ' de 08:00 a 17:00', 'PARANA', ''),
(14, 'Transporte Imperial', 'San Nicolas 3260', '(0341) 431-6594', ' de 08:00 a 17:00', '', ''),
(15, 'Estación de Cargas ALEM', ' Galvez 239', ' 0341 482-9138', ' de 08:00 a 17:00', '', ''),
(16, 'EXPRESO SUR  - EST VICA', 'Irionddo 3040', '3414321568', ' de 08:00 a 17:00', 'BELL VILLE', ''),
(17, 'ROLO - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', ' LABOULAYE', ''),
(18, 'EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', '', ''),
(19, 'El Pampero', 'Río de Janeiro 2495', '(0341) 431 3044 / 432 0410 / 431 2626', ' de 08:00 a 17:00', '', ''),
(20, 'Rosario Cargas', '0341 466-2444', 'Av. Ntra. Sra. del Rosario 2751', 'Lunes a Viernes de 08:0 a 13:00', '', ''),
(21, 'Expreso Brio', 'Av. Acevedo 2949', '0810 3452746', ' de 08:00 a 17:00', 'BUENOS AIRES - ZONA NORTE BUENOS AIRES - ZONA OESTE BUENOS AIRES - ZONA SUR CÓRDOBA - CIUDAD DE BUENOS AIRES - MENDOZA - RAFAELA - ROSARIO - ROSARIO NOROESTE - SANTA FE - VILLA MARÍA', ''),
(22, 'GISMANO - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', '9 de Julio', ''),
(23, 'Ariel Bafundi', 'Oroño 3873 / Constitución 327', '03467-15638752 /441362', ' de 08:00 a 17:00', '', ''),
(24, 'HEGUI - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Baradero', ''),
(25, 'GARELLO - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Arequito', ''),
(26, 'ITATI - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Gobernador Crespo', ''),
(27, 'LOPEZ - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Marcos Juarez', ''),
(28, 'Credifin Express', '23 de septiembre 260', '03400-477174 / Tel BS AS (CTC) 011 46007457/58/59', ' de 08:00 a 17:00', 'Resistena - Roque Saenz Peña - Rafaela - Las Parejas - Armstrong - Marcos Juarez - Buenos Aires -  Capital Federal - Chaco - \nCordoba - Corrientes - Entre Rios - Formosa - Santa Fe', ''),
(29, 'LUIGI - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'San Genaro', ''),
(30, 'MEDIPAQ - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'SANTA FE', ''),
(31, 'VEGA - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'WHEELWRIGTH', ''),
(32, 'Retira Cliente', '', '', ' de 08:00 a 17:00', '', ''),
(33, 'La Sevillanita - Rosario', 'Deán Funes 150', '(0341) 486 - 0131 / 90', ' de 08:00 a 17:00', 'Salta - Jujuy - Tucuman - \nJUJUY - SALTA - TUCUMAN - CATAMARCA - SANTIAGO DEL ESTERO - LA RIOJA - CORDOBA - SANTA FE - BUENOS AIRES', ''),
(34, 'Deposito Las Camelias SA', 'Suipacha 768', '(0341)4360772', ' de 08:00 a 14:00', '', ''),
(35, 'Transporte General Mosconi', ' Junin 6090', '0341-4353437 / 4309026', ' de 08:00 a 17:00', '', ''),
(36, 'LUGANO - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'General Arenales', ''),
(37, 'RODRIGUEZ - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Venado Tuerto', ''),
(38, 'ROQUE - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Diamante', ''),
(39, 'Propio', '', '', '', '', ''),
(40, 'SANCHEZ - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'General Roca', ''),
(41, 'SAPPIETRO - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Galvez', ''),
(42, 'Ser Ger', 'Ituzaingo 4250', '03462-15414144', ' de 08:00 a 16:30', '', ''),
(43, 'Expreso Lider', 'Vuelta de Obligado 4709', '0341-4640932', ' de 08:00 a 17:00', 'CHACO -  FORMOSA - CORRIENTES', ''),
(44, 'TRASNSPORTE CHILECITO - ROSARIO - \n\nTel/Fax: (0341) 432-0459 / 3261', 'San Nicolás 3151', '0341 432-0459', ' de 08:00 a 17:00', 'LA RIOJA - CHAMICAL - CHILECITO', ''),
(45, 'SAMID - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Nogoya', ''),
(46, 'Naveira', '27 de Febrero 259', '(0341) 488-0273 / (0341) 15-689-3333', ' de 08:00 a 17:00', 'Buenos Aires - Rosario', ''),
(47, 'WINTER - EST VICA', 'Iriondo 3040', '03534114584', ' de 08:00 a 17:00', 'Villa Maria', ''),
(48, 'Expreso Rivadavia', 'Rio de Janeiro 2510', '0341 431-3044', ' de 08:00 a 17:00', 'JUJUY - SALTA - TUCUMAN - CATAMARCA - SANTIAGO DEL ESTERO - \nLA RIOJA - CORDOBA - SANTA FE - ROSARIO -BUENOS AIRES - RAFAELA', ''),
(49, 'VALGUI - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Santa Fe', ''),
(50, 'RUSSIAN - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Pergamino', ''),
(51, 'transporte demo', 'direccion demo', 'telefono demo', 'horario demo', 'alcance demo', ''),
(52, 'JR -  EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Victoria', ''),
(53, 'SOFIA - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Junin', ''),
(54, 'MAS - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'San Nicolas', ''),
(55, 'MJB - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'SAN NICOLAS -SALTO', ''),
(56, 'BOIERO - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'San Jorge', ''),
(57, 'SUCHALENSE - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Sunchales', ''),
(58, 'Via Cargo - Rosario', '9 de julio 2377 o Roullion y Godoy', '	(0341)-15- 684-2057', ' de 08:00 a 17:00', 'Bariloche-Cipolleti-Neuquén-Rio Gallegos-Comodoro Rivadavia-Trelew-Gral.Roca-Esquel-Puerto Madryn-San Antonio Oeste-Viedma-Bahía Blanca-Buenos Aires-Rosario-Posadas-Tucumán-Cordoba-Entre Ríos-Corrientes-Jujuy-Misiones-Salta', ''),
(59, 'LATINI - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Firmat', ''),
(60, 'TANITO - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Venado Tuerto', ''),
(62, 'VALLE - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Tostado', ''),
(63, 'MENSI - SAN GENARO - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'San Genaro', ''),
(64, 'TERRY - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'ELORTONDO', ''),
(65, 'BERTAPELLE - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Corral de Bustos', ''),
(66, 'LA VIEJA - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Firmat', ''),
(67, 'PICHI - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'CRUZ ALTA', ''),
(68, 'LEIVA - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'San Genaro', ''),
(69, 'RODARO - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'SAN JORGE', ''),
(70, 'Central Argentino', 'Roulion 2696', ' (0341)  4321592', ' de 08:00 a 17:00', '', ''),
(71, 'Chevallier', '', '', '', '', ''),
(72, 'Conte hnos', 'Viamonte 3920', '0341-4919644', ' de 08:00 a 17:00', '', ''),
(73, 'PALITO - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Tortugas', ''),
(74, 'MJ - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Rafaela', ''),
(75, 'RINAUDO - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Junin', ''),
(76, 'PONCIO - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Las Parejas', ''),
(77, 'Pedrito Hnos\nPedrito Hnos', ' Perú 549', ' 0341-4562323', ' de 08:00 a 17:00', 'Parana', ''),
(78, 'TRANSPORTE MJB', 'ALSINA 2380', ' 0341-433-6334 -Celular 0351-1540-34150 - 02474 686692 (Roberto)', ' de 08:00 a 17:00', '', ''),
(79, 'OCA / OSCAR ESCUDERO', '', '0266-4404307', ' de 08:00 a 17:00', '', ''),
(80, 'Rinaudo Transporte', 'San Nicolás 3151 - centro 27', '341-4323261', ' de 08:00 a 17:00', 'FORMOSA - CHACO - SGO DEL ESTERO - LA RIOJA - CORRIENTES - \nSANTA FE - CORDOBA - ENTRE RIOS - SAN LUIS - LA PAMPA - BS AS', ''),
(82, 'PERETTI - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'FUENTES', ''),
(83, 'PLANO - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'EL TREBOL', ''),
(84, 'Transporte Elisero', 'Junín 6090', ' 0341 435-3437', ' de 08:00 a 17:00', '', ''),
(85, 'El Pajaro', ' Alem 2931', '0341-156509270', ' de 08:00 a 17:00', '', ''),
(86, 'MAJUL - EST VICA', 'Iriondo 3040', '03414321568 / 03467-15636126', ' de 08:00 a 17:00', 'Camilo Aldao', ''),
(87, 'MARCELINO - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Parana', ''),
(89, 'Retiro en Planta Bs As', '', '', '', '', ''),
(90, 'Transporte Belgrano', 'Rio de Janeiro  2510', '0341-4320410', ' de 08:00 a 17:00', 'CAPITAL FEDERAL - CORDOBA - ROSARIO', ''),
(91, 'SAGIORATTO - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Arequito', ''),
(93, 'Mostto', 'San Nicolás 3151', ' 0341-4320459 / 4323261', ' de 08:00 a 17:00', '', ''),
(94, 'Transporte Italia', ' Ocampo 1729', '0341-4852042', ' de 08:00 a 17:00', '', ''),
(95, 'ROLY  - EST VICA', 'Iriondo 3040', '03\n03414321568', ' de 08:00 a 17:00', 'JUNIN', ''),
(96, 'Expreso Demonte', 'San Nicolas 3151', '0341 432 0459', ' de 08:00 a 17:00', '', ''),
(97, 'Expreso Richards', 'Cafferata 3140', '0341 4316403', ' de 08:00 a 17:00', '', ''),
(98, 'BARBERO- EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Bell Ville', ''),
(99, 'Expreso OLIVA Hnos\nEXPRESO OLIVA', 'Garibaldi 526', '0341-463 5809', ' de 08:00 a 17:00', 'Buenos Aires - Cordoba - Neuquen - Rosario', ''),
(100, 'Comisionista Fabio Machin', ' Cafferata  1924', '(0341) 4327647', ' de 08:00 a 17:00', '', ''),
(101, 'El norteño', 'Virasoro 3250', '0341 4340815', ' de 08:00 a 17:00', '', ''),
(102, 'Snaider Transporte', 'Juan Pablo II 6602 (Colectora Av. Circunvalación)', 'Tel. 0341-4643090', ' de 08:00 a 17:00', '', ''),
(103, 'Claudio Handorf', ' Caferata 1819', '03388-400725', ' de 08:00 a 17:00', '', ''),
(104, 'Transportes Bodgan', 'Garay 3660', '(0341) – 4341012', ' de 08:00 a 17:00', 'SANTA FE - ROSARIO - BUENOS AIRES - ENTRE RIOS', ''),
(105, 'Transporte Gomez', 'Balcarce 6069', '0341-6299505', 'Lunes a Viernes de 08:00 a 17:00', 'Tucuman - Central', ''),
(106, 'BARCO - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Totoras', ''),
(107, 'BARTOLACCI - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'CAÑADA DE GOMEZ', ''),
(108, 'BAFUNDI - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'SAN JOSE DE LA ESQUINA', ''),
(109, 'IRUSTA - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'ARMSTRONG', ''),
(110, 'Ex. Rodriguez Hnos', ' Juan José Paso 731', '0341 456-1908', ' de 08:00 a 17:00', '', ''),
(111, 'TNT -', '', '', '', '', ''),
(113, 'Espinosa Transporte', 'Av. Pueyrredón 3755', '(0341) 433 2747', ' de 08:00 a 15:00', 'BS AS - ROSARIO - COLON', ''),
(114, 'Transporte BALUT', 'Sta Fe 4560', ' 0341- 4362085', ' de 08:00 a 17:00', '', ''),
(115, 'Leandro Taboada', 'Urquiza 4925', '03416050256', ' de 08:00 a 17:00', '', ''),
(116, 'BERTOTI - EST VICA', 'Iriondo 3040', '03414321568', ' de 08:00 a 17:00', 'Totoras', ''),
(117, 'Singolani', ' Fragata Sarmiento 2645', '0341-4621611', ' de 08:00 a 17:00', '', ''),
(118, 'VICA - Arbelaiz', 'Iriondo 3040', '0341-4321568', ' de 08:00 a 17:00', '', ''),
(119, 'Transporte RODRIGUEZ Hnos', 'GORRITI 7360', '341-4582956', 'Lunes a Viernes de 08:00 a 17:00', 'Mendoza - San Rafael de Mendoza - San Luis', ''),
(120, 'Transporte Miguel', 'Caferatta 1924', '0341-4327647', ' de 08:00 a 17:00', '', ''),
(121, 'Transporte Gonzalez', 'Rio de janeiro 2510', '0341 431-3044', ' de 08:00 a 17:00', '', ''),
(122, 'Estacion de cargas / Comisionista  \" RASSO \"', 'Ayacucho 3130', '', ' de 08:00 a 17:00', '', ''),
(123, 'Estacion de Cargas San Lorenzo', 'Ayacucho 3130', '03414860093', ' de 08:00 a 17:00', 'TEODELINA - SAN GENERO NORTE - SAN JORGE - ARRIBEÑOS - SAN LORENZO - SANTA CLARA - TOTORAS - VILLA CAÑAS - SAN CARLOS CENTRO - SASTRE - LAS ROSAS - A. SECO - PARANA - PIAMONTE - JUNIN - ALCORTA - SAN VICENTE - LAS PAREJAS - RAFAELA - ARRECIFES - GALVEZ-', ''),
(124, 'Estacion de Cargas Abel Milton Flores', 'Netri 1460 B° Parque Casas - Rosario', '0341 4763844 - 0341155890746', ' de 08:00 a 17:00', 'CERRILLO-EL CARRIL-CHALICAN-PUESTO VIEJO-EL BORDO-METAN-YALA-REYES-CERRILLOS-CAMPO SANTO-GRAILE PINTADO-GRAL GUEMES-SAN MARTIN-VAQUERO-LOS LAPACHOS-ROSARIO DE LA FRONTERA-ROSARIO DE LERMA-SALTA LOZANO-JUJUY-PERICO-PALPALA-EL CARMEN-MONTERRICO-SAN PEDRO', ''),
(125, 'Logistica Cafferata', 'Cafferata 1924 - Rosario', '0341 4327647', ' de 08:00 a 18:00', 'SANTA FE-CORDOBA-ENTRE RIOS-BS AS-SANTIAGO DEL ESTERO', ''),
(126, 'EXPRESO SUR', 'Necochea 2467 -Avellaneda 2530 - Constitucion 327 /Rosario', '0341-482067', ' de 08:00 a 17:00', 'ALMAFUERTE-BELL VILLE-CORDOBA-DALMACIO VELEZ -ETRURIA-FUNES-GRAL DEHEZA-HERNANDO-IDIAZABAL-JAMES CRAIK-LEONES-MARCOS JUAREZ-NEOTINGER-ONCATIVO-PILAR-ROSARIO-SAN FRANCISCO-TANCACHA-URACHA-WENSELEO ESCALANTE', ''),
(127, 'Centro San Jose', 'Garay 3550 / ROSARIO', '0341155508174 - 0341 482-3619', ' de 08:00 a 17:00', 'CORDOBA-BS AS-SANTA FE-SGO DEL ESTERO-ENTRE RIOS-', ''),
(128, 'Transporte Raosa', 'Andrade 201 esq Pavon - ROSARIO', '0341-155083366', ' de 08:00 a 17:00', 'CORRIENTES-CHACO-FORMOSA-MISIONES', ''),
(129, 'Estacion de Cargas Garay', 'Garay 3660', '0341-4341012/ 0341-155805572', ' de 08:00 a 17:00', '', ''),
(130, 'Encomiendas San Pablo', 'Cafferata 1819 ROSARIO', '03414326072-0341156618900-034115895594', ' de 08:00 a 17:00', 'CORDOBA-SANTA FE-BS AS-', ''),
(131, 'S.E.R', 'Santa Fe 3954  - ROSARIO', '03414362085-0341154688316', ' de 08:00 a 17:00', 'MENDOZA-SAN JUAN-SAN LUIS-VILLA MERCEDES-RIO CUARTO-SAN FRANCISCO-SANTA FE-BUENOS AIRES-CORDOBA-POSADAS-OBERA-IGUAZU-VIRAORO-APOSTOLES-SAN VICENTE', ''),
(132, 'Transporte JLB', 'Laprida 2252  / Central San Jose Rosario', '03414823619', ' de 08:00 a 17:00', '', ''),
(133, 'Estacion de Cargos Ocampo', 'Ocampo 1729', '0341 4852042', ' de 08:30 a 17:30', '', ''),
(134, 'Transequipos', 'Leandro N. Alem 3342', '0341 464-1213', 'Lunes a Viernes de 08:00 a 17:00', 'Rawson - Trelew - Comodoro Rivadavia', ''),
(135, 'Transporte Pampa', 'Junin 6010', '0341 439 7082', 'Lunes a Viernes de 08:00 a 17:00', '', ''),
(136, 'Expreso Enco-Lam', 'Rosario - OCAMPO 1729', '0341-155712378', ' de 08:00 a 17:00', 'Esperanza - Rosario - Villa Constitución.', ''),
(137, 'Transporte Tomassini', 'Galvez 259', '0341 4823056 - 4853883', 'Lunes a Viernes de 08:00 a 17:00', '', ''),
(138, 'AviaTerai', 'contacto@aserraderosytransportesat.com', ' 02202-424724', ' de 08:00 a 17:00', 'BS AS - CHACO - FORMOSA - CORRIENTES - MISIONES - SANTA FE - ENTRE RIOS - SALTA - JUJUY - SGO DEL ESTERO - TUCUMAN', ''),
(139, 'WILLINER', 'Roullon 2696 -', '', ' de 08:00 a 17:00', '', ''),
(140, 'El quebrachito', 'Río de Janeiro 2510', '(0341) 432-0410 (0341) 431-3044', ' de 08:00 a 17:00', 'Rio Cuarto - Cordoba - Laboulaye - San Luis - Villa Mercedes - Rosario - Bs As', ''),
(141, 'Transporte Aguilera', 'Galvez 239', '03385 - 15522481', ' de 08:00 a 17:00', '', ''),
(142, 'Via Cargo - Gral. Pacheco', 'H. Irigoyen 2338, modulo enc. 2, Terminal Omnibus', '011-4506-5795', 'Lunes a Viernes de 9:00 a 19:30', '', ''),
(143, 'Transporte Cingolani', 'Hilarion de la Quintana 3390', '0341 4651634', ' de 08:00 a 17:00', 'Cordoba - Toledo-Pila  Rio 2d  Laguna Paiva-Oncativo-Villa Mara-Bell Ville-San Marcos-Leones-Noetinger-J.Posse-M.Buey-Inriville-Gral Roca-Tortugas-Armstrong-Cañada de Gomez-Carcaraña-Roldan-Funes- Rosario', ''),
(144, 'Santolaria', 'Hilarion de la Quintana 3390 (esq Iriondo)', '0341 4651634', ' de 08:00 a 17:00', 'Esperanza - Rosario', ''),
(145, 'Toto Comisionista', '', '03476 15371587', ' de 08:00 a 17:00', 'Desde Rosario - San Lorenzo y zona', ''),
(146, 'Transporte Nardon', 'Garay 3550', '', ' de 08:00 a 17:00', 'Inriville - Monte Buey - Cruz Alta\nMonte Buey - Inriville', ''),
(147, 'El Rapido', 'Bs As - Villa Soldati - PERGAMINO 3751 VILLA SOLDATI - CABA Nave C - Modulos: 80 - 81 - 82 - 83', '011-5680-1400', 'Lunes a Viernes de 08:00 a 17:00', 'Bs As - Cipolletti - Neuquen', ''),
(148, 'Deposito Covelli', 'Cafferata 1924', '03464 - 15680755', ' de 08:00 a 17:00', '', ''),
(149, 'Transporte Delfin', 'Bv. Oroño 4595', '0341 466-7478    Sucursal Neuquen 0299 154530104 / 0299 156261830 (RAUL)', ' de 08:00 a 17:00', 'Rosario - Cordoba - Neuquen', ''),
(150, 'Deposito EL RAFA / DE GRANDE DANIEL ROMERO', 'Sarmiento 2146', '', ' de 08:00 a 17:00', '', ''),
(151, 'Transporte Heral', 'Rio de Janeiro 2510', '341 4397082', ' de 08:00 a 17:00', 'Bs As-Rosario-Santa Fe-Corrientes Cap- Mercedes-Perugorria-Mariano Loza-Curuzu Cuatia-Sauce-Felipe Yofre-Chavarria-Paso de los Libres-Yapeyu-La Cruz-Alvear-Santo Tome-Virasoro-Monte Caseros', ''),
(152, 'Transporte MP', 'Garay 3660', '0341-4341012', 'Lunes a Viernes de 08:00 a 17:00', 'olavarria', ''),
(153, 'Expreso Santa Rosa', 'Juan XXIII 7135', '0341 5253585', ' de 08:00 a 17:00', '', ''),
(154, 'Tte ARANGO', 'ALSINA 2380 - ROSARIO', '3514034150 -German', ' de 08:00 a 18:00', '', ''),
(155, 'Luciano Medichi', '', '3462 500227', ' de 08:00 a 17:00', 'Bombal - Bigand - Melincue - Elortondo - Santa Isabel - Teodelina', ''),
(156, 'Expreso Oro negro', 'Colón 2631', '0341- 4860458 / 4856608 / 4819203', 'Lunes a Viernes de 08:30 a 18:00', '', ''),
(157, 'Transporte Bafundi', 'Iriondo 3050 o Gaboto 1549', '03467-15638752', ' de 08:00 a 17:00', '', ''),
(159, 'Transporte Prada', 'Francia 1761', '(0341) 432 8910', ' de 08:00 a 17:00', '', ''),
(161, 'Tte PATO - JORGE PATO REPETTO', 'RIO DE JANEIRO 475', '03471-15516317', 'Lunes a Viernes de 08:00 a 17:00', 'Las Parejas', ''),
(162, 'Centro de encomiendas Santa Fe', 'Ituzaingo 4140', '03468 419294 (fregozzi)', ' de 08:00 a 17:00', '', ''),
(163, 'Expreso Lujan de Cuyo', 'Av. Ovidio Lagos 4701', '0341 466-1180', ' de 08:00 a 17:00', '', ''),
(164, 'Transporte SLP', 'Gálvez 192, esq. Colon. Bº José de San Martín', '0341 – 48 27117', ' de 08:00 a 17:00', '', ''),
(165, 'Transporte Ñandubay SRL', 'San Nicolas 3151', '0341 4323261', ' de 08:00 a 17:00', '', ''),
(166, 'Transporte Silvio', 'Alsina 2575', '03564 15-65-0200', ' de 08:00 a 17:00', '', ''),
(168, 'Estacion de cargas Avellaneda - Comi: Miguel Castellini', 'Avellaneda 2530', '(0341) 431 - 4829', 'Lunes a Viernes de 08:00 a 17:00', '', ''),
(169, 'Estacion de cargas ALSINA', 'Alsina 2380', '', ' de 08:00 a 17:00', '', ''),
(170, 'La veloz del norte', 'ALSINA 730', '', ' de 08:00 a 17:00', '', ''),
(171, 'Lan Carg', 'Rio de janeiro 2510', '0341-4313044', ' de 08:00 a 17:00', '', ''),
(172, 'Transporte Serger', 'Alsina 1830', '03462 - 15414144', ' de 08:00 a 17:00', '', ''),
(173, 'Mel Comisiones', 'Santa Fe y 25 de Mayo / Corral de Buscos - Cordoba', '03468 15560908 / 03468 15643070', ' de 08:00 a 17:00', '', ''),
(174, 'El lechon santafesino', 'Matambre y mollejas', '', ' de 08:00 a 17:00', '', ''),
(175, 'Rosato - Estacion de Cargas San Lorenzo', 'Ov Lagos 5821', '0341-154860093', 'Lunes a Viernes de 08:00 a 17:00', 'Colon Bs As', ''),
(176, 'Transporte Micihe', 'Liniers 2945', '', ' de 08:00 a 17:00', '', ''),
(177, 'Transporte Luces', 'Alsina 2575', '0341 431 4496', ' de 08:00 a 17:00', '', ''),
(178, 'Transporte Bogdan', 'Rio de Janeiro 2510', '0341 4313044', ' de 08:00 a 17:00', '', ''),
(179, 'Transporte Bin pack', 'Virasoro 3340', '0341 4316262', ' de 08:00 a 17:00', '', ''),
(180, 'Punto cuatro logistica', 'francia 5737', '03584126037', ' de 08:00 a 17:00', '', ''),
(181, 'Carolina', 'Velez Sarfield 7455', '', ' de 08:00 a 17:00', '', ''),
(182, 'Andreani-', 'Italia 67', '08101221111', 'Lunes a Viernes de 08:00 a 17:00', 'amplio', ''),
(183, 'Transporte Brinatti', 'Rio de Janeiro 2510', '', ' de 08:00 a 17:00', '', ''),
(184, 'Transporte Rodriguez', 'Garay 3642', '0341 153136951', ' de 08:00 a 17:00', '', ''),
(186, 'Transporte Sauer SRL', 'Pueyrredón 3755 - Rosario, Santa Fe', '(0341) 433-2747 - 463-0806', ' de 08:00 a 17:00', '', ''),
(187, 'EXPRESO VILLENSE', 'Belgrano 787 - Villa Constitucion, Santa Fe', '03400 47-6403', ' de 08:00 a 17:00', '', ''),
(188, 'Debasto', 'Cafferata 1924', '', ' de 08:00 a 17:00', '', ''),
(189, 'Estación de Carga Uriel', 'Alvear 3018 - Rosario', '0341 433-1888', ' de 08:00 a 17:00', '', ''),
(190, 'Auge - Estacion VICA', 'Iriondo 3040 - Rosario', '3382505372', ' de 08:00 a 17:00', '', ''),
(191, 'Comisionista Salvucci (Molinari)', 'San Nicolas 3151', '', ' de 08:00 a 17:00', '', ''),
(192, 'Transporte Chilecito', 'San Nicolas 3151', '0341 4320459', ' de 08:00 a 17:00', '', ''),
(193, 'Tte Grosso - Sunchales', 'Alvear 3018 - Deposito URIEL', '', 'Lunes a Viernes de 08:00 a 17:00', 'SUNCHALES - RAFAELA', ''),
(194, 'Tte. Premat', 'San Nicolas 3151', '0341 4335302', ' de 08:00 a 17:00', '', ''),
(195, 'Transpiloni', 'San Nicolas 3151', '341 - 4323261', ' de 08:00 a 17:00', '', ''),
(196, 'Nuevo Transporte', 'Avellaneda 2530', '', ' de 08:00 a 17:00', '', ''),
(197, 'Transporte Pepe', 'San Nicolas 3151', '', ' de 08:00 a 17:00', '', ''),
(198, 'Valle de lerma', 'Alberdi 25 BIS (Alberdi y Salta)', '0341 - 5905755 (Ale)', ' de 08:00 a 17:00', '', ''),
(199, 'Jose KUNS', 'Alsina 2575', '3492-615103', ' de 08:00 a 17:00', 'RAFAELA', ''),
(200, 'Rafa comisiones', 'Cordoba 4075', '', ' de 08:00 a 17:00', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_units`
--

CREATE TABLE `sys_units` (
  `id` int(11) NOT NULL,
  `type` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `reference` varchar(200) DEFAULT NULL,
  `conversion_factor` decimal(16,2) NOT NULL DEFAULT 0.00,
  `sorder` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_users`
--

CREATE TABLE `sys_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `fullname` varchar(45) NOT NULL DEFAULT '',
  `phonenumber` varchar(20) DEFAULT NULL,
  `password` mediumtext NOT NULL,
  `user_type` varchar(50) NOT NULL DEFAULT 'Full Access',
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `last_login` datetime DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `creationdate` datetime NOT NULL,
  `otp` enum('Yes','No') NOT NULL DEFAULT 'No',
  `pin_enabled` enum('Yes','No') NOT NULL DEFAULT 'No',
  `pin` mediumtext NOT NULL,
  `img` text NOT NULL,
  `api` enum('Yes','No') DEFAULT 'No',
  `pwresetkey` varchar(100) NOT NULL,
  `keyexpire` varchar(100) NOT NULL,
  `roleid` int(11) NOT NULL DEFAULT 0,
  `role` varchar(200) DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `autologin` varchar(200) DEFAULT NULL,
  `at` varchar(200) DEFAULT NULL,
  `landing_page` varchar(200) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `c1` text DEFAULT NULL,
  `c2` text DEFAULT NULL,
  `c3` text DEFAULT NULL,
  `c4` text DEFAULT NULL,
  `c5` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_users`
--

INSERT INTO `sys_users` (`id`, `username`, `fullname`, `phonenumber`, `password`, `user_type`, `status`, `last_login`, `email`, `creationdate`, `otp`, `pin_enabled`, `pin`, `img`, `api`, `pwresetkey`, `keyexpire`, `roleid`, `role`, `last_activity`, `autologin`, `at`, `landing_page`, `language`, `notes`, `c1`, `c2`, `c3`, `c4`, `c5`) VALUES
(1, 'demo@example.com', 'Administrator', '', '$2b$10$.vWJz4hX0TW5Z7hK.hYkB.JdXXiz7zceyJbPo3hm.jxtbTNp05oQi', 'Admin', 'Active', '2022-05-29 09:45:08', '', '2014-10-20 01:43:07', 'No', 'No', '$1$ZW/.uF5.$.rwCeLiguoBzYzf3waOnY1', '', 'No', '', '0', 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'ventas@lumat.com', 'Matias Cettour', '', 'ibtCrRqzlo5uI', 'Admin', 'Active', '2022-04-28 09:59:08', '', '2022-04-28 09:59:08', 'No', 'No', '', '', 'No', '', '', 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'luciano@lumat.com', 'Luciano Moriconi', '', 'ibJ5gqo.GKtH.', 'Admin', 'Active', '2022-04-28 09:59:44', '', '2022-04-28 09:59:44', 'No', 'No', '', '', 'No', '', '', 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'facundohernandez@outlook.com', 'vendedor', '', 'ibOMEJRWy/FME', 'vendedor', 'Active', '2022-04-28 15:33:23', '', '2022-04-28 10:39:27', 'No', 'No', '', 'gravatar', 'No', '', '', 0, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'test@test.com', 'test', '', 'ibLJRKHoI8Qfk', 'vendedor', 'Active', '2022-06-01 18:40:06', '', '2022-04-28 15:31:16', 'No', 'No', '', '', 'No', '', '', 2, 'vendedor', NULL, 'zgl9kf2d71n5c9qp1rxz5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `account_balances`
--
ALTER TABLE `account_balances`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clx_integrations`
--
ALTER TABLE `clx_integrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `crm_accounts`
--
ALTER TABLE `crm_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `crm_accountsold`
--
ALTER TABLE `crm_accountsold`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `crm_ctes_transportes`
--
ALTER TABLE `crm_ctes_transportes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `crm_customfields`
--
ALTER TABLE `crm_customfields`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `crm_customfieldsvalues`
--
ALTER TABLE `crm_customfieldsvalues`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `crm_groups`
--
ALTER TABLE `crm_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `crm_industries`
--
ALTER TABLE `crm_industries`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `crm_leads`
--
ALTER TABLE `crm_leads`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `crm_lead_sources`
--
ALTER TABLE `crm_lead_sources`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `crm_lead_status`
--
ALTER TABLE `crm_lead_status`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `crm_salutations`
--
ALTER TABLE `crm_salutations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ib_doc_rel`
--
ALTER TABLE `ib_doc_rel`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ib_invoice_access_log`
--
ALTER TABLE `ib_invoice_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_accounts`
--
ALTER TABLE `sys_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_activity`
--
ALTER TABLE `sys_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_api`
--
ALTER TABLE `sys_api`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_appconfig`
--
ALTER TABLE `sys_appconfig`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_cart`
--
ALTER TABLE `sys_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_cats`
--
ALTER TABLE `sys_cats`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_companies`
--
ALTER TABLE `sys_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_currencies`
--
ALTER TABLE `sys_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_documents`
--
ALTER TABLE `sys_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_emailconfig`
--
ALTER TABLE `sys_emailconfig`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_email_logs`
--
ALTER TABLE `sys_email_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_email_templates`
--
ALTER TABLE `sys_email_templates`
  ADD PRIMARY KEY (`id`,`language_id`),
  ADD KEY `tplname` (`tplname`(32));

--
-- Indices de la tabla `sys_events`
--
ALTER TABLE `sys_events`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_invoiceitems`
--
ALTER TABLE `sys_invoiceitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoiceid` (`invoiceid`);

--
-- Indices de la tabla `sys_invoices`
--
ALTER TABLE `sys_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `status` (`status`(3));

--
-- Indices de la tabla `sys_items`
--
ALTER TABLE `sys_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_items_old`
--
ALTER TABLE `sys_items_old`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_item_cats`
--
ALTER TABLE `sys_item_cats`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_leads`
--
ALTER TABLE `sys_leads`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_logs`
--
ALTER TABLE `sys_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_orders`
--
ALTER TABLE `sys_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_permissions`
--
ALTER TABLE `sys_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_pg`
--
ALTER TABLE `sys_pg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gateway_setting` (`name`(32),`processor`(32)),
  ADD KEY `setting_value` (`processor`(32),`ins`(32));

--
-- Indices de la tabla `sys_pl`
--
ALTER TABLE `sys_pl`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_pmethods`
--
ALTER TABLE `sys_pmethods`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_quoteitems`
--
ALTER TABLE `sys_quoteitems`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_quotes`
--
ALTER TABLE `sys_quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_recibos`
--
ALTER TABLE `sys_recibos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `status` (`status`(3));

--
-- Indices de la tabla `sys_recibositems`
--
ALTER TABLE `sys_recibositems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoiceid` (`invoiceid`);

--
-- Indices de la tabla `sys_remitos`
--
ALTER TABLE `sys_remitos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `status` (`status`(3));

--
-- Indices de la tabla `sys_remitositems`
--
ALTER TABLE `sys_remitositems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoiceid` (`invoiceid`);

--
-- Indices de la tabla `sys_roles`
--
ALTER TABLE `sys_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_sales`
--
ALTER TABLE `sys_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_schedule`
--
ALTER TABLE `sys_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_schedulelogs`
--
ALTER TABLE `sys_schedulelogs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_staffpermissions`
--
ALTER TABLE `sys_staffpermissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_tags`
--
ALTER TABLE `sys_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_tasks`
--
ALTER TABLE `sys_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_tax`
--
ALTER TABLE `sys_tax`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_country` (`state`(32),`country`(2));

--
-- Indices de la tabla `sys_transactions`
--
ALTER TABLE `sys_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_transportes`
--
ALTER TABLE `sys_transportes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_units`
--
ALTER TABLE `sys_units`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_users`
--
ALTER TABLE `sys_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `account_balances`
--
ALTER TABLE `account_balances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clx_integrations`
--
ALTER TABLE `clx_integrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `crm_accounts`
--
ALTER TABLE `crm_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `crm_accountsold`
--
ALTER TABLE `crm_accountsold`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `crm_ctes_transportes`
--
ALTER TABLE `crm_ctes_transportes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `crm_customfields`
--
ALTER TABLE `crm_customfields`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `crm_customfieldsvalues`
--
ALTER TABLE `crm_customfieldsvalues`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT de la tabla `crm_groups`
--
ALTER TABLE `crm_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `crm_industries`
--
ALTER TABLE `crm_industries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `crm_leads`
--
ALTER TABLE `crm_leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `crm_lead_sources`
--
ALTER TABLE `crm_lead_sources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `crm_lead_status`
--
ALTER TABLE `crm_lead_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `crm_salutations`
--
ALTER TABLE `crm_salutations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ib_doc_rel`
--
ALTER TABLE `ib_doc_rel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ib_invoice_access_log`
--
ALTER TABLE `ib_invoice_access_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sys_accounts`
--
ALTER TABLE `sys_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sys_activity`
--
ALTER TABLE `sys_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `sys_api`
--
ALTER TABLE `sys_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sys_appconfig`
--
ALTER TABLE `sys_appconfig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT de la tabla `sys_cart`
--
ALTER TABLE `sys_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sys_cats`
--
ALTER TABLE `sys_cats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `sys_companies`
--
ALTER TABLE `sys_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sys_currencies`
--
ALTER TABLE `sys_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sys_documents`
--
ALTER TABLE `sys_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `sys_emailconfig`
--
ALTER TABLE `sys_emailconfig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sys_email_logs`
--
ALTER TABLE `sys_email_logs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `sys_email_templates`
--
ALTER TABLE `sys_email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `sys_events`
--
ALTER TABLE `sys_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sys_invoiceitems`
--
ALTER TABLE `sys_invoiceitems`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `sys_invoices`
--
ALTER TABLE `sys_invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `sys_items`
--
ALTER TABLE `sys_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `sys_items_old`
--
ALTER TABLE `sys_items_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `sys_item_cats`
--
ALTER TABLE `sys_item_cats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sys_leads`
--
ALTER TABLE `sys_leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sys_logs`
--
ALTER TABLE `sys_logs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

--
-- AUTO_INCREMENT de la tabla `sys_orders`
--
ALTER TABLE `sys_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sys_permissions`
--
ALTER TABLE `sys_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `sys_pg`
--
ALTER TABLE `sys_pg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sys_pl`
--
ALTER TABLE `sys_pl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sys_pmethods`
--
ALTER TABLE `sys_pmethods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `sys_quoteitems`
--
ALTER TABLE `sys_quoteitems`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `sys_quotes`
--
ALTER TABLE `sys_quotes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10005;

--
-- AUTO_INCREMENT de la tabla `sys_recibos`
--
ALTER TABLE `sys_recibos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10006;

--
-- AUTO_INCREMENT de la tabla `sys_recibositems`
--
ALTER TABLE `sys_recibositems`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `sys_remitos`
--
ALTER TABLE `sys_remitos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10007;

--
-- AUTO_INCREMENT de la tabla `sys_remitositems`
--
ALTER TABLE `sys_remitositems`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `sys_roles`
--
ALTER TABLE `sys_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sys_sales`
--
ALTER TABLE `sys_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sys_schedule`
--
ALTER TABLE `sys_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sys_schedulelogs`
--
ALTER TABLE `sys_schedulelogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sys_staffpermissions`
--
ALTER TABLE `sys_staffpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de la tabla `sys_tags`
--
ALTER TABLE `sys_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sys_tasks`
--
ALTER TABLE `sys_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sys_tax`
--
ALTER TABLE `sys_tax`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sys_transactions`
--
ALTER TABLE `sys_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sys_transportes`
--
ALTER TABLE `sys_transportes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT de la tabla `sys_units`
--
ALTER TABLE `sys_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sys_users`
--
ALTER TABLE `sys_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
