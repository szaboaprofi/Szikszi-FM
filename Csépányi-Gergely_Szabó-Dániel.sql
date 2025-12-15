CREATE TABLE felhasznalok (
    id INT,
    felhasznalonev VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    jelszo_hash VARCHAR(255) NOT NULL,
    szerep VARCHAR(20) NOT NULL, 
    letrehozva DATETIME,           
    CONSTRAINT pk_felhasznalok PRIMARY KEY (id)
);

CREATE TABLE musorvezetok (
    id INT,
    nev VARCHAR(100) NOT NULL,
    bemutatkozas TEXT,
    felhasznalo_id INT,
    CONSTRAINT pk_musorvezetok PRIMARY KEY (id),
    CONSTRAINT fk_musorvezetok_felhasznalo FOREIGN KEY (felhasznalo_id) REFERENCES felhasznalok (id)
);

CREATE TABLE musorok (
    id INT,
    cim VARCHAR(100) NOT NULL,
    leiras TEXT,
    musorvezeto_id INT NOT NULL,
    letrehozva DATETIME,
    CONSTRAINT pk_musorok PRIMARY KEY (id),
    CONSTRAINT fk_musorok_musorvezeto FOREIGN KEY (musorvezeto_id) REFERENCES musorvezetok (id)
);


CREATE TABLE dalok (
    id INT,
    eloado VARCHAR(100) NOT NULL,
    cim VARCHAR(100) NOT NULL,
    hossza TIME,
    CONSTRAINT pk_dalok PRIMARY KEY (id)
);

CREATE TABLE lejatszolista (
    id INT,
    dal_id INT NOT NULL,
    sorrend_szam INT NOT NULL,
    musor_id INT NOT NULL,
    CONSTRAINT pk_lejatszolista PRIMARY KEY (id),
    CONSTRAINT fk_lejatszolista_musor FOREIGN KEY (musor_id) REFERENCES musorok (id),
    CONSTRAINT fk_lejatszolista_dal FOREIGN KEY (dal_id) REFERENCES dalok (id)
);

CREATE TABLE uzenetek (
    id INT,
    felhasznalo_id INT NOT NULL,
    uzenet TEXT NOT NULL,
    letrehozva DATETIME,
    CONSTRAINT pk_uzenetek PRIMARY KEY (id),
    CONSTRAINT fk_uzenetek_felhasznalo FOREIGN KEY (felhasznalo_id) REFERENCES felhasznalok (id)
);


INSERT INTO felhasznalok (id, felhasznalonev, email, jelszo_hash, szerep, letrehozva) VALUES
(1, 'kovacs_admin', 'kovacs.admin@gmail.com', 'hash_admin1', 'admin', '2024-01-10 09:12:00'),
(2, 'szabo_admin', 'szabo.admin@gmail.com', 'hash_admin2', 'admin', '2024-01-11 10:45:00'),
(3, 'kiss_peter', 'kiss.peter@gmail.com', 'hash_mp1', 'musorvezeto', '2024-02-01 08:00:00'),
(4, 'nagy_anna', 'nagy.anna@gmail.com', 'hash_mp2', 'musorvezeto', '2024-02-02 08:30:00'),
(5, 'toth_gabor', 'toth.gabor@gmail.com', 'hash_mp3', 'musorvezeto', '2024-02-03 09:00:00'),
(6, 'balogh_rita', 'balogh.rita@gmail.com', 'hash_u1', 'felhasznalo', '2024-03-01 12:10:00'),
(7, 'farkas_david', 'farkas.david@gmail.com', 'hash_u2', 'felhasznalo', '2024-03-02 14:22:00'),
(8, 'horvath_eszt', 'horvath.eszter@gmail.com', 'hash_u3', 'felhasznalo', '2024-03-03 16:40:00'),
(9, 'nagy_laszlo', 'nagy.laszlo@gmail.com', 'hash_u4', 'felhasznalo', '2024-03-04 18:00:00'),
(10, 'szucs_petra', 'szucs.petra@gmail.com', 'hash_u5', 'felhasznalo', '2024-03-05 19:30:00'),
(11, 'molnar_akos', 'molnar.akos@gmail.com', 'hash_u6', 'felhasznalo', '2024-03-06 20:10:00'),
(12, 'varga_reka', 'varga.reka@gmail.com', 'hash_u7', 'felhasznalo', '2024-03-07 21:15:00'),
(13, 'papp_mate', 'papp.mate@gmail.com', 'hash_u8', 'felhasznalo', '2024-03-08 22:00:00'),
(14, 'lukacs_bence', 'lukacs.bence@gmail.com', 'hash_u9', 'felhasznalo', '2024-03-09 11:25:00'),
(15, 'sipos_anna', 'sipos.anna@gmail.com', 'hash_u10', 'felhasznalo', '2024-03-10 10:50:00'),
(16, 'kerekes_juli', 'kerekes.julia@gmail.com', 'hash_u11', 'felhasznalo', '2024-03-11 09:45:00'),
(17, 'nagy_marton', 'nagy.marton@gmail.com', 'hash_u12', 'felhasznalo', '2024-03-12 08:35:00'),
(18, 'boros_kata', 'boros.kata@gmail.com', 'hash_u13', 'felhasznalo', '2024-03-13 13:00:00'),
(19, 'racz_peter', 'racz.peter@gmail.com', 'hash_u14', 'felhasznalo', '2024-03-14 15:40:00'),
(20, 'tamas_gergo', 'tamas.gergo@gmail.com', 'hash_u15', 'felhasznalo', '2024-03-15 17:55:00');


INSERT INTO musorvezetok (id, nev, bemutatkozas, felhasznalo_id) VALUES
(1, 'Kiss Péter', 'Reggeli műsorvezető, 10 éve rádiózik', 3),
(2, 'Nagy Anna', 'Pop és mainstream zenei szerkesztő', 4),
(3, 'Tóth Gábor', 'Rock és metal szakértő', 5),
(4, 'Kiss Péter', 'Beszélgetős műsorok házigazdája', 3),
(5, 'Nagy Anna', 'Esti zenei műsorok', 4),
(6, 'Tóth Gábor', 'Alternatív és underground zene', 5),
(7, 'Kiss Péter', 'Retró műsorok vezetése', 3),
(8, 'Nagy Anna', 'Toplisták és slágerek', 4),
(9, 'Tóth Gábor', 'Elektronikus zenei blokk', 5),
(10, 'Kiss Péter', 'Interjúk zenészekkel', 3),
(11, 'Nagy Anna', 'Akusztikus műsor', 4),
(12, 'Tóth Gábor', 'Metal tematikus est', 5),
(13, 'Kiss Péter', 'Filmzenék és sorozatzene', 3),
(14, 'Nagy Anna', 'Női előadók műsora', 4),
(15, 'Tóth Gábor', 'Chillout és lounge', 5),
(16, 'Kiss Péter', 'Világzenei válogatás', 3),
(17, 'Nagy Anna', 'Magyar könnyűzene', 4),
(18, 'Tóth Gábor', 'Jazz és blues', 5),
(19, 'Kiss Péter', 'Éjszakai mix', 3),
(20, 'Nagy Anna', 'Hallgatói kérések', 4);

INSERT INTO musorok (id, cim, leiras, musorvezeto_id, letrehozva) VALUES
(1, 'Reggeli Start', 'Hírek, zene és beszélgetés', 1, '2024-02-10 06:00:00'),
(2, 'Pop Slágerek', 'Aktuális nemzetközi slágerek', 2, '2024-02-11 10:00:00'),
(3, 'Rock Műhely', 'Klasszikus és modern rock', 3, '2024-02-12 18:00:00'),
(4, 'Esti Jazz', 'Nyugodt jazz válogatás', 18, '2024-02-13 21:00:00'),
(5, 'Elektronikus Pulzus', 'House és techno', 9, '2024-02-14 22:00:00'),
(6, 'Retró Rádió', '80-as és 90-es évek slágerei', 7, '2024-02-15 16:00:00'),
(7, 'Magyar Hangok', 'Hazai előadók', 17, '2024-02-16 14:00:00'),
(8, 'Akusztik Live', 'Akusztikus felvételek', 11, '2024-02-17 20:00:00'),
(9, 'Metal Est', 'Heavy és thrash metal', 12, '2024-02-18 23:00:00'),
(10, 'Filmzene Klub', 'Ismert filmzenék', 13, '2024-02-19 19:00:00'),
(11, 'Girl Power', 'Női előadók', 14, '2024-02-20 15:00:00'),
(12, 'Chill Zone', 'Relax és lounge', 15, '2024-02-21 22:00:00'),
(13, 'Világjáró', 'Világzenei válogatás', 16, '2024-02-22 17:00:00'),
(14, 'Top 40', 'Heti slágerlista', 8, '2024-02-23 12:00:00'),
(15, 'Interjú Plusz', 'Zenészek és vendégek', 10, '2024-02-24 18:30:00'),
(16, 'Éjszakai Mix', 'Késő esti elektronikus zene', 19, '2024-02-25 23:30:00'),
(17, 'Hallgatói Kérések', 'Kívánságműsor', 20, '2024-02-26 20:00:00'),
(18, 'Blues Sarok', 'Blues klasszikusok', 18, '2024-02-27 21:30:00'),
(19, 'Indie Hullám', 'Indie és alternatív', 6, '2024-02-28 19:00:00'),
(20, 'Vasárnapi Lazítás', 'Nyugodt vasárnapi zene', 15, '2024-02-29 10:00:00');


INSERT INTO dalok (id, eloado, cim, hossza) VALUES
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
(20, 'Bon Jovi', 'Always', '00:05:53');

INSERT INTO lejatszolista (id, dal_id, sorrend_szam, musor_id) VALUES
(1, 1, 1, 1),
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
(19, 10, 1, 7),
(20, 14, 1, 12);

INSERT INTO uzenetek (id, felhasznalo_id, uzenet, letrehozva) VALUES
(1, 6, 'Nagyon jó a reggeli műsor, feldobja a napom!', '2024-03-20 06:45:00'),
(2, 7, 'Köszi a rock válogatást!', '2024-03-20 18:30:00'),
(3, 8, 'Ez a dal mindig libabőr', '2024-03-20 21:05:00'),
(4, 9, 'Lehetne több magyar zene?', '2024-03-21 14:10:00'),
(5, 10, 'Szuper volt az interjú!', '2024-03-21 19:40:00'),
(6, 11, 'Imádom a chill zenéket este', '2024-03-21 22:15:00'),
(7, 12, 'Retró műsor = gyerekkor ❤️', '2024-03-22 16:20:00'),
(8, 13, 'Metal est nagyon ütött!', '2024-03-22 23:50:00'),
(9, 14, 'Köszi a filmzenéket!', '2024-03-23 19:05:00'),
(10, 15, 'Ez a női előadós műsor nagyon jó', '2024-03-23 15:30:00'),
(11, 16, 'Hallgatói kérések mindig jók', '2024-03-24 20:10:00'),
(12, 17, 'Top 40-ben jók a számok', '2024-03-24 12:45:00'),
(13, 18, 'Jazz este tökéletes lazításhoz', '2024-03-25 21:35:00'),
(14, 19, 'Indie műsor hiánypótló', '2024-03-25 19:25:00'),
(15, 20, 'Vasárnap reggel ideális zene', '2024-03-26 10:15:00'),
(16, 6, 'Ez a Queen szám örök!', '2024-03-26 06:55:00'),
(17, 7, 'Lehetne hosszabb a műsor', '2024-03-26 18:40:00'),
(18, 8, 'Nagyon jó hangulat volt', '2024-03-27 20:50:00'),
(19, 9, 'Köszi a kérést, lejátszottátok!', '2024-03-27 20:55:00'),
(20, 10, 'Csak így tovább!', '2024-03-28 19:00:00');