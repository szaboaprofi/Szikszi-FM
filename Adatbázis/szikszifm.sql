-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Ápr 16. 18:35
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `szikszifm`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `dalok`
--

CREATE TABLE `dalok` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `eloado` varchar(255) NOT NULL,
  `cim` varchar(255) NOT NULL,
  `hossza` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `dalok`
--

INSERT INTO `dalok` (`id`, `eloado`, `cim`, `hossza`) VALUES
(1, 'Queen', 'Bohemian Rhapsody', '00:05:55'),
(2, 'Metallica', 'Nothing Else Matters', '00:06:28'),
(3, 'Coldplay', 'Fix You', '00:04:55'),
(4, 'Adele', 'Someone Like You', '00:04:45'),
(5, 'Daft Punk', 'Get Lucky', '00:06:07'),
(6, 'Pink Floyd', 'Wish You Were Here', '00:05:34'),
(7, 'Nirvana', 'Come As You Are', '00:03:39'),
(8, 'The Beatles', 'Let It Be', '00:04:03'),
(9, 'U2', 'Beautiful Day', '00:04:08'),
(10, 'Red Hot Chili Peppers', 'Under The Bridge', '00:04:24'),
(11, 'Imagine Dragons', 'Radioactive', '00:03:06'),
(12, 'AC/DC', 'Highway to Hell', '00:03:28'),
(13, 'Eminem', 'Stan', '00:06:44'),
(14, 'Madonna', 'Frozen', '00:06:12'),
(15, 'Linkin Park', 'In The End', '00:03:36'),
(16, 'Hans Zimmer', 'Time', '00:04:35'),
(17, 'Lana Del Rey', 'Video Games', '00:04:42'),
(18, 'Depeche Mode', 'Enjoy the Silence', '00:04:15'),
(19, 'Radiohead', 'No Surprises', '00:03:49'),
(20, 'Bon Jovi', 'Always', '00:05:53'),
(21, 'Arctic Monkeys', 'Do I Wanna Know?', '00:04:32'),
(22, 'Billie Eilish', 'bad guy', '00:03:14'),
(23, 'The Weeknd', 'Blinding Lights', '00:03:20'),
(24, 'Bruno Mars', 'Uptown Funk', '00:04:30'),
(25, 'Ed Sheeran', 'Shape of You', '00:03:53'),
(26, 'Post Malone', 'Circles', '00:03:35'),
(27, 'Taylor Swift', 'Blank Space', '00:03:51'),
(28, 'Dua Lipa', 'Levitating', '00:03:23'),
(29, 'Shawn Mendes', 'Stitches', '00:03:26'),
(30, 'Sam Smith', 'Stay With Me', '00:02:52'),
(31, 'Kanye West', 'Stronger', '00:05:12'),
(32, 'Drake', 'God\'s Plan', '00:03:18'),
(33, 'Travis Scott', 'SICKO MODE', '00:05:12'),
(34, 'Jay-Z', 'Empire State of Mind', '00:04:36'),
(35, 'Rihanna', 'Diamonds', '00:03:45'),
(36, 'Sia', 'Chandelier', '00:03:36'),
(37, 'Lady Gaga', 'Poker Face', '00:03:57'),
(38, 'Katy Perry', 'Firework', '00:03:48'),
(39, 'Maroon 5', 'Sugar', '00:03:55'),
(40, 'OneRepublic', 'Counting Stars', '00:04:17'),
(41, 'Oasis', 'Wonderwall', '00:04:18'),
(42, 'Blur', 'Song 2', '00:02:02'),
(43, 'The Killers', 'Mr. Brightside', '00:03:42'),
(44, 'Muse', 'Starlight', '00:03:59'),
(45, 'Green Day', 'Boulevard of Broken Dreams', '00:04:20'),
(46, 'Fall Out Boy', 'Centuries', '00:03:48'),
(47, 'My Chemical Romance', 'Welcome to the Black Parade', '00:05:11'),
(48, 'Paramore', 'Misery Business', '00:03:31'),
(49, 'Thirty Seconds to Mars', 'The Kill', '00:03:51'),
(50, 'Kings of Leon', 'Sex on Fire', '00:03:24'),
(51, 'Avicii', 'Wake Me Up', '00:04:09'),
(52, 'Calvin Harris', 'Summer', '00:03:44'),
(53, 'David Guetta', 'Titanium', '00:04:05'),
(54, 'Martin Garrix', 'Animals', '00:02:56'),
(55, 'Swedish House Mafia', 'Don\'t You Worry Child', '00:03:32'),
(56, 'Kygo', 'Firestone', '00:04:33'),
(57, 'Alan Walker', 'Faded', '00:03:32'),
(58, 'Zedd', 'Clarity', '00:04:31'),
(59, 'Deadmau5', 'Strobe', '00:10:37'),
(60, 'Marshmello', 'Alone', '00:03:20'),
(61, 'Elton John', 'Rocket Man', '00:04:41'),
(62, 'Michael Jackson', 'Billie Jean', '00:04:54'),
(63, 'Whitney Houston', 'I Will Always Love You', '00:04:31'),
(64, 'Prince', 'Purple Rain', '00:08:41'),
(65, 'David Bowie', 'Heroes', '00:03:36'),
(66, 'Fleetwood Mac', 'Dreams', '00:04:17'),
(67, 'Eagles', 'Hotel California', '00:06:30'),
(68, 'The Rolling Stones', 'Paint It Black', '00:03:22'),
(69, 'ABBA', 'Dancing Queen', '00:03:51'),
(70, 'Bee Gees', 'Stayin\' Alive', '00:04:45'),
(71, 'Frank Sinatra', 'My Way', '00:04:35'),
(72, 'Bob Marley', 'No Woman No Cry', '00:04:07'),
(73, 'Sting', 'Shape of My Heart', '00:04:39'),
(74, 'Phil Collins', 'In the Air Tonight', '00:05:36'),
(75, 'Eric Clapton', 'Tears in Heaven', '00:04:33'),
(76, 'George Michael', 'Careless Whisper', '00:05:04'),
(77, 'A-ha', 'Take On Me', '00:03:48'),
(78, 'Toto', 'Africa', '00:04:55'),
(79, 'Simple Minds', 'Don\'t You Forget About Me', '00:04:20'),
(80, 'Survivor', 'Eye of the Tiger', '00:04:05');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `felhasznalonev` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `jelszo` varchar(255) NOT NULL,
  `szerep` varchar(255) NOT NULL,
  `letrehozva` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`id`, `felhasznalonev`, `email`, `jelszo`, `szerep`, `letrehozva`) VALUES
(1, 'kovacs_admin', 'kovacs.admin@gmail.com', 'hash_admin1', 'admin', '2024-01-10'),
(2, 'szabo_admin', 'szabo.admin@gmail.com', 'hash_admin2', 'admin', '2024-01-11'),
(3, 'kiss_peter', 'kiss.peter@gmail.com', 'hash_mp1', 'musorvezeto', '2024-02-01'),
(4, 'nagy_anna', 'nagy.anna@gmail.com', 'hash_mp2', 'musorvezeto', '2024-02-02'),
(5, 'toth_gabor', 'toth.gabor@gmail.com', 'hash_mp3', 'musorvezeto', '2024-02-03'),
(6, 'balogh_rita', 'balogh.rita@gmail.com', 'hash_u1', 'felhasznalo', '2024-03-01'),
(7, 'farkas_david', 'farkas.david@gmail.com', 'hash_u2', 'felhasznalo', '2024-03-02'),
(8, 'horvath_eszt', 'horvath.eszter@gmail.com', 'hash_u3', 'felhasznalo', '2024-03-03'),
(9, 'nagy_laszlo', 'nagy.laszlo@gmail.com', 'hash_u4', 'felhasznalo', '2024-03-04'),
(10, 'szucs_petra', 'szucs.petra@gmail.com', 'hash_u5', 'felhasznalo', '2024-03-05'),
(11, 'molnar_akos', 'molnar.akos@gmail.com', 'hash_u6', 'felhasznalo', '2024-03-06'),
(12, 'varga_reka', 'varga.reka@gmail.com', 'hash_u7', 'felhasznalo', '2024-03-07'),
(13, 'papp_mate', 'papp.mate@gmail.com', 'hash_u8', 'felhasznalo', '2024-03-08'),
(14, 'lukacs_bence', 'lukacs.bence@gmail.com', 'hash_u9', 'felhasznalo', '2024-03-09'),
(15, 'sipos_anna', 'sipos.anna@gmail.com', 'hash_u10', 'felhasznalo', '2024-03-10'),
(16, 'kerekes_juli', 'kerekes.julia@gmail.com', 'hash_u11', 'felhasznalo', '2024-03-11'),
(17, 'nagy_marton', 'nagy.marton@gmail.com', 'hash_u12', 'felhasznalo', '2024-03-12'),
(18, 'boros_kata', 'boros.kata@gmail.com', 'hash_u13', 'felhasznalo', '2024-03-13'),
(19, 'racz_peter', 'racz.peter@gmail.com', 'hash_u14', 'felhasznalo', '2024-03-14'),
(20, 'tamas_gergo', 'tamas.gergo@gmail.com', 'hash_u15', 'felhasznalo', '2024-03-15'),
(21, 'kovacs_mark', 'kovacs.mark@gmail.com', 'hash_mp1', 'musorvezeto', '2024-02-01'),
(22, 'szabo_dora', 'szabo.dora@gmail.com', 'hash_mp2', 'musorvezeto', '2024-02-02'),
(23, 'farkas_bence', 'farkas.bence@gmail.com', 'hash_mp3', 'musorvezeto', '2024-02-03'),
(24, 'varga_lilla', 'varga.lilla@gmail.com', 'hash_mp4', 'musorvezeto', '2024-02-04'),
(25, 'horvath_adam', 'horvath.adam@gmail.com', 'hash_mp5', 'musorvezeto', '2024-02-05'),
(26, 'molnar_zoltan', 'molnar.zoltan@gmail.com', 'hash_mp6', 'musorvezeto', '2024-02-06'),
(27, 'toth_reka', 'toth.reka@gmail.com', 'hash_mp7', 'musorvezeto', '2024-02-07'),
(28, 'balogh_levente', 'balogh.levente@gmail.com', 'hash_mp8', 'musorvezeto', '2024-02-08'),
(29, 'nemeth_david', 'nemeth.david@gmail.com', 'hash_mp9', 'musorvezeto', '2024-02-09'),
(30, 'papp_gergo', 'papp.gergo@gmail.com', 'hash_mp10', 'musorvezeto', '2024-02-10'),
(31, 'lakatos_eszter', 'lakatos.eszter@gmail.com', 'hash_mp11', 'musorvezeto', '2024-02-11'),
(32, 'juhasz_peter', 'juhasz.peter@gmail.com', 'hash_mp12', 'musorvezeto', '2024-02-12'),
(33, 'kiss_roland', 'kiss.roland@gmail.com', 'hash_mp13', 'musorvezeto', '2024-02-13'),
(34, 'szalai_nora', 'szalai.nora@gmail.com', 'hash_mp14', 'musorvezeto', '2024-02-14'),
(35, 'boros_andras', 'boros.andras@gmail.com', 'hash_mp15', 'musorvezeto', '2024-02-15'),
(36, 'kerekes_tamas', 'kerekes.tamas@gmail.com', 'hash_mp16', 'musorvezeto', '2024-02-16'),
(37, 'sipos_zsofia', 'sipos.zsofia@gmail.com', 'hash_mp17', 'musorvezeto', '2024-02-17'),
(38, 'racz_viktor', 'racz.viktor@gmail.com', 'hash_mp18', 'musorvezeto', '2024-02-18'),
(39, 'toth_mate', 'toth.mate@gmail.com', 'hash_mp19', 'musorvezeto', '2024-02-19'),
(40, 'gal_petra', 'gal.petra@gmail.com', 'hash_mp20', 'musorvezeto', '2024-02-20');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `lejatszolistak`
--

CREATE TABLE `lejatszolistak` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nev` varchar(255) NOT NULL,
  `felhasznalo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `playlist_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sorrend_szam` int(11) NOT NULL DEFAULT 0,
  `musor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `letrehozva` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `lejatszolistak`
--

INSERT INTO `lejatszolistak` (`id`, `nev`, `felhasznalo_id`, `playlist_id`, `dal_id`, `sorrend_szam`, `musor_id`, `letrehozva`) VALUES
(1, 'Rock Antológia 1', NULL, NULL, 1, 1, 1, '2026-04-16 18:35:10'),
(2, 'Pop Slágerek 2026', NULL, NULL, 8, 2, 1, '2026-04-16 18:35:10'),
(3, '80s Retro Mix', NULL, NULL, 3, 1, 2, '2026-04-16 18:35:10'),
(4, 'Chill Lounge', NULL, NULL, 4, 2, 2, '2026-04-16 18:35:10'),
(5, 'Party Mix Vol.1', NULL, NULL, 2, 1, 3, '2026-04-16 18:35:10'),
(6, 'Nyári Slágerek', NULL, NULL, 12, 2, 3, '2026-04-16 18:35:10'),
(7, 'Klasszikus Rock', NULL, NULL, 6, 1, 6, '2026-04-16 18:35:10'),
(8, 'Dance Mania', NULL, NULL, 18, 2, 6, '2026-04-16 18:35:10'),
(9, 'Acoustic Session', NULL, NULL, 16, 1, 10, '2026-04-16 18:35:10'),
(10, 'Hip-Hop Favorites', NULL, NULL, 5, 1, 5, '2026-04-16 18:35:10'),
(11, 'R&B Night', NULL, NULL, 11, 2, 5, '2026-04-16 18:35:10'),
(12, 'Punk Rock Antológia', NULL, NULL, 17, 1, 11, '2026-04-16 18:35:10'),
(13, 'Jazz Klub', NULL, NULL, 15, 1, 14, '2026-04-16 18:35:10'),
(14, 'Electronic Beats', NULL, NULL, 9, 2, 14, '2026-04-16 18:35:10'),
(15, 'Folk Akusztik', NULL, NULL, 13, 1, 9, '2026-04-16 18:35:10'),
(16, 'Wedding Mix', NULL, NULL, 19, 1, 19, '2026-04-16 18:35:10'),
(17, 'Party Deluxe', NULL, NULL, 7, 2, 19, '2026-04-16 18:35:10'),
(18, 'Road Trip', NULL, NULL, 20, 1, 17, '2026-04-16 18:35:10'),
(19, 'Love Songs', NULL, NULL, 10, 1, 7, '2026-04-16 18:35:10'),
(20, 'Workout Energy', NULL, NULL, 14, 1, 12, '2026-04-16 18:35:10');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2026_01_16_080814_create_dalok_table', 1),
(2, '2026_01_16_080849_create_felhasznalok_table', 1),
(3, '2026_01_16_080851_create_musorvezetok_table', 1),
(4, '2026_01_16_080858_create_musorok_table', 1),
(5, '2026_01_16_080859_create_lejatszolistak_table', 1),
(6, '2026_01_16_080900_create_uzenetek_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `musorok`
--

CREATE TABLE `musorok` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cim` varchar(255) NOT NULL,
  `leiras` varchar(255) DEFAULT NULL,
  `musorvezeto_id` bigint(20) UNSIGNED NOT NULL,
  `letrehozva` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `musorok`
--

INSERT INTO `musorok` (`id`, `cim`, `leiras`, `musorvezeto_id`, `letrehozva`) VALUES
(1, 'Reggeli Start', 'Hírek, zene és beszélgetés', 1, '2024-02-10'),
(2, 'Pop Slágerek', 'Aktuális nemzetközi slágerek', 2, '2024-02-11'),
(3, 'Rock Műhely', 'Klasszikus és modern rock', 3, '2024-02-12'),
(4, 'Esti Jazz', 'Nyugodt jazz válogatás', 18, '2024-02-13'),
(5, 'Elektronikus Pulzus', 'House és techno', 9, '2024-02-14'),
(6, 'Retró Rádió', '80-as és 90-es évek slágerei', 7, '2024-02-15'),
(7, 'Magyar Hangok', 'Hazai előadók', 17, '2024-02-16'),
(8, 'Akusztik Live', 'Akusztikus felvételek', 11, '2024-02-17'),
(9, 'Metal Est', 'Heavy és thrash metal', 12, '2024-02-18'),
(10, 'Filmzene Klub', 'Ismert filmzenék', 13, '2024-02-19'),
(11, 'Girl Power', 'Női előadók', 14, '2024-02-20'),
(12, 'Chill Zone', 'Relax és lounge', 15, '2024-02-21'),
(13, 'Világjáró', 'Világzenei válogatás', 16, '2024-02-22'),
(14, 'Top 40', 'Heti slágerlista', 8, '2024-02-23'),
(15, 'Interjú Plusz', 'Zenészek és vendégek', 10, '2024-02-24'),
(16, 'Éjszakai Mix', 'Késő esti elektronikus zene', 19, '2024-02-25'),
(17, 'Hallgatói Kérések', 'Kívánságműsor', 20, '2024-02-26'),
(18, 'Blues Sarok', 'Blues klasszikusok', 18, '2024-02-27'),
(19, 'Indie Hullám', 'Indie és alternatív', 6, '2024-02-28'),
(20, 'Vasárnapi Lazítás', 'Nyugodt vasárnapi zene', 15, '2024-02-29');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `musorvezetok`
--

CREATE TABLE `musorvezetok` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `felhasznalo_id` bigint(20) UNSIGNED NOT NULL,
  `nev` varchar(255) NOT NULL,
  `bemutatkozas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `musorvezetok`
--

INSERT INTO `musorvezetok` (`id`, `felhasznalo_id`, `nev`, `bemutatkozas`) VALUES
(1, 21, 'Kovács Márk', 'Reggeli műsorvezető, 10 éve rádiózik'),
(2, 22, 'Szabó Dóra', 'Pop és mainstream zenei szerkesztő'),
(3, 23, 'Farkas Bence', 'Rock és metal szakértő'),
(4, 24, 'Varga Lilla', 'Beszélgetős műsorok házigazdája'),
(5, 25, 'Horváth Ádám', 'Esti zenei műsorok'),
(6, 26, 'Molnár Zoltán', 'Alternatív és underground zene'),
(7, 27, 'Tóth Réka', 'Retró műsorok vezetése'),
(8, 28, 'Balogh Levente', 'Toplisták és slágerek'),
(9, 29, 'Németh Dávid', 'Elektronikus zenei blokk'),
(10, 30, 'Papp Gergő', 'Interjúk zenészekkel'),
(11, 31, 'Lakatos Eszter', 'Akusztikus műsor'),
(12, 32, 'Juhász Péter', 'Metal tematikus est'),
(13, 33, 'Kiss Roland', 'Filmzenék és sorozatzene'),
(14, 34, 'Szalai Nóra', 'Női előadók műsora'),
(15, 35, 'Boros András', 'Chillout és lounge'),
(16, 36, 'Kerekes Tamás', 'Világzenei válogatás'),
(17, 37, 'Sipos Zsófia', 'Magyar könnyűzene'),
(18, 38, 'Rácz Viktor', 'Jazz és blues'),
(19, 39, 'Tóth Máté', 'Éjszakai mix'),
(20, 40, 'Gál Petra', 'Hallgatói kérések');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `uzenetek`
--

CREATE TABLE `uzenetek` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `felhasznalo_id` bigint(20) UNSIGNED NOT NULL,
  `lejatszolista_id` bigint(20) UNSIGNED DEFAULT NULL,
  `uzenet` text NOT NULL,
  `letrehozva` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `uzenetek`
--

INSERT INTO `uzenetek` (`id`, `felhasznalo_id`, `lejatszolista_id`, `uzenet`, `letrehozva`) VALUES
(1, 6, NULL, 'Nagyon jó a reggeli műsor, feldobja a napom!', '2024-03-20 06:45:00'),
(2, 7, NULL, 'Köszi a rock válogatást!', '2024-03-20 18:30:00'),
(3, 8, NULL, 'Ez a dal mindig libabőr', '2024-03-20 21:05:00'),
(4, 9, NULL, 'Lehetne több magyar zene?', '2024-03-21 14:10:00'),
(5, 10, NULL, 'Szuper volt az interjú!', '2024-03-21 19:40:00'),
(6, 11, NULL, 'Imádom a chill zenéket este', '2024-03-21 22:15:00'),
(7, 12, NULL, 'Retró műsor = gyerekkor ❤️', '2024-03-22 16:20:00'),
(8, 13, NULL, 'Metal est nagyon ütött!', '2024-03-22 23:50:00'),
(9, 14, NULL, 'Köszi a filmzenéket!', '2024-03-23 19:05:00'),
(10, 15, NULL, 'Ez a női előadós műsor nagyon jó', '2024-03-23 15:30:00'),
(11, 16, NULL, 'Hallgatói kérések mindig jók', '2024-03-24 20:10:00'),
(12, 17, NULL, 'Top 40-ben jók a számok', '2024-03-24 12:45:00'),
(13, 18, NULL, 'Jazz este tökéletes lazításhoz', '2024-03-25 21:35:00'),
(14, 19, NULL, 'Indie műsor hiánypótló', '2024-03-25 19:25:00'),
(15, 20, NULL, 'Vasárnap reggel ideális zene', '2024-03-26 10:15:00'),
(16, 6, NULL, 'Ez a Queen szám örök!', '2024-03-26 06:55:00'),
(17, 7, NULL, 'Lehetne hosszabb a műsor', '2024-03-26 18:40:00'),
(18, 8, NULL, 'Nagyon jó hangulat volt', '2024-03-27 20:50:00'),
(19, 9, NULL, 'Köszi a kérést, lejátszottátok!', '2024-03-27 20:55:00'),
(20, 10, NULL, 'Csak így tovább!', '2024-03-28 19:00:00');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `dalok`
--
ALTER TABLE `dalok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `lejatszolistak`
--
ALTER TABLE `lejatszolistak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lejatszolistak_felhasznalo_id_foreign` (`felhasznalo_id`),
  ADD KEY `lejatszolistak_playlist_id_foreign` (`playlist_id`),
  ADD KEY `lejatszolistak_dal_id_foreign` (`dal_id`),
  ADD KEY `lejatszolistak_musor_id_foreign` (`musor_id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `musorok`
--
ALTER TABLE `musorok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `musorok_musorvezeto_id_foreign` (`musorvezeto_id`);

--
-- A tábla indexei `musorvezetok`
--
ALTER TABLE `musorvezetok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `musorvezetok_felhasznalo_id_foreign` (`felhasznalo_id`);

--
-- A tábla indexei `uzenetek`
--
ALTER TABLE `uzenetek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uzenetek_lejatszolista_id_foreign` (`lejatszolista_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `dalok`
--
ALTER TABLE `dalok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT a táblához `lejatszolistak`
--
ALTER TABLE `lejatszolistak`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `musorok`
--
ALTER TABLE `musorok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `musorvezetok`
--
ALTER TABLE `musorvezetok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `uzenetek`
--
ALTER TABLE `uzenetek`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `lejatszolistak`
--
ALTER TABLE `lejatszolistak`
  ADD CONSTRAINT `lejatszolistak_dal_id_foreign` FOREIGN KEY (`dal_id`) REFERENCES `dalok` (`id`),
  ADD CONSTRAINT `lejatszolistak_felhasznalo_id_foreign` FOREIGN KEY (`felhasznalo_id`) REFERENCES `felhasznalok` (`id`),
  ADD CONSTRAINT `lejatszolistak_musor_id_foreign` FOREIGN KEY (`musor_id`) REFERENCES `musorok` (`id`),
  ADD CONSTRAINT `lejatszolistak_playlist_id_foreign` FOREIGN KEY (`playlist_id`) REFERENCES `lejatszolistak` (`id`);

--
-- Megkötések a táblához `musorok`
--
ALTER TABLE `musorok`
  ADD CONSTRAINT `musorok_musorvezeto_id_foreign` FOREIGN KEY (`musorvezeto_id`) REFERENCES `musorvezetok` (`id`);

--
-- Megkötések a táblához `musorvezetok`
--
ALTER TABLE `musorvezetok`
  ADD CONSTRAINT `musorvezetok_felhasznalo_id_foreign` FOREIGN KEY (`felhasznalo_id`) REFERENCES `felhasznalok` (`id`);

--
-- Megkötések a táblához `uzenetek`
--
ALTER TABLE `uzenetek`
  ADD CONSTRAINT `uzenetek_lejatszolista_id_foreign` FOREIGN KEY (`lejatszolista_id`) REFERENCES `lejatszolistak` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
