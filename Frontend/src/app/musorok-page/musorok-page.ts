import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { combineLatest, map, catchError, of } from 'rxjs';
import { MusorService } from '../musor-service';
import { MusorvezetoService } from '../musorvezeto-service';
import { PlaylistService } from '../playlist-service';
import { MusicService } from '../music-service';
import { Playlist } from '../models/playlist.model';
import { Music } from '../models/music.model';

type NapiMusor = {
  nap: string;
  cim: string;
  leiras: string;
  musorvezeto: string;
  dalok: Music[];
};

@Component({
  selector: 'app-musorok-page',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './musorok-page.html',
  styleUrl: './musorok-page.css',
})
export class MusorokPage {
  private readonly musorService = inject(MusorService);
  private readonly musorvezetoService = inject(MusorvezetoService);
  private readonly playlistService = inject(PlaylistService);
  private readonly musicService = inject(MusicService);

  readonly hetiMusorok$ = combineLatest([
    this.musorService.getMusorok(),
    this.musorvezetoService.getMusorvezetok(),
    this.playlistService.getPlaylists(),
    this.musicService.getMusics(),
  ]).pipe(
    map(([musorok, musorvezetok, lejatszolistak, dalok]) => {
      const napok = ['Hétfő', 'Kedd', 'Szerda', 'Csütörtök', 'Péntek', 'Szombat', 'Vasárnap'];

      return napok.map((nap, index) => {
        const musor = musorok[(index * 3 + 1) % musorok.length];
        const musorvezeto = musorvezetok.find((item) => item.id === musor.musorvezeto_id);
        const dalokAzAdashoz = this.randomizeSongsForShow(musor.id, lejatszolistak, dalok, index);

        return {
          nap,
          cim: musor.cim,
          leiras: musor.leiras,
          musorvezeto: musorvezeto?.nev ?? 'Ismeretlen műsorvezető',
          dalok: dalokAzAdashoz,
        };
      });
    }),
    catchError(() => of([] as NapiMusor[])),
  );

  private randomizeSongsForShow(
    musorId: number,
    lejatszolistak: Playlist[],
    dalok: Music[],
    seed: number,
  ): Music[] {
    const showSongs = lejatszolistak
      .filter((playlist) => playlist.musor_id === musorId)
      .sort((a, b) => a.sorrend_szam - b.sorrend_szam)
      .map((playlist) => playlist.dal ?? dalok.find((dal) => dal.id === playlist.dal_id))
      .filter((dal): dal is Music => !!dal);

    if (showSongs.length >= 3) {
      return this.rotate(showSongs, seed).slice(0, 4);
    }

    return this.rotate(dalok, seed).slice(0, 4);
  }

  private rotate<T>(items: T[], seed: number): T[] {
    if (!items.length) {
      return [];
    }

    const offset = seed % items.length;
    return [...items.slice(offset), ...items.slice(0, offset)];
  }
}
