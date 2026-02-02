-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Jan 31. 01:17
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
(4, 'Adele', 'Someone Like You', '00:04:35'),
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
(20, 'Bon Jovi', 'Always', '00:05:53');

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
(1, 'kovacs_admin1', 'kovacs.admin2@gmail.com', 'hash_admin1', 'admin', '2023-01-10'),
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
(20, 'tamas_gergo', 'tamas.gergo@gmail.com', 'hash_u15', 'felhasznalo', '2024-03-15');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `lejatszolistak`
--

CREATE TABLE `lejatszolistak` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dal_id` bigint(20) UNSIGNED NOT NULL,
  `sorrend_szam` int(11) NOT NULL,
  `musor_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `lejatszolistak`
--

INSERT INTO `lejatszolistak` (`id`, `dal_id`, `sorrend_szam`, `musor_id`) VALUES
(1, 2, 1, 1),
(2, 8, 2, 1),
(3, 3, 1, 2),
(4, 4, 2, 2),
(5, 2, 1, 3),
(6, 12, 2, 3),
(7, 6, 1, 6),
(8, 18, 2, 6),
(9, 16, 1, 10),
(10, 5, 1, 5),
(11, 11, 2, 5),
(12, 17, 1, 11),
(13, 15, 1, 14),
(14, 9, 2, 14),
(15, 13, 1, 9),
(16, 19, 1, 19),
(17, 7, 2, 19),
(18, 20, 1, 17),
(19, 10, 1, 7);

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
(3, '2026_01_16_080850_create_uzenetek_table', 1),
(4, '2026_01_16_080851_create_musorvezetok_table', 1),
(5, '2026_01_16_080858_create_musorok_table', 1),
(6, '2026_01_16_080859_create_lejatszolistak_table', 1);

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
(1, 'Reggeli Rajt', 'Hírek, zene és verseny', 1, '2025-07-26'),
(2, 'Pop Slágerek', 'Aktuális nemzetközi slágerek', 2, '2024-02-11'),
(3, 'Rock Műhely', 'Klasszikus és modern rock', 3, '2024-02-12'),
(4, 'Esti Jazz', 'Nyugodt jazz válogatás', 18, '2024-02-13'),
(5, 'Elektronikus Pulzus', 'House és techno', 9, '2024-02-14'),
(6, 'Retró Rádió', '80-as és 90-es évek slágerei', 7, '2024-02-15'),
(7, 'Magyar Hangok', 'Hazai előadók', 17, '2024-02-16'),
(8, 'Akusztik Live', 'Akusztikus felvételek', 11, '2024-02-17'),
(9, 'Metal Est', 'Heavy és thrash metal', 12, '2024-02-18'),
(10, 'Filmzene Klub', 'Ismert filmzenék', 13, '2024-02-19'),
(11, 'Reggeli Rajt', 'Hírek, zene és verseny', 1, '2025-07-26'),
(12, 'Chill Zone', 'Relax és lounge', 15, '2024-02-21'),
(13, 'Világjáró', 'Világzenei válogatás', 16, '2024-02-22'),
(14, 'Top 40', 'Heti slágerlista', 8, '2024-02-23'),
(15, 'Interjú Plusz', 'Zenészek és vendégek', 10, '2024-02-24'),
(16, 'Éjszakai Mix', 'Késő esti elektronikus zene', 19, '2024-02-25'),
(17, 'Hallgatói Kérések', 'Kívánságműsor', 20, '2024-02-26'),
(18, 'Blues Sarok', 'Blues klasszikusok', 18, '2024-02-27'),
(19, 'Indie Hullám', 'Indie és alternatív', 6, '2024-02-28');

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
(1, 4, 'Nagy Anna', 'Reggeli műsorvezető, 10 éve rádiózik'),
(2, 4, 'Nagy Anna', 'Pop és mainstream zenei szerkesztő'),
(3, 5, 'Tóth Gábor', 'Rock és metal szakértő'),
(4, 3, 'Kiss Péter', 'Beszélgetős műsorok házigazdája'),
(6, 5, 'Tóth Gábor', 'Alternatív és underground zene'),
(7, 3, 'Kiss Péter', 'Retró műsorok vezetése'),
(8, 4, 'Nagy Anna', 'Toplisták és slágerek'),
(9, 5, 'Tóth Gábor', 'Elektronikus zenei blokk'),
(10, 3, 'Kiss Péter', 'Interjúk zenészekkel'),
(11, 4, 'Nagy Anna', 'Akusztikus műsor'),
(12, 5, 'Tóth Gábor', 'Metal tematikus est'),
(13, 3, 'Kiss Péter', 'Filmzenék és sorozatzene'),
(15, 5, 'Tóth Gábor', 'Chillout és lounge'),
(16, 3, 'Kiss Péter', 'Világzenei válogatás'),
(17, 4, 'Nagy Anna', 'Magyar könnyűzene'),
(18, 5, 'Tóth Gábor', 'Jazz és blues'),
(19, 3, 'Kiss Péter', 'Éjszakai mix'),
(20, 4, 'Nagy Anna', 'Hallgatói kérések'),
(22, 16, 'Kerekes Juli', 'A reggelek felpörgetője');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `uzenetek`
--

CREATE TABLE `uzenetek` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `felhasznalo_id` bigint(20) UNSIGNED NOT NULL,
  `uzenet` varchar(255) NOT NULL,
  `letrehozva` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `uzenetek`
--

INSERT INTO `uzenetek` (`id`, `felhasznalo_id`, `uzenet`, `letrehozva`) VALUES
(1, 6, 'A reggeli műsor feldobja a napom!', '2024-03-28'),
(2, 7, 'Köszi a rock válogatást!', '2024-03-20'),
(3, 8, 'Ez a dal mindig libabőr', '2024-03-20'),
(4, 9, 'Lehetne több magyar zene?', '2024-03-21'),
(5, 10, 'Szuper volt az interjú!', '2024-03-21'),
(6, 11, 'Imádom a chill zenéket este', '2024-03-21'),
(7, 12, 'Retró műsor = gyerekkor ❤️', '2024-03-22'),
(8, 13, 'Metal est nagyon ütött!', '2024-03-22'),
(9, 14, 'Köszi a filmzenéket!', '2024-03-23'),
(10, 15, 'Ez a női előadós műsor nagyon jó', '2024-03-23'),
(11, 16, 'Hallgatói kérések mindig jók', '2024-03-24'),
(12, 17, 'Top 40-ben jók a számok', '2024-03-24'),
(13, 18, 'Jazz este tökéletes lazításhoz', '2024-03-25'),
(14, 19, 'Indie műsor hiánypótló', '2024-03-25'),
(15, 20, 'Vasárnap reggel ideális zene', '2024-03-26'),
(16, 6, 'Ez a Queen szám örök!', '2024-03-26'),
(17, 7, 'Lehetne hosszabb a műsor', '2024-03-26'),
(18, 8, 'Nagyon jó hangulat volt', '2024-03-27'),
(19, 9, 'Köszi a kérést, lejátszottátok!', '2024-03-27'),
(20, 10, 'Csak így tovább!', '2024-03-28');

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
  ADD KEY `uzenetek_felhasznalo_id_foreign` (`felhasznalo_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `dalok`
--
ALTER TABLE `dalok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT a táblához `lejatszolistak`
--
ALTER TABLE `lejatszolistak`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `musorok`
--
ALTER TABLE `musorok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT a táblához `musorvezetok`
--
ALTER TABLE `musorvezetok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT a táblához `uzenetek`
--
ALTER TABLE `uzenetek`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `lejatszolistak`
--
ALTER TABLE `lejatszolistak`
  ADD CONSTRAINT `lejatszolistak_dal_id_foreign` FOREIGN KEY (`dal_id`) REFERENCES `dalok` (`id`),
  ADD CONSTRAINT `lejatszolistak_musor_id_foreign` FOREIGN KEY (`musor_id`) REFERENCES `musorok` (`id`);

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
  ADD CONSTRAINT `uzenetek_felhasznalo_id_foreign` FOREIGN KEY (`felhasznalo_id`) REFERENCES `felhasznalok` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
