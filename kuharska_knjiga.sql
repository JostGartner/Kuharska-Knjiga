-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gostitelj: 127.0.0.1
-- Čas nastanka: 09. mar 2026 ob 17.57
-- Različica strežnika: 10.4.32-MariaDB
-- Različica PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Zbirka podatkov: `kuharska_knjiga`
--

-- --------------------------------------------------------

--
-- Struktura tabele `based_on`
--

CREATE TABLE `based_on` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `sort_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Odloži podatke za tabelo `based_on`
--

INSERT INTO `based_on` (`id`, `recipe_id`, `url`, `sort_order`) VALUES
(6, 45, 'https://okusno.je/recept/cesnov-kruh', 1),
(7, 22, 'https://www.kulinarika.net/recepti/sladice/pecivo/najlepsi-in-najboljsi-krofi-v-sloveniji/12210/', 1);

-- --------------------------------------------------------

--
-- Struktura tabele `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `ingredient` varchar(500) NOT NULL,
  `sort_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Odloži podatke za tabelo `ingredients`
--

INSERT INTO `ingredients` (`id`, `recipe_id`, `ingredient`, `sort_order`) VALUES
(87, 4, '500 g ajdove moke', 1),
(88, 4, '1 l vode', 2),
(89, 4, '1 žlička soli', 3),
(90, 4, '2 žlici masti ali masla', 4),
(91, 5, 'Testo:', 1),
(92, 5, '500 g moke', 2),
(93, 5, '200 ml mleka', 3),
(94, 5, '100 g masla', 4),
(95, 5, '3 rumenjaki', 5),
(96, 5, '1 vrečka suhega kvasa', 6),
(97, 5, '3 žlice sladkorja', 7),
(98, 5, 'ščepec soli', 8),
(99, 5, 'Nadev:', 9),
(100, 5, '400 g mletih orehov', 10),
(101, 5, '150 g sladkorja', 11),
(102, 5, '100 ml smetane', 12),
(103, 5, '1 žlica ruma', 13),
(104, 5, '1 žlička cimeta', 14),
(105, 6, '10 listov filotesta', 1),
(106, 6, 'Skutni nadev: 500 g skute, 2 jajci, 3 žlice sladkorja', 2),
(107, 6, 'Makovi nadev: 200 g mletega maka, 100 g sladkorja, 100 ml mleka', 3),
(108, 6, 'Orehov nadev: 200 g mletih orehov, 100 g sladkorja, 100 ml smetane', 4),
(109, 6, 'Jabolčni nadev: 4 jabolka, 2 žlici sladkorja, cimet', 5),
(110, 6, '100 g masla za mazanje', 6),
(111, 7, '400 g kislega zelja', 1),
(112, 7, '300 g kuhanih fižolovih zrn (ali iz konzerve)', 2),
(113, 7, '200 g dimljene slanine', 3),
(114, 7, '3 stroki česna', 4),
(115, 7, '2 žlici moke', 5),
(116, 7, '2 žlici masti', 6),
(117, 7, 'sol, poper, lovorov list', 7),
(118, 7, '1 l juhe ali vode', 8),
(119, 8, '400 g svinjine (pleče)', 1),
(120, 8, '400 g govedine (plečka)', 2),
(121, 8, '300 g divjačine (jelen ali srna)', 3),
(122, 8, '3 čebule', 4),
(123, 8, '4 stroki česna', 5),
(124, 8, '3 žlice mlete paprike', 6),
(125, 8, '1 dl rdečega vina', 7),
(126, 8, '500 g krompirja', 8),
(127, 8, 'sol, kumina, lovorov list', 9),
(128, 8, '2 žlici masti', 10),
(129, 9, '250 g ječmena', 1),
(130, 9, '200 g suhe svinjske reberce', 2),
(131, 9, '2 korenčka', 3),
(132, 9, '1 koren peteršilja', 4),
(133, 9, '1 čebula', 5),
(134, 9, '2 stroka česna', 6),
(135, 9, '200 g fižola (predhodno namočenega)', 7),
(136, 9, 'sol, poper, lovorov list', 8),
(137, 10, 'Testo: 300 g moke, 2 jajci, sol, voda', 1),
(138, 10, 'Nadev:', 2),
(139, 10, '400 g kuhanega krompirja', 3),
(140, 10, '1 čebula', 4),
(141, 10, '1 žlica masti', 5),
(142, 10, 'sol, poper, majaron', 6),
(143, 10, 'Za postrežbo: ocvirki in kisla smetana', 7),
(144, 11, '4 kranjske klobase', 1),
(145, 11, 'sveže naribanega hrena', 2),
(146, 11, 'gorčica', 3),
(147, 11, 'domač kruh', 4),
(148, 12, 'Testo: 300 g moke, 1 jajce, 1 žlica olja, sol, voda', 1),
(149, 12, 'Nadev: 500 g skute', 2),
(150, 12, '2 jajci', 3),
(151, 12, '3 žlice smetane', 4),
(152, 12, 'sol, peteršilj', 5),
(153, 12, 'maslo za preliv', 6),
(161, 14, '30 g suhih jurčkov', 1),
(162, 14, '300 g svežih šampinjonov', 2),
(163, 14, '1 čebula', 3),
(164, 14, '2 stroka česna', 4),
(165, 14, '1 dl smetane', 5),
(166, 14, '1 l zelenjavne juhe', 6),
(167, 14, '2 žlici masla', 7),
(168, 14, 'sol, poper, timijan', 8),
(169, 15, '200 g fižola (namočenega čez noč)', 1),
(170, 15, '2 krompirja', 2),
(171, 15, '2 korenčka', 3),
(172, 15, '1 koren peteršilja', 4),
(173, 15, '100 g zelja', 5),
(174, 15, '100 g bučk', 6),
(175, 15, '1 čebula', 7),
(176, 15, '100 g testenin (kratki makaroni)', 8),
(177, 15, 'sol, poper, olivno olje', 9),
(178, 16, '500 g kisle repe', 1),
(179, 16, '300 g svinjske glave ali bočnika', 2),
(180, 16, '2 žlici masti', 3),
(181, 16, '2 žlici moke', 4),
(182, 16, '2 stroka česna', 5),
(183, 16, 'sol, poper, kumina', 6),
(184, 16, 'kisla smetana za postrežbo', 7),
(185, 17, '300 g montasio sira ali tolminca', 1),
(186, 17, '3 jajca', 2),
(187, 17, '2 žlici masla', 3),
(188, 17, 'sol, poper', 4),
(189, 18, '500 g kuhanega fižola', 1),
(190, 18, '400 g kuhanega krompirja', 2),
(191, 18, '4 žlice ocvirkov', 3),
(192, 18, 'sol, poper', 4),
(193, 18, 'kisla smetana (po želji)', 5),
(194, 19, '1 l goveje ali svinjske juhe', 1),
(195, 19, '2 dl kisle smetane', 2),
(196, 19, '2 žlici moke', 3),
(197, 19, '1 žlica masti', 4),
(198, 19, 'kis po okusu', 5),
(199, 19, 'sol, poper', 6),
(200, 19, 'trdo kuhana jajca za postrežbo', 7),
(201, 20, '300 g mladih regratovih listov', 1),
(202, 20, '100 g slanine', 2),
(203, 20, '3 žlice kisa', 3),
(204, 20, '2 žlici olja', 4),
(205, 20, 'sol, sladkor', 5),
(206, 20, 'trdo kuhano jajce', 6),
(207, 21, '500 g moke', 1),
(208, 21, '1 vrečka suhega kvasa', 2),
(209, 21, '2 dl mleka', 3),
(210, 21, '100 g masla', 4),
(211, 21, '1 jajce', 5),
(212, 21, '1 žlička soli', 6),
(213, 21, 'sezam in mak za posip', 7),
(224, 23, '300 g moke', 1),
(225, 23, '3 jajca', 2),
(226, 23, '3 žlice sladkorja', 3),
(227, 23, '3 žlice ruma', 4),
(228, 23, '1 žlica limonovega soka', 5),
(229, 23, 'olje za cvrenje', 6),
(230, 23, 'sladkor v prahu', 7),
(231, 24, '200 g moke', 1),
(232, 24, '2 jajci', 2),
(233, 24, '400 ml mleka', 3),
(234, 24, 'ščepec soli', 4),
(235, 24, '1 žlica sladkorja', 5),
(236, 24, 'maslo za pečenje', 6),
(237, 24, 'marmelada, nutela ali sladkor z limonom za polnjenje', 7),
(238, 25, '1 kg kuhanega in pretlačenega krompirja', 1),
(239, 25, '200 g moke', 2),
(240, 25, '1 jajce', 3),
(241, 25, 'sol', 4),
(242, 25, 'ocvirki ali rjavo maslo za postrežbo', 5),
(243, 26, '3 korenčki', 1),
(244, 26, '2 korena peteršilja', 2),
(245, 26, '1 koren zelene', 3),
(246, 26, '1 por', 4),
(247, 26, '2 krompirja', 5),
(248, 26, '1 čebula', 6),
(249, 26, 'lovorov list, sol, poper, peteršiljev list', 7),
(250, 26, '1,5 l vode', 8),
(251, 27, '400 g suhega pisanega fižola', 1),
(252, 27, '1 čebula', 2),
(253, 27, '3 žlice štajerskega bučnega olja', 3),
(254, 27, '2 žlici kisa', 4),
(255, 27, 'sol, poper', 5),
(256, 27, 'svež peteršilj', 6),
(262, 29, '600 g kislega zelja', 1),
(263, 29, '2 kranjski klobasi', 2),
(264, 29, '1 čebula', 3),
(265, 29, '2 žlici masti', 4),
(266, 29, 'kumina, lovorov list', 5),
(267, 29, 'sol, poper', 6),
(268, 30, '1 kg krapa (fileji)', 1),
(269, 30, '2 jajci', 2),
(270, 30, '100 g krušnih drobtin', 3),
(271, 30, '50 g moke', 4),
(272, 30, 'sol, poper', 5),
(273, 30, 'olje za cvrenje', 6),
(274, 30, 'limon za postrežbo', 7),
(275, 31, '1 kg srnečega mesa (plečka)', 1),
(276, 31, '3 čebule', 2),
(277, 31, '2 dl rdečega vina', 3),
(278, 31, '1 dl paradižnikove paste', 4),
(279, 31, '3 žlice maste paprike', 5),
(280, 31, 'brinove jagode, lovorov list, rožmarin', 6),
(281, 31, 'sol, poper', 7),
(282, 31, '2 žlici masti', 8),
(283, 32, '400 g svinjine', 1),
(284, 32, '400 g govedine', 2),
(285, 32, '200 g slanine', 3),
(286, 32, '4 krompirji', 4),
(287, 32, '2 korenčka', 5),
(288, 32, 'kislo zelje', 6),
(289, 32, '2 dl vina', 7),
(290, 32, 'sol, poper, kumina, lovorov list', 8),
(291, 33, '1 kokoš (ok. 1,5 kg)', 1),
(292, 33, '3 korenčki', 2),
(293, 33, '1 koren peteršilja', 3),
(294, 33, '1 por', 4),
(295, 33, '1 korenček zelene', 5),
(296, 33, 'lovorov list, sol, poper', 6),
(297, 33, '2 dl smetane', 7),
(298, 33, '2 žlici moke', 8),
(299, 34, '300 g ajdove moke', 1),
(300, 34, '200 g navadne moke', 2),
(301, 34, '2 jajci', 3),
(302, 34, 'sol, voda', 4),
(303, 34, 'ocvirki ali maslo za postrežbo', 5),
(304, 35, '1 kisla (fermentirana) glava zelja', 1),
(305, 35, '500 g mešanega mletega mesa', 2),
(306, 35, '100 g riža', 3),
(307, 35, '1 čebula', 4),
(308, 35, '2 jajci', 5),
(309, 35, '2 stroka česna', 6),
(310, 35, 'sol, poper, paprika', 7),
(311, 35, '500 g kislega zelja (za podlago)', 8),
(312, 36, '800 g buče hokaido', 1),
(313, 36, '1 čebula', 2),
(314, 36, '2 stroka česna', 3),
(315, 36, '1 dl smetane', 4),
(316, 36, '1 l zelenjavne juhe', 5),
(317, 36, 'sol, poper, muškatni orešček', 6),
(318, 36, 'bučno olje in semena za okras', 7),
(319, 37, '500 g svežega zelja', 1),
(320, 37, '300 g kuhanega fižola', 2),
(321, 37, '1 čebula', 3),
(322, 37, '3 žlice kisa', 4),
(323, 37, '2 žlici olja', 5),
(324, 37, 'sol, kumina', 6),
(325, 38, '400 g skute', 1),
(326, 38, '200 g jagod', 2),
(327, 38, '3 žlice sladkorja', 3),
(328, 38, '1 dl smetane', 4),
(329, 38, 'vanilijev sladkor', 5),
(330, 39, '400 g testenin (fusilli ali penne)', 1),
(331, 39, '400 g šampinjonov ali jurčkov', 2),
(332, 39, '2 stroka česna', 3),
(333, 39, '1 dl smetane', 4),
(334, 39, 'peteršilj', 5),
(335, 39, 'sol, poper, olivno olje', 6),
(336, 39, 'parmezan za posip', 7),
(337, 40, '4 domaće klobase', 1),
(338, 40, 'gorčica', 2),
(339, 40, 'ketchup', 3),
(340, 40, 'domač kruh', 4),
(341, 40, 'hren', 5),
(342, 41, '300 g moke', 1),
(343, 41, '1 jajce', 2),
(344, 41, 'sol, voda', 3),
(345, 41, 'mast ali pečenka (za namakanje)', 4),
(346, 42, '500 g bele moke', 1),
(347, 42, '1 vrečka suhega kvasa', 2),
(348, 42, '1 čajna žlička soli', 3),
(349, 42, '1 čajna žlička sladkorja', 4),
(350, 42, '3 dl tople vode', 5),
(351, 42, '2 žlici olivnega olja', 6),
(352, 43, '400 g bele moke', 1),
(353, 43, '100 g polnozrnate moke', 2),
(354, 43, '1 vrečka suhega kvasa', 3),
(355, 43, '200 g bučnega purée-ja', 4),
(356, 43, '1 dl tople vode', 5),
(357, 43, '1 žlička soli', 6),
(358, 43, 'bučna semena za posip', 7),
(359, 44, '6 listov filotesta', 1),
(360, 44, '1 kg jabolk', 2),
(361, 44, '100 g sladkorja', 3),
(362, 44, '50 g orehov', 4),
(363, 44, '1 žlička cimeta', 5),
(364, 44, '50 g rozin', 6),
(365, 44, '100 g masla', 7),
(366, 44, 'sladkor v prahu', 8),
(372, 46, '800 g svežih ali konzervnih paradižnikov', 1),
(373, 46, '1 čebula', 2),
(374, 46, '3 stroki česna', 3),
(375, 46, '1 dl smetane', 4),
(376, 46, '750 ml zelenjavne juhe', 5),
(377, 46, 'olivno olje, sol, sladkor, bazilika', 6),
(378, 47, '4 jajca', 1),
(379, 47, '2 žlici masti ali masla', 2),
(380, 47, 'sol', 3),
(381, 47, 'domač kruh za postrežbo', 4),
(382, 48, '1 kg jabolk', 1),
(383, 48, '500 ml vode', 2),
(384, 48, '100 g sladkorja', 3),
(385, 48, 'cimet, nageljnove žbice', 4),
(386, 48, 'limonin sok', 5),
(387, 49, '300 g ržene moke', 1),
(388, 49, '200 g polnozrnate pšenične moke', 2),
(389, 49, '1 vrečka kvasa', 3),
(390, 49, '1 žlička soli', 4),
(391, 49, '1 žlična kumina', 5),
(392, 49, '3 dl tople vode', 6),
(393, 50, '4 limone', 1),
(394, 50, '100 g sladkorja', 2),
(395, 50, '1 l vode', 3),
(396, 50, 'led', 4),
(397, 50, 'meta za okras', 5),
(398, 51, '30 cvetov bezga', 1),
(399, 51, '1,5 kg sladkorja', 2),
(400, 51, '1,5 l vode', 3),
(401, 51, '3 limone', 4),
(402, 51, '30 g citronske kisline', 5),
(403, 52, '300 g riža arborio', 1),
(404, 52, '400 g mešanih gob', 2),
(405, 52, '1 čebula', 3),
(406, 52, '2 dl belega vina', 4),
(407, 52, '1 l zelenjavne juhe', 5),
(408, 52, '50 g parmezana', 6),
(409, 52, '30 g masla', 7),
(410, 52, 'olivno olje, sol, poper, timijan', 8),
(411, 53, 'Testo: 500 g moke, kvas, mleko, maslo, jajca, sladkor, sol', 1),
(412, 53, 'Nadev:', 2),
(413, 53, '600 g skute', 3),
(414, 53, '3 jajca', 4),
(415, 53, '150 g sladkorja', 5),
(416, 53, 'vanilijev sladkor', 6),
(417, 53, 'limonina lupinica', 7),
(418, 53, 'rozine (po želji)', 8),
(436, 45, '1 hlebec kruha (bageta ali ciabatta)', 1),
(437, 45, '100 g masla (sobne temperature)', 2),
(438, 45, '6 strokov česna', 3),
(439, 45, 'svež peteršilj', 4),
(440, 45, 'sol', 5),
(441, 22, '500 g moke', 1),
(442, 22, '2 vrečki suhega kvasa', 2),
(443, 22, '200 ml mleka', 3),
(444, 22, '80 g sladkorja', 4),
(445, 22, '3 rumenjaki', 5),
(446, 22, '80 g masla', 6),
(447, 22, 'limonina lupinica', 7),
(448, 22, 'marmelada za polnjenje', 8),
(449, 22, 'sladkor v prahu', 9),
(450, 22, 'olje za cvrenje', 10),
(451, 13, '2 plošči listnatega testa', 1),
(452, 13, '1 l mleka', 2),
(453, 13, '8 rumenjakov', 3),
(454, 13, '200 g sladkorja', 4),
(455, 13, '100 g moke', 5),
(456, 13, '1 l sladke smetane', 6),
(457, 13, 'sladkor v prahu za posip', 7),
(458, 28, '200 g ajdove kaše', 1),
(459, 28, '500 ml mleka', 2),
(460, 28, '1 žlica masla', 3),
(461, 28, 'sol', 4),
(462, 28, 'sladkor ali med po okusu', 5),
(463, 2, 'Testo:', 1),
(464, 2, '500 g pšenične moke', 2),
(465, 2, '1 vrečka suhega kvasa (7 g)', 3),
(466, 2, '1 čajna žlička sladkorja', 4),
(467, 2, '1 čajna žlička soli', 5),
(468, 2, '2 žlici olivnega olja', 6),
(469, 2, '300 ml tople vode', 7),
(470, 2, 'Obloga:', 8),
(471, 2, '200 ml paradižnikove omake', 9),
(472, 2, '200 g naribane mocarele', 10),
(473, 2, '100 g šunke ali salame', 11),
(474, 2, '1 manjša čebula, narezana', 12),
(475, 2, '1 manjša paprika, narezana', 13),
(476, 2, '100 g gob, narezanih', 14),
(477, 2, '1 čajna žlička suhega origana', 15),
(478, 2, '1 čajna žlička suhe bazilike', 16),
(479, 2, '1 žlica olivnega olja', 17);

-- --------------------------------------------------------

--
-- Struktura tabele `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `sort_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Odloži podatke za tabelo `notes`
--

INSERT INTO `notes` (`id`, `recipe_id`, `note`, `sort_order`) VALUES
(13, 4, 'Tradicinalno se jé z ocvirki ali zaseko.', 1),
(14, 5, 'Potica je najboljša naslednji dan.', 1),
(15, 5, 'Lahko dodamo tudi rozine ali limonino lupinico.', 2),
(16, 6, 'Zaščitena jed s statusom zajamčene tradicionalne posebnosti (ZTP).', 1),
(17, 7, 'Jota je naslednji dan še boljša.', 1),
(18, 7, 'Primorska različica, na Gorenjskem dodajajo repo.', 2),
(19, 8, 'Tradicionalno se kuha v kotlu na prostem.', 1),
(20, 8, 'Prekmurska jed, vsaka vas ima svojo različico.', 2),
(21, 9, 'Ena od najstarejših slovenskih jedi.', 1),
(22, 10, 'Zaščitena geografska označba (ZGO).', 1),
(23, 11, 'Klobase nikoli ne vrejmo – koža poči.', 1),
(24, 11, 'Zaščitena geografska označba.', 2),
(25, 12, 'Sladka različica: dodamo sladkor in vanilijo v nadev.', 1),
(27, 15, 'Primorska zelenjavna juha, doma se doda kar je sezonsko.', 1),
(28, 17, 'Kmečka jed iz Bovškega in Tolminskega.', 1),
(29, 18, 'Tradicionalna gorenjska jed.', 1),
(30, 19, 'Tradicionalno se je jedla za Pustom.', 1),
(31, 20, 'Spomladi, ko je regrat mlad, je najboljša.', 1),
(32, 21, 'Zaščitena geografska označba.', 1),
(35, 23, 'Pustna sladica, znana po vsej Sloveniji.', 1),
(36, 25, 'Krompir mora biti suhe sorte (npr. Kennebec).', 1),
(37, 27, 'Štajersko bučno olje je zaščiteno z ZOP.', 1),
(38, 30, 'Štajerska jed, pogosta ob Dravi in Muri.', 1),
(39, 31, 'Meso pred kuhanjem mariniramo, da omehčamo vlakna.', 1),
(40, 33, 'Ena najstarejših slovenskih jedi, vsaka babica ima svojo različico.', 1),
(41, 35, 'Sarma je naslednji dan boljša.', 1),
(42, 41, 'Klasična hrvaška/prekmurska priloga k pečenki.', 1),
(43, 42, 'V pečico postavimo posodico z vodo za hrustljavo skorjo.', 1),
(44, 47, 'Preprosta kmečka jed – praženec je scrambled eggs po slovensko.', 1),
(45, 49, 'Ržen kruh je gostejši in bolj sit kot beli.', 1),
(46, 51, 'Naberemo svežo cvetje spomladi (maj–junij).', 1),
(47, 52, 'Rižoto vedno kuhamo na vročini in jo neprestano mešamo.', 1),
(48, 53, 'Skutina potica je bolj vlažna in nežna od orehove.', 1),
(49, 53, 'Odlična za velikonočno mizo.', 2),
(51, 22, 'Pravi krofi se ne pečejo – cvrejo!', 1),
(52, 22, 'Najboljši za Pustni torek.', 2),
(53, 13, 'Originalna blejska kremšnita ima razmerje krema:smetana = 1:1.', 1),
(54, 2, 'noro dobra :)', 1);

-- --------------------------------------------------------

--
-- Struktura tabele `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `time_text` varchar(100) DEFAULT NULL,
  `makes_text` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Odloži podatke za tabelo `recipes`
--

INSERT INTO `recipes` (`id`, `slug`, `title`, `time_text`, `makes_text`, `created_at`, `updated_at`) VALUES
(2, 'doma-a-pizza', 'Domača pizza', '1 ura', '5 porcij', '2026-03-05 11:48:06', '2026-03-09 16:57:09'),
(4, 'ajdovi-zganci', 'Ajdovi žganci', '20 minut', '4 porcije', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(5, 'orehova-potica', 'Orehova potica', '3 ure', '1 potičnik', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(6, 'prekmurska-gibanica', 'Prekmurska gibanica', '2 uri', '1 pekač', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(7, 'jota', 'Jota', '1 ura 30 minut', '6 porcij', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(8, 'bograc', 'Bograč', '2 uri 30 minut', '8 porcij', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(9, 'ricet', 'Ričet', '1 ura 30 minut', '6 porcij', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(10, 'idrijski-zlikrofi', 'Idrijski žlikrofi', '1 ura', '4 porcije', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(11, 'kranjska-klobasa', 'Kranjska klobasa s hrenom', '20 minut', '4 porcije', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(12, 'skutni-struklji', 'Skutni štruklji', '1 ura', '6 porcij', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(13, 'kremsnita', 'Blejska Kremšnita', '1 ura + hlajenje', '12 kosov', '2026-03-09 16:49:04', '2026-03-09 16:53:52'),
(14, 'gobova-juha', 'Gobova juha', '45 minut', '4 porcije', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(15, 'minestra', 'Mineštra', '1 ura', '6 porcij', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(16, 'bujta-repa', 'Prekmurska bujta repa', '2 uri', '6 porcij', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(17, 'frika', 'Frika', '30 minut', '2 porciji', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(18, 'matevz', 'Matevž', '40 minut', '4 porcije', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(19, 'kisla-juha', 'Kisla juha', '30 minut', '4 porcije', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(20, 'regratova-solata', 'Regratova solata', '15 minut', '4 porcije', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(21, 'belokranjska-pogaca', 'Belokranjska pogača', '1 ura 30 minut', '1 pogača', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(22, 'krofi', 'Krofi', '2 uri', '20 krofov', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(23, 'flancati', 'Flancati', '45 minut', '30 kosov', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(24, 'palacinke', 'Palačinke', '30 minut', '8 palačink', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(25, 'krompirjevi-cmoki', 'Krompirjevi cmoki', '1 ura', '4 porcije', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(26, 'zelenjavna-juha', 'Zelenjavna juha', '50 minut', '6 porcij', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(27, 'pisani-fizol', 'Pisani fižol z bučnim oljem', '1 ura (+ namakanje)', '4 porcije', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(28, 'ajdova-kasa-z-mlekom', 'Ajdova kaša z mlekom', '25 minut', '2 porciji', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(29, 'kislo-zelje-s-klobaso', 'Kislo zelje s klobaso', '40 minut', '4 porcije', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(30, 'ocvrti-krap', 'Ocvrti krap', '30 minut', '4 porcije', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(31, 'srneci-golaz', 'Srneči golaž', '2 uri', '6 porcij', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(32, 'pohorski-lonec', 'Pohorski lonec', '2 uri', '6 porcij', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(33, 'kokosja-obara', 'Kokošja obara', '1 ura 30 minut', '6 porcij', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(34, 'ajdovi-svaljki', 'Ajdovi svaljki', '40 minut', '4 porcije', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(35, 'sarma', 'Sarma', '2 uri', '6 porcij', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(36, 'bucna-juha', 'Bučna juha', '45 minut', '4 porcije', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(37, 'zelje-s-fizolom', 'Zelje s fižolom', '1 ura', '4 porcije', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(38, 'skuta-z-jagodami', 'Skuta z jagodami', '10 minut', '2 porciji', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(39, 'testenine-z-gobami', 'Testenine z gobami', '30 minut', '4 porcije', '2026-03-09 16:49:04', '2026-03-09 16:49:04'),
(40, 'klobasa-na-zaru', 'Klobasa na žaru', '20 minut', '4 porcije', '2026-03-09 16:49:05', '2026-03-09 16:49:05'),
(41, 'mlinci', 'Mlinci', '40 minut', '4 porcije', '2026-03-09 16:49:05', '2026-03-09 16:49:05'),
(42, 'domaci-beli-kruh', 'Domači beli kruh', '2 uri', '1 hlebec', '2026-03-09 16:49:05', '2026-03-09 16:49:05'),
(43, 'bucni-kruh', 'Bučni kruh', '2 uri', '1 hlebec', '2026-03-09 16:49:05', '2026-03-09 16:49:05'),
(44, 'jablocni-zavitek', 'Jabolčni zavitek (Štrudel)', '1 ura', '8 kosov', '2026-03-09 16:49:05', '2026-03-09 16:49:05'),
(45, 'cesnov-kruh', 'Česnov kruh', '30 minut', '4 porcije', '2026-03-09 16:49:05', '2026-03-09 16:49:05'),
(46, 'paradiznikova-juha', 'Paradižnikova juha', '40 minut', '4 porcije', '2026-03-09 16:49:05', '2026-03-09 16:49:05'),
(47, 'prazenec', 'Praženec', '20 minut', '2 porciji', '2026-03-09 16:49:05', '2026-03-09 16:49:05'),
(48, 'jablocni-kompot', 'Jabolčni kompot', '20 minut', '4 porcije', '2026-03-09 16:49:05', '2026-03-09 16:49:05'),
(49, 'rzeni-kruh', 'Rženi kruh', '3 ure', '1 hlebec', '2026-03-09 16:49:05', '2026-03-09 16:49:05'),
(50, 'domaca-limonada', 'Domača limonada', '10 minut', '1 l', '2026-03-09 16:49:05', '2026-03-09 16:49:05'),
(51, 'bezgov-sirup', 'Bezgov sirup', '24 ur', '2 l sirupa', '2026-03-09 16:49:05', '2026-03-09 16:49:05'),
(52, 'gobova-rizota', 'Gobova rižota', '40 minut', '4 porcije', '2026-03-09 16:49:05', '2026-03-09 16:49:05'),
(53, 'skutina-potica', 'Skutina potica', '2 uri 30 minut', '1 potičnik', '2026-03-09 16:49:05', '2026-03-09 16:49:05');

-- --------------------------------------------------------

--
-- Struktura tabele `steps`
--

CREATE TABLE `steps` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `step` text NOT NULL,
  `sort_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Odloži podatke za tabelo `steps`
--

INSERT INTO `steps` (`id`, `recipe_id`, `step`, `sort_order`) VALUES
(59, 4, 'V loncu zavremo slano vodo.', 1),
(60, 4, 'Dodamo ajdovo moko in mešamo z leseno žlico, dokler ne nastane gosta masa.', 2),
(61, 4, 'Na majhnem ognju kuhamo še 10 minut, občasno premešamo.', 3),
(62, 4, 'Postrežemo z ocvirki, mlekom ali kislo smetano.', 4),
(63, 5, 'Kvas raztopimo v toplem mleku s sladkorjem, pustimo 10 minut.', 1),
(64, 5, 'Umesimo mehko testo in ga vzhajamo 1 uro.', 2),
(65, 5, 'Orehe zmešamo s sladkorjem, smetano, rumom in cimetom.', 3),
(66, 5, 'Testo razvaljamo v pravokotnik, nadenemo nadev in zvijemo v rolado.', 4),
(67, 5, 'Položimo v namaščen model in pustimo vzhajati še 30 minut.', 5),
(68, 5, 'Pečemo pri 180 °C približno 50 minut.', 6),
(69, 6, 'Pekač namastimo in položimo 2 lista filotesta.', 1),
(70, 6, 'Nanesemo skutni nadev, pokrijemo z 2 listoma testa.', 2),
(71, 6, 'Nanesemo makovi nadev, pokrijemo z listoma testa.', 3),
(72, 6, 'Nanesemo orehov nadev, pokrijemo z listoma testa.', 4),
(73, 6, 'Nanesemo jabolčni nadev in pokrijemo s preostalima listoma.', 5),
(74, 6, 'Vrh premažemo z maslom in pečemo pri 200 °C 40 minut.', 6),
(75, 7, 'Slanino narežemo na kocke in prepražimo na masti.', 1),
(76, 7, 'Dodamo sesekljan česen in kislo zelje, dušimo 5 minut.', 2),
(77, 7, 'Dodamo fižol, juho in lovorov list. Kuhamo 45 minut.', 3),
(78, 7, 'Na masti zarumenimo moko (zaprška), dodamo v joto.', 4),
(79, 7, 'Začinimo s soljo in poprom, kuhamo še 15 minut.', 5),
(80, 8, 'Čebulo narežemo in prepražimo na masti do zlato rjave barve.', 1),
(81, 8, 'Dodamo vso meso narezano na kocke, popečemo.', 2),
(82, 8, 'Potresemo mleto papriko, zalijemo z vinom.', 3),
(83, 8, 'Dodamo česen, začimbe in toliko vode, da pokrije meso.', 4),
(84, 8, 'Dušimo 1,5 ure na majhnem ognju.', 5),
(85, 8, 'Dodamo krompir in kuhamo še 30 minut.', 6),
(86, 9, 'Reberce kuhamo 30 minut, juho ohranimo.', 1),
(87, 9, 'V juho dodamo ječmen in namočen fižol.', 2),
(88, 9, 'Dodamo zelenjavo in začimbe, kuhamo 45 minut.', 3),
(89, 9, 'Meso odkoščičimo in vrnemo v lonec.', 4),
(90, 9, 'Posolimo in popramo po okusu.', 5),
(91, 10, 'Umesimo testo, zavijemo v folijo in pustimo počivati 30 minut.', 1),
(92, 10, 'Čebulo prepražimo na masti, dodamo pretlačen krompir in začimbe.', 2),
(93, 10, 'Testo tanko razvaljamo in narežemo na kvadrate.', 3),
(94, 10, 'Na vsak kvadrat damo žličko nadeva in zapremo v obliko pokrovčka.', 4),
(95, 10, 'Kuhamo v slani vodi 8–10 minut.', 5),
(96, 10, 'Postrežemo z ocvirki in kislo smetano.', 6),
(97, 11, 'Klobase položimo v hladno vodo in počasi segrevamo (ne vremo!).', 1),
(98, 11, 'Ko voda doseže ~80 °C, kuhamo 15 minut.', 2),
(99, 11, 'Postrežemo z hrenom, gorčico in kruhom.', 3),
(100, 12, 'Umesimo mehko testo in ga pustimo počivati 20 minut.', 1),
(101, 12, 'Skuto zmešamo z jajci, smetano, soljo in peteršiljem.', 2),
(102, 12, 'Testo razvaljamo, enakomerno nadenemo nadev.', 3),
(103, 12, 'Zvijemo v rolado, ovijemo v krpo in kuhamo v slani vodi 40 minut.', 4),
(104, 12, 'Narezamo na rezine in prelijemo z rjavim maslom.', 5),
(111, 14, 'Suhe jurčke namočimo v topli vodi 30 minut.', 1),
(112, 14, 'Čebulo in česen prepražimo na maslu.', 2),
(113, 14, 'Dodamo sveže gobe in dušimo 10 minut.', 3),
(114, 14, 'Dodamo jurčke z vodo za namakanje in zelenjavno juho.', 4),
(115, 14, 'Kuhamo 20 minut, na koncu dodamo smetano.', 5),
(116, 14, 'Po želji zmeljemo z ročnim mešalnikom.', 6),
(117, 15, 'Fižol kuhamo 30 minut v sveži vodi.', 1),
(118, 15, 'Dodamo vse zelenjave narezane na kocke.', 2),
(119, 15, 'Kuhamo 20 minut, dodamo testenine.', 3),
(120, 15, 'Kuhamo še 10 minut, začinimo.', 4),
(121, 15, 'Postrežemo z nitjo olivnega olja.', 5),
(122, 16, 'Meso kuhamo 1 uro v vodi s soljo.', 1),
(123, 16, 'Kislo repo dodamo k mesu in kuhamo še 30 minut.', 2),
(124, 16, 'Naredimo zaprško: mast, moka in česen.', 3),
(125, 16, 'Zaprško vmešamo v repo, kuhamo 15 minut.', 4),
(126, 16, 'Postrežemo s kislo smetano.', 5),
(127, 17, 'Sir naribamo ali narežemo na tanke rezine.', 1),
(128, 17, 'Na maslu stopimo sir do zlatordečkaste hrustljave skorjice.', 2),
(129, 17, 'Prelijemo z raztepenimi jajci.', 3),
(130, 17, 'Dušimo, dokler se jajca ne strdijo.', 4),
(131, 17, 'Obrnemo in spečemo še na drugi strani.', 5),
(132, 18, 'Fižol in krompir skupaj pretlačimo.', 1),
(133, 18, 'Začinimo s soljo in poprom.', 2),
(134, 18, 'Postrežemo z ocvirki in kislo smetano.', 3),
(135, 19, 'Na masti zarumenimo moko.', 1),
(136, 19, 'Postopoma dodajamo juho in mešamo.', 2),
(137, 19, 'Vmešamo kislo smetano.', 3),
(138, 19, 'Začinimo s kisom, soljo in poprom.', 4),
(139, 19, 'Postrežemo z narezanim jajcem.', 5),
(140, 20, 'Regrat operemo in odcedimo.', 1),
(141, 20, 'Slanino narežemo in prepražimo do hrustljavosti.', 2),
(142, 20, 'Zalijemo s kisom in oljem, takoj prelijemo po solati.', 3),
(143, 20, 'Postrežemo z narezanim jajcem.', 4),
(144, 21, 'Kvas raztopimo v toplem mleku.', 1),
(145, 21, 'Zmešamo vse sestavine in umesimo testo.', 2),
(146, 21, 'Pustimo vzhajati 1 uro.', 3),
(147, 21, 'Testo razvaljamo in preložimo na pekač.', 4),
(148, 21, 'Premažemo z jajcem in posujemo s sezamom ali makom.', 5),
(149, 21, 'Pečemo pri 200 °C 25 minut.', 6),
(156, 23, 'Zmešamo moko, jajca, sladkor, rum in limonov sok.', 1),
(157, 23, 'Umesimo testo, pustimo počivati 30 minut.', 2),
(158, 23, 'Tanko razvaljamo in narežemo na pasove z valovitim nožem.', 3),
(159, 23, 'Cvremo na 170 °C do zlatordečkaste barve.', 4),
(160, 23, 'Posujemo s sladkorjem v prahu.', 5),
(161, 24, 'Zmešamo moko, jajca, mleko, sol in sladkor v gladko testo.', 1),
(162, 24, 'Pustimo počivati 15 minut.', 2),
(163, 24, 'Na segreti ponvi z malo masla spečemo tanke palačinke.', 3),
(164, 24, 'Nadevamo po okusu in zvijemo.', 4),
(165, 25, 'Topel pretlačen krompir zmešamo z moko, jajcem in soljo.', 1),
(166, 25, 'Oblikujemo kroglice velikosti oreha.', 2),
(167, 25, 'Kuhamo v slani vodi 10–12 minut (ko priplavajo, so kuhani).', 3),
(168, 25, 'Postrežemo z ocvirki ali rjavim maslom.', 4),
(169, 26, 'Zelenjavo narežemo na koščke in damo v lonec z vodo.', 1),
(170, 26, 'Dodamo začimbe in kuhamo 40 minut.', 2),
(171, 26, 'Precedimo ali postrežemo s koščki zelenjave.', 3),
(172, 26, 'Potresemo s svežim peteršiljem.', 4),
(173, 27, 'Fižol namočimo čez noč, naslednji dan skuhamo do mehkobe (45–60 min).', 1),
(174, 27, 'Odcedimo in pustimo ohladiti.', 2),
(175, 27, 'Zmešamo z drobno narezano čebulo, bučnim oljem, kisom, soljo in poprom.', 3),
(176, 27, 'Potresemo s peteršiljem in postrežemo.', 4),
(181, 29, 'Čebulo prepražimo na masti.', 1),
(182, 29, 'Dodamo kislo zelje, kumino in lovorov list.', 2),
(183, 29, 'Dušimo 20 minut.', 3),
(184, 29, 'Dodamo narezano klobaso in kuhamo še 15 minut.', 4),
(185, 29, 'Začinimo in postrežemo s kruhom ali krompirjem.', 5),
(186, 30, 'Fileji ribe osušimo, posolimo in popramo.', 1),
(187, 30, 'Povaljamo v moki, pomočimo v jajce, povaljamo v drobtinah.', 2),
(188, 30, 'Cvremo na 180 °C 5–6 minut na vsako stran.', 3),
(189, 30, 'Postrežemo z limono in tatarsko omako.', 4),
(190, 31, 'Meso narežemo na kocke in mariniramo v vinu čez noč.', 1),
(191, 31, 'Čebulo prepražimo na masti do zlatordečkaste barve.', 2),
(192, 31, 'Dodamo meso in popečemo.', 3),
(193, 31, 'Dodamo paradižnikovo pasto, papriko in začimbe.', 4),
(194, 31, 'Zalijemo z marinado in kuhamo 1,5 ure.', 5),
(195, 31, 'Postrežemo z žganci ali krompirjem.', 6),
(196, 32, 'Vse meso narežemo in popečemo.', 1),
(197, 32, 'Dodamo zelenjavo in začimbe.', 2),
(198, 32, 'Zalijemo z vinom in vodo.', 3),
(199, 32, 'Dušimo v loncu z pokrovom 1,5 ure.', 4),
(200, 32, 'Postrežemo v loncu ali posodi.', 5),
(201, 33, 'Kokoš damo v hladno vodo in počasi segrevamo.', 1),
(202, 33, 'Odstranjujemo peno.', 2),
(203, 33, 'Dodamo zelenjavo in kuhamo 1 uro.', 3),
(204, 33, 'Meso odkoščičimo in vrnemo v juho.', 4),
(205, 33, 'Naredimo zaprško in vmešamo smetano.', 5),
(206, 33, 'Postrežemo s krompirjem ali testeninami.', 6),
(207, 34, 'Zmešamo obe vrsti moke, jajca, sol in toliko vode za testo.', 1),
(208, 34, 'Testo stisnemo skozi sito z večjimi luknjami ali ribamo v vodo.', 2),
(209, 34, 'Kuhamo v slani vodi 8 minut.', 3),
(210, 34, 'Odcedimo in postrežemo z ocvirki.', 4),
(211, 35, 'Listom zelja odstranjujemo trdna rebra.', 1),
(212, 35, 'Meso zmešamo z rižem, jajci, čebulo in začimbami.', 2),
(213, 35, 'Na vsak list damo žlico nadeva in zavijemo.', 3),
(214, 35, 'Polagamo v lonec na posteljo kislega zelja.', 4),
(215, 35, 'Zalijemo z vodo in kuhamo 1,5 ure.', 5),
(216, 36, 'Bučo olupimo in narežemo na kocke.', 1),
(217, 36, 'Čebulo in česen prepražimo na olju.', 2),
(218, 36, 'Dodamo bučo in juho, kuhamo 25 minut.', 3),
(219, 36, 'Zmiksamo, dodamo smetano in začinimo.', 4),
(220, 36, 'Okrasimo z bučnim oljem in semeni.', 5),
(221, 37, 'Zelje drobno narežemo in skuhamo.', 1),
(222, 37, 'Čebulo prepražimo.', 2),
(223, 37, 'Zmešamo zelje, fižol in čebulo.', 3),
(224, 37, 'Začinimo s kisom, oljem, soljo in kumino.', 4),
(225, 38, 'Jagode operemo in narežemo na četrtine, posujemo s sladkorjem.', 1),
(226, 38, 'Skuto zmešamo s stepeno smetano in vanilijevim sladkorjem.', 2),
(227, 38, 'Postrežemo skuto z jagodami.', 3),
(228, 39, 'Testenine skuhamo al dente.', 1),
(229, 39, 'Česen prepražimo na olivnem olju.', 2),
(230, 39, 'Dodamo gobe narezane na rezine, dušimo 10 minut.', 3),
(231, 39, 'Dodamo smetano in peteršilj.', 4),
(232, 39, 'Zmešamo s testeninami, posujemo s parmezanom.', 5),
(233, 40, 'Žar segrejemo na visoko temperaturo.', 1),
(234, 40, 'Klobase zarežemo po dolžini (ne do konca).', 2),
(235, 40, 'Pečemo 8–10 minut, obračamo.', 3),
(236, 40, 'Postrežemo z gorčico, hrenom in kruhom.', 4),
(237, 41, 'Umesimo trše testo iz moke, jajca, soli in vode.', 1),
(238, 41, 'Razvaljamo na 2 mm debeline.', 2),
(239, 41, 'Pečemo v suhi ponvi ali pečici do zlatordečkaste.', 3),
(240, 41, 'Pokrhane mlinče naložimo v posodo.', 4),
(241, 41, 'Prelijemo z vrelo slano vodo ali pečenino pečenko.', 5),
(242, 41, 'Namočene postrežemo takoj.', 6),
(243, 42, 'Kvas, sladkor in vodo zmešamo, pustimo 10 minut.', 1),
(244, 42, 'Dodamo moko, sol in olje. Gnetemo 10 minut.', 2),
(245, 42, 'Pokrijemo in pustimo vzhajati 1 uro.', 3),
(246, 42, 'Oblikujemo hlebec, položimo v model.', 4),
(247, 42, 'Vzhajamo še 30 minut.', 5),
(248, 42, 'Pečemo pri 220 °C 30 minut.', 6),
(249, 43, 'Bučo spečemo, pretlačimo.', 1),
(250, 43, 'Zmešamo vse sestavine razen semen.', 2),
(251, 43, 'Gnetemo 10 minut, vzhajamo 1 uro.', 3),
(252, 43, 'Oblikujemo, posujemo s semeni.', 4),
(253, 43, 'Pečemo pri 200 °C 35 minut.', 5),
(254, 44, 'Jabolka olupimo in naribamo ali narežemo na tanke rezine.', 1),
(255, 44, 'Zmešamo z sladkorjem, cimetom, orehi in rozinami.', 2),
(256, 44, 'Liste filotesta zlagamo in mazamo z maslom.', 3),
(257, 44, 'Nadenemo nadev in zavijemo v rolado.', 4),
(258, 44, 'Premažemo z maslom in pečemo pri 190 °C 30 minut.', 5),
(259, 44, 'Posujemo s sladkorjem v prahu.', 6),
(265, 46, 'Čebulo in česen prepražimo na olivnem olju.', 1),
(266, 46, 'Dodamo paradižnike in dušimo 15 minut.', 2),
(267, 46, 'Zalijemo z juho in kuhamo 15 minut.', 3),
(268, 46, 'Zmiksamo in precedimo.', 4),
(269, 46, 'Dodamo smetano, začinimo.', 5),
(270, 46, 'Postrežemo z bazilikini listi.', 6),
(271, 47, 'Na masti segrejemo ponev.', 1),
(272, 47, 'Rozbijemo jajca in mešamo.', 2),
(273, 47, 'Solimo in kuhamo do želene stopnje.', 3),
(274, 47, 'Postrežemo z domačim kruhom.', 4),
(275, 48, 'Jabolka olupimo, razkoščičimo in narežemo.', 1),
(276, 48, 'Vodo s sladkorjem in začimbami zavremo.', 2),
(277, 48, 'Dodamo jabolka in kuhamo 10 minut.', 3),
(278, 48, 'Ohladimo in shranimo v hladilnik.', 4),
(279, 49, 'Vse zmešamo in gnetemo 8 minut.', 1),
(280, 49, 'Vzhajamo 1,5 ure.', 2),
(281, 49, 'Oblikujemo hlebec, vzhajamo še 30 minut.', 3),
(282, 49, 'Pečemo pri 230 °C 35 minut.', 4),
(283, 50, 'Iz limon stisnemo sok.', 1),
(284, 50, 'Sladkor raztopimo v decilitru tople vode.', 2),
(285, 50, 'Zmešamo limonin sok, sirup in hladno vodo.', 3),
(286, 50, 'Postrežemo z ledom in listi mete.', 4),
(287, 51, 'Bezgove cvete stresemo v veliko posodo.', 1),
(288, 51, 'Dodamo narezane limone in citronsko kislino.', 2),
(289, 51, 'Zalijemo s sladkorno vodo in pustimo stati 24 ur.', 3),
(290, 51, 'Precedimo in polijemo v steklenice.', 4),
(291, 51, 'Pasteriziramo 15 minut ali shranjujemo v hladilniku.', 5),
(292, 52, 'Čebulo prepražimo na olivnem olju.', 1),
(293, 52, 'Dodamo gobe in dušimo 8 minut.', 2),
(294, 52, 'Dodamo riž in prepražimo 2 minuti.', 3),
(295, 52, 'Zalijemo z vinom in kuhamo, dokler ne izhlapi.', 4),
(296, 52, 'Postopoma dodajamo juho, žlico za žlico, 20 minut.', 5),
(297, 52, 'Na koncu vmešamo maslo in parmezan.', 6),
(298, 53, 'Umesimo kvašeno testo in pustimo vzhajati 1 uro.', 1),
(299, 53, 'Skuto zmešamo z jajci, sladkorjem in aromami.', 2),
(300, 53, 'Testo razvaljamo, nadenemo skutni nadev.', 3),
(301, 53, 'Zvijemo, položimo v namaščen model.', 4),
(302, 53, 'Vzhajamo 30 minut, pečemo 50 minut pri 175 °C.', 5),
(313, 45, 'Kruh narežemo na rezine (ne do konca).', 1),
(314, 45, 'Maslo zmešamo s strtim česnom in sesekljanim peteršiljem.', 2),
(315, 45, 'Med vsako rezino natremo česnovo maslo.', 3),
(316, 45, 'Zavijemo v aluminijasto folijo.', 4),
(317, 45, 'Pečemo pri 200 °C 15 minut, zadnjih 5 minut odpremo folijo.', 5),
(318, 22, 'Kvas aktiviramo v toplem mleku s sladkorjem.', 1),
(319, 22, 'Umesimo mehko testo in pustimo vzhajati 1 uro.', 2),
(320, 22, 'Oblikujemo kroglice, pustimo vzhajati še 30 minut.', 3),
(321, 22, 'Cvremo na 170 °C do zlatordečkaste barve, obračamo.', 4),
(322, 22, 'Ohlajene polnimo z marmelado s pomočjo brizgalke.', 5),
(323, 22, 'Posujemo s sladkorjem v prahu.', 6),
(324, 13, 'Listnato testo spečemo pri 200 °C do zlatordečkaste barve.', 1),
(325, 13, 'Rumenjakovo kremo skuhamo: rumenjake, sladkor in moko zmešamo z delom mleka, nato vlijemo v vrelo mleko in mešamo do zgostitve.', 2),
(326, 13, 'Ohladimo, pokrijemo s folijo (na stiku s kremo).', 3),
(327, 13, 'Stepemo sladko smetano do trdote.', 4),
(328, 13, 'Na plast testa damo kremo, nato stepeno smetano, pokrijemo z drugo plastjo testa.', 5),
(329, 13, 'Ohladimo vsaj 2 uri, narežemo in posujemo s sladkorjem v prahu.', 6),
(330, 28, 'Kašo prepražimo na suhi ponvi do vonjave.', 1),
(331, 28, 'Zalijemo z vročim mlekom, dodamo maslo in sol.', 2),
(332, 28, 'Kuhamo 15 minut na majhnem ognju, občasno premešamo.', 3),
(333, 28, 'Postrežemo s sladkorjem ali medom.', 4),
(334, 2, 'V skledi zmešajte toplo vodo, sladkor in suhi kvas. Pustite približno 5 minut, da se začne peniti.', 1),
(335, 2, 'Dodajte moko, sol in olivno olje. Zmešajte in gnetite, dokler ne dobite gladkega testa.', 2),
(336, 2, 'Testo pokrijte in ga pustite vzhajati na toplem približno 30 minut.', 3),
(337, 2, 'Pečico segrejte na 220 °C.', 4),
(338, 2, 'Testo razvaljajte na pomokani površini v obliko kroga za pico.', 5),
(339, 2, 'Testo položite na pekač, obložen s papirjem za peko.', 6),
(340, 2, 'Po testu enakomerno razporedite paradižnikovo omako.', 7),
(341, 2, 'Dodajte mocarelo, šunko ali salamo, čebulo, papriko in gobe.', 8),
(342, 2, 'Po vrhu potresite origano in baziliko ter pokapajte z olivnim oljem.', 9),
(343, 2, 'Pecite približno 12–15 minut, dokler rob pice ne postane zlato rjav in se sir stopi.', 10);

--
-- Indeksi zavrženih tabel
--

--
-- Indeksi tabele `based_on`
--
ALTER TABLE `based_on`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indeksi tabele `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indeksi tabele `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indeksi tabele `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indeksi tabele `steps`
--
ALTER TABLE `steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- AUTO_INCREMENT zavrženih tabel
--

--
-- AUTO_INCREMENT tabele `based_on`
--
ALTER TABLE `based_on`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT tabele `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=480;

--
-- AUTO_INCREMENT tabele `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT tabele `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT tabele `steps`
--
ALTER TABLE `steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- Omejitve tabel za povzetek stanja
--

--
-- Omejitve za tabelo `based_on`
--
ALTER TABLE `based_on`
  ADD CONSTRAINT `based_on_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;

--
-- Omejitve za tabelo `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;

--
-- Omejitve za tabelo `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;

--
-- Omejitve za tabelo `steps`
--
ALTER TABLE `steps`
  ADD CONSTRAINT `steps_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
