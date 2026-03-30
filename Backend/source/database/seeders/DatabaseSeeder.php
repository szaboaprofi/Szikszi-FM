<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Uzenet;
use App\Models\Felhasznalo;
use App\Models\Musorvezeto;
use App\Models\Dal;
use App\Models\Musor;
use App\Models\Lejatszolista;


class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $dalok=
        [
            [1, 'Queen', 'Bohemian Rhapsody', '00:05:55'],
            [2, 'Metallica', 'Nothing Else Matters', '00:06:28'],
            [3, 'Coldplay', 'Fix You', '00:04:55'],
            [4, 'Adele', 'Someone Like You', '00:04:45'],
            [5, 'Daft Punk', 'Get Lucky', '00:06:07'],
            [6, 'Pink Floyd', 'Wish You Were Here', '00:05:34'],
            [7, 'Nirvana', 'Come As You Are', '00:03:39'],
            [8, 'The Beatles', 'Let It Be', '00:04:03'],
            [9, 'U2', 'Beautiful Day', '00:04:08'],
            [10, 'Red Hot Chili Peppers', 'Under The Bridge', '00:04:24'],
            [11, 'Imagine Dragons', 'Radioactive', '00:03:06'],
            [12, 'AC/DC', 'Highway to Hell', '00:03:28'],
            [13, 'Eminem', 'Stan', '00:06:44'],
            [14, 'Madonna', 'Frozen', '00:06:12'],
            [15, 'Linkin Park', 'In The End', '00:03:36'],
            [16, 'Hans Zimmer', 'Time', '00:04:35'],
            [17, 'Lana Del Rey', 'Video Games', '00:04:42'],
            [18, 'Depeche Mode', 'Enjoy the Silence', '00:04:15'],
            [19, 'Radiohead', 'No Surprises', '00:03:49'],
            [20, 'Bon Jovi', 'Always', '00:05:53'],
            [21, 'Arctic Monkeys', 'Do I Wanna Know?', '00:04:32'],
            [22, 'Billie Eilish', 'bad guy', '00:03:14'],
            [23, 'The Weeknd', 'Blinding Lights', '00:03:20'],
            [24, 'Bruno Mars', 'Uptown Funk', '00:04:30'],
            [25, 'Ed Sheeran', 'Shape of You', '00:03:53'],
            [26, 'Post Malone', 'Circles', '00:03:35'],
            [27, 'Taylor Swift', 'Blank Space', '00:03:51'],
            [28, 'Dua Lipa', 'Levitating', '00:03:23'],
            [29, 'Shawn Mendes', 'Stitches', '00:03:26'],
            [30, 'Sam Smith', 'Stay With Me', '00:02:52'],
            [31, 'Kanye West', 'Stronger', '00:05:12'],
            [32, 'Drake', 'God\'s Plan', '00:03:18'],
            [33, 'Travis Scott', 'SICKO MODE', '00:05:12'],
            [34, 'Jay-Z', 'Empire State of Mind', '00:04:36'],
            [35, 'Rihanna', 'Diamonds', '00:03:45'],
            [36, 'Sia', 'Chandelier', '00:03:36'],
            [37, 'Lady Gaga', 'Poker Face', '00:03:57'],
            [38, 'Katy Perry', 'Firework', '00:03:48'],
            [39, 'Maroon 5', 'Sugar', '00:03:55'],
            [40, 'OneRepublic', 'Counting Stars', '00:04:17'],
            [41, 'Oasis', 'Wonderwall', '00:04:18'],
            [42, 'Blur', 'Song 2', '00:02:02'],
            [43, 'The Killers', 'Mr. Brightside', '00:03:42'],
            [44, 'Muse', 'Starlight', '00:03:59'],
            [45, 'Green Day', 'Boulevard of Broken Dreams', '00:04:20'],
            [46, 'Fall Out Boy', 'Centuries', '00:03:48'],
            [47, 'My Chemical Romance', 'Welcome to the Black Parade', '00:05:11'],
            [48, 'Paramore', 'Misery Business', '00:03:31'],
            [49, 'Thirty Seconds to Mars', 'The Kill', '00:03:51'],
            [50, 'Kings of Leon', 'Sex on Fire', '00:03:24'],
            [51, 'Avicii', 'Wake Me Up', '00:04:09'],
            [52, 'Calvin Harris', 'Summer', '00:03:44'],
            [53, 'David Guetta', 'Titanium', '00:04:05'],
            [54, 'Martin Garrix', 'Animals', '00:02:56'],
            [55, 'Swedish House Mafia', 'Don\'t You Worry Child', '00:03:32'],
            [56, 'Kygo', 'Firestone', '00:04:33'],
            [57, 'Alan Walker', 'Faded', '00:03:32'],
            [58, 'Zedd', 'Clarity', '00:04:31'],
            [59, 'Deadmau5', 'Strobe', '00:10:37'],
            [60, 'Marshmello', 'Alone', '00:03:20'],
            [61, 'Elton John', 'Rocket Man', '00:04:41'],
            [62, 'Michael Jackson', 'Billie Jean', '00:04:54'],
            [63, 'Whitney Houston', 'I Will Always Love You', '00:04:31'],
            [64, 'Prince', 'Purple Rain', '00:08:41'],
            [65, 'David Bowie', 'Heroes', '00:03:36'],
            [66, 'Fleetwood Mac', 'Dreams', '00:04:17'],
            [67, 'Eagles', 'Hotel California', '00:06:30'],
            [68, 'The Rolling Stones', 'Paint It Black', '00:03:22'],
            [69, 'ABBA', 'Dancing Queen', '00:03:51'],
            [70, 'Bee Gees', 'Stayin\' Alive', '00:04:45'],
            [71, 'Frank Sinatra', 'My Way', '00:04:35'],
            [72, 'Bob Marley', 'No Woman No Cry', '00:04:07'],
            [73, 'Sting', 'Shape of My Heart', '00:04:39'],
            [74, 'Phil Collins', 'In the Air Tonight', '00:05:36'],
            [75, 'Eric Clapton', 'Tears in Heaven', '00:04:33'],
            [76, 'George Michael', 'Careless Whisper', '00:05:04'],
            [77, 'A-ha', 'Take On Me', '00:03:48'],
            [78, 'Toto', 'Africa', '00:04:55'],
            [79, 'Simple Minds', 'Don\'t You Forget About Me', '00:04:20'],
            [80, 'Survivor', 'Eye of the Tiger', '00:04:05']
        ];
        foreach($dalok as $key=>$value)
            {
                Dal::create([
                    'id'=>$value[0],
                    'eloado'=>$value[1],
                    'cim'=>$value[2],
                    'hossza'=>$value[3]
                ]);
            }
        $felhasznalok=
        [
            [1, 'kovacs_admin', 'kovacs.admin@gmail.com', 'hash_admin1', 'admin', '2024-01-10 09:12:00'],
            [2, 'szabo_admin', 'szabo.admin@gmail.com', 'hash_admin2', 'admin', '2024-01-11 10:45:00'],
            [3, 'kiss_peter', 'kiss.peter@gmail.com', 'hash_mp1', 'musorvezeto', '2024-02-01 08:00:00'],
            [4, 'nagy_anna', 'nagy.anna@gmail.com', 'hash_mp2', 'musorvezeto', '2024-02-02 08:30:00'],
            [5, 'toth_gabor', 'toth.gabor@gmail.com', 'hash_mp3', 'musorvezeto', '2024-02-03 09:00:00'],
            [6, 'balogh_rita', 'balogh.rita@gmail.com', 'hash_u1', 'felhasznalo', '2024-03-01 12:10:00'],
            [7, 'farkas_david', 'farkas.david@gmail.com', 'hash_u2', 'felhasznalo', '2024-03-02 14:22:00'],
            [8, 'horvath_eszt', 'horvath.eszter@gmail.com', 'hash_u3', 'felhasznalo', '2024-03-03 16:40:00'],
            [9, 'nagy_laszlo', 'nagy.laszlo@gmail.com', 'hash_u4', 'felhasznalo', '2024-03-04 18:00:00'],
            [10, 'szucs_petra', 'szucs.petra@gmail.com', 'hash_u5', 'felhasznalo', '2024-03-05 19:30:00'],
            [11, 'molnar_akos', 'molnar.akos@gmail.com', 'hash_u6', 'felhasznalo', '2024-03-06 20:10:00'],
            [12, 'varga_reka', 'varga.reka@gmail.com', 'hash_u7', 'felhasznalo', '2024-03-07 21:15:00'],
            [13, 'papp_mate', 'papp.mate@gmail.com', 'hash_u8', 'felhasznalo', '2024-03-08 22:00:00'],
            [14, 'lukacs_bence', 'lukacs.bence@gmail.com', 'hash_u9', 'felhasznalo', '2024-03-09 11:25:00'],
            [15, 'sipos_anna', 'sipos.anna@gmail.com', 'hash_u10', 'felhasznalo', '2024-03-10 10:50:00'],
            [16, 'kerekes_juli', 'kerekes.julia@gmail.com', 'hash_u11', 'felhasznalo', '2024-03-11 09:45:00'],
            [17, 'nagy_marton', 'nagy.marton@gmail.com', 'hash_u12', 'felhasznalo', '2024-03-12 08:35:00'],
            [18, 'boros_kata', 'boros.kata@gmail.com', 'hash_u13', 'felhasznalo', '2024-03-13 13:00:00'],
            [19, 'racz_peter', 'racz.peter@gmail.com', 'hash_u14', 'felhasznalo', '2024-03-14 15:40:00'],
            [20, 'tamas_gergo', 'tamas.gergo@gmail.com', 'hash_u15', 'felhasznalo', '2024-03-15 17:55:00'],
            [21, 'kovacs_mark', 'kovacs.mark@gmail.com', 'hash_mp1', 'musorvezeto', '2024-02-01 08:00:00'],
            [22, 'szabo_dora', 'szabo.dora@gmail.com', 'hash_mp2', 'musorvezeto', '2024-02-02 08:30:00'],
            [23, 'farkas_bence', 'farkas.bence@gmail.com', 'hash_mp3', 'musorvezeto', '2024-02-03 09:00:00'],
            [24, 'varga_lilla', 'varga.lilla@gmail.com', 'hash_mp4', 'musorvezeto', '2024-02-04 09:30:00'],
            [25, 'horvath_adam', 'horvath.adam@gmail.com', 'hash_mp5', 'musorvezeto', '2024-02-05 10:00:00'],
            [26, 'molnar_zoltan', 'molnar.zoltan@gmail.com', 'hash_mp6', 'musorvezeto', '2024-02-06 10:30:00'],
            [27, 'toth_reka', 'toth.reka@gmail.com', 'hash_mp7', 'musorvezeto', '2024-02-07 11:00:00'],
            [28, 'balogh_levente', 'balogh.levente@gmail.com', 'hash_mp8', 'musorvezeto', '2024-02-08 11:30:00'],
            [29, 'nemeth_david', 'nemeth.david@gmail.com', 'hash_mp9', 'musorvezeto', '2024-02-09 12:00:00'],
            [30, 'papp_gergo', 'papp.gergo@gmail.com', 'hash_mp10', 'musorvezeto', '2024-02-10 12:30:00'],
            [31, 'lakatos_eszter', 'lakatos.eszter@gmail.com', 'hash_mp11', 'musorvezeto', '2024-02-11 13:00:00'],
            [32, 'juhasz_peter', 'juhasz.peter@gmail.com', 'hash_mp12', 'musorvezeto', '2024-02-12 13:30:00'],
            [33, 'kiss_roland', 'kiss.roland@gmail.com', 'hash_mp13', 'musorvezeto', '2024-02-13 14:00:00'],
            [34, 'szalai_nora', 'szalai.nora@gmail.com', 'hash_mp14', 'musorvezeto', '2024-02-14 14:30:00'],
            [35, 'boros_andras', 'boros.andras@gmail.com', 'hash_mp15', 'musorvezeto', '2024-02-15 15:00:00'],
            [36, 'kerekes_tamas', 'kerekes.tamas@gmail.com', 'hash_mp16', 'musorvezeto', '2024-02-16 15:30:00'],
            [37, 'sipos_zsofia', 'sipos.zsofia@gmail.com', 'hash_mp17', 'musorvezeto', '2024-02-17 16:00:00'],
            [38, 'racz_viktor', 'racz.viktor@gmail.com', 'hash_mp18', 'musorvezeto', '2024-02-18 16:30:00'],
            [39, 'toth_mate', 'toth.mate@gmail.com', 'hash_mp19', 'musorvezeto', '2024-02-19 17:00:00'],
            [40, 'gal_petra', 'gal.petra@gmail.com', 'hash_mp20', 'musorvezeto', '2024-02-20 17:30:00']
        ];
        foreach($felhasznalok as $key=>$value)
                {
                    Felhasznalo::create([
                        'id'=>$value[0],
                        'felhasznalonev'=>$value[1],
                        'email'=>$value[2],
                        'jelszo'=>$value[3],
                        'szerep'=>$value[4],
                        'letrehozva'=>$value[5]
                        ]);
                }
        $musorvezetok=
        [
            [1, 'Kovács Márk', 'Reggeli műsorvezető, 10 éve rádiózik', 21],
            [2, 'Szabó Dóra', 'Pop és mainstream zenei szerkesztő', 22],
            [3, 'Farkas Bence', 'Rock és metal szakértő', 23],
            [4, 'Varga Lilla', 'Beszélgetős műsorok házigazdája', 24],
            [5, 'Horváth Ádám', 'Esti zenei műsorok', 25],
            [6, 'Molnár Zoltán', 'Alternatív és underground zene', 26],
            [7, 'Tóth Réka', 'Retró műsorok vezetése', 27],
            [8, 'Balogh Levente', 'Toplisták és slágerek', 28],
            [9, 'Németh Dávid', 'Elektronikus zenei blokk', 29],
            [10, 'Papp Gergő', 'Interjúk zenészekkel', 30],
            [11, 'Lakatos Eszter', 'Akusztikus műsor', 31],
            [12, 'Juhász Péter', 'Metal tematikus est', 32],
            [13, 'Kiss Roland', 'Filmzenék és sorozatzene', 33],
            [14, 'Szalai Nóra', 'Női előadók műsora', 34],
            [15, 'Boros András', 'Chillout és lounge', 35],
            [16, 'Kerekes Tamás', 'Világzenei válogatás', 36],
            [17, 'Sipos Zsófia', 'Magyar könnyűzene', 37],
            [18, 'Rácz Viktor', 'Jazz és blues', 38],
            [19, 'Tóth Máté', 'Éjszakai mix', 39],
            [20, 'Gál Petra', 'Hallgatói kérések', 40]   
        ];
        foreach($musorvezetok as $key=>$value)
            {
                Musorvezeto::create([
                    'id'=>$value[0],
                    'nev'=>$value[1],
                    'bemutatkozas'=>$value[2],
                    'felhasznalo_id'=>$value[3]
                    ]);
                
            }
        $musorok=
        [
            [1, 'Reggeli Start', 'Hírek, zene és beszélgetés', 1, '2024-02-10 06:00:00'],
            [2, 'Pop Slágerek', 'Aktuális nemzetközi slágerek', 2, '2024-02-11 10:00:00'],
            [3, 'Rock Műhely', 'Klasszikus és modern rock', 3, '2024-02-12 18:00:00'],
            [4, 'Esti Jazz', 'Nyugodt jazz válogatás', 18, '2024-02-13 21:00:00'],
            [5, 'Elektronikus Pulzus', 'House és techno', 9, '2024-02-14 22:00:00'],
            [6, 'Retró Rádió', '80-as és 90-es évek slágerei', 7, '2024-02-15 16:00:00'],
            [7, 'Magyar Hangok', 'Hazai előadók', 17, '2024-02-16 14:00:00'],
            [8, 'Akusztik Live', 'Akusztikus felvételek', 11, '2024-02-17 20:00:00'],
            [9, 'Metal Est', 'Heavy és thrash metal', 12, '2024-02-18 23:00:00'],
            [10, 'Filmzene Klub', 'Ismert filmzenék', 13, '2024-02-19 19:00:00'],
            [11, 'Girl Power', 'Női előadók', 14, '2024-02-20 15:00:00'],
            [12, 'Chill Zone', 'Relax és lounge', 15, '2024-02-21 22:00:00'],
            [13, 'Világjáró', 'Világzenei válogatás', 16, '2024-02-22 17:00:00'],
            [14, 'Top 40', 'Heti slágerlista', 8, '2024-02-23 12:00:00'],
            [15, 'Interjú Plusz', 'Zenészek és vendégek', 10, '2024-02-24 18:30:00'],
            [16, 'Éjszakai Mix', 'Késő esti elektronikus zene', 19, '2024-02-25 23:30:00'],
            [17, 'Hallgatói Kérések', 'Kívánságműsor', 20, '2024-02-26 20:00:00'],
            [18, 'Blues Sarok', 'Blues klasszikusok', 18, '2024-02-27 21:30:00'],
            [19, 'Indie Hullám', 'Indie és alternatív', 6, '2024-02-28 19:00:00'],
            [20, 'Vasárnapi Lazítás', 'Nyugodt vasárnapi zene', 15, '2024-02-29 10:00:00']
        ];
        foreach($musorok as $key=>$value)
            {
                Musor::create([
                    'id'=>$value[0],
                    'cim'=>$value[1],
                    'leiras'=>$value[2],
                    'musorvezeto_id'=>$value[3],
                    'letrehozva'=>$value[4]
                ]);
            }
        $uzenetek=
        [
            [1, 6, 'Nagyon jó a reggeli műsor, feldobja a napom!', '2024-03-20 06:45:00'],
            [2, 7, 'Köszi a rock válogatást!', '2024-03-20 18:30:00'],
            [3, 8, 'Ez a dal mindig libabőr', '2024-03-20 21:05:00'],
            [4, 9, 'Lehetne több magyar zene?', '2024-03-21 14:10:00'],
            [5, 10, 'Szuper volt az interjú!', '2024-03-21 19:40:00'],
            [6, 11, 'Imádom a chill zenéket este', '2024-03-21 22:15:00'],
            [7, 12, 'Retró műsor = gyerekkor ❤️', '2024-03-22 16:20:00'],
            [8, 13, 'Metal est nagyon ütött!', '2024-03-22 23:50:00'],
            [9, 14, 'Köszi a filmzenéket!', '2024-03-23 19:05:00'],
            [10, 15, 'Ez a női előadós műsor nagyon jó', '2024-03-23 15:30:00'],
            [11, 16, 'Hallgatói kérések mindig jók', '2024-03-24 20:10:00'],
            [12, 17, 'Top 40-ben jók a számok', '2024-03-24 12:45:00'],
            [13, 18, 'Jazz este tökéletes lazításhoz', '2024-03-25 21:35:00'],
            [14, 19, 'Indie műsor hiánypótló', '2024-03-25 19:25:00'],
            [15, 20, 'Vasárnap reggel ideális zene', '2024-03-26 10:15:00'],
            [16, 6, 'Ez a Queen szám örök!', '2024-03-26 06:55:00'],
            [17, 7, 'Lehetne hosszabb a műsor', '2024-03-26 18:40:00'],
            [18, 8, 'Nagyon jó hangulat volt', '2024-03-27 20:50:00'],
            [19, 9, 'Köszi a kérést, lejátszottátok!', '2024-03-27 20:55:00'],
            [20, 10, 'Csak így tovább!', '2024-03-28 19:00:00']
        ];
            foreach($uzenetek as $key=>$value)
                {
                    Uzenet::create([
                        'id'=>$value[0],
                        'felhasznalo_id'=>$value[1],
                        'uzenet'=>$value[2],
                        'letrehozva'=>$value[3]
                        ]);
                }
        $lejatszolistak = 
        [
            [1, 'Rock Antológia 1', 1, 1, 1],      
            [2, 'Pop Slágerek 2026', 8, 2, 1],
            [3, '80s Retro Mix', 3, 1, 2],
            [4, 'Chill Lounge', 4, 2, 2],
            [5, 'Party Mix Vol.1', 2, 1, 3],
            [6, 'Nyári Slágerek', 12, 2, 3],
            [7, 'Klasszikus Rock', 6, 1, 6],
            [8, 'Dance Mania', 18, 2, 6],
            [9, 'Acoustic Session', 16, 1, 10],
            [10, 'Hip-Hop Favorites', 5, 1, 5],
            [11, 'R&B Night', 11, 2, 5],
            [12, 'Punk Rock Antológia', 17, 1, 11],
            [13, 'Jazz Klub', 15, 1, 14],
            [14, 'Electronic Beats', 9, 2, 14],
            [15, 'Folk Akusztik', 13, 1, 9],
            [16, 'Wedding Mix', 19, 1, 19],
            [17, 'Party Deluxe', 7, 2, 19],
            [18, 'Road Trip', 20, 1, 17],
            [19, 'Love Songs', 10, 1, 7],
            [20, 'Workout Energy', 14, 1, 12]
        ];

            foreach($lejatszolistak as $value)  
                {
                    Lejatszolista::create([
                        'id' => $value[0],
                        'nev' => $value[1],           
                        'dal_id' => $value[2],       
                        'sorrend_szam' => $value[3],  
                        'musor_id' => $value[4]       
                        ]);
                }
  
    }
}
