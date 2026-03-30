import { Music } from './music.model';

export interface CustomPlaylistComment {
  id: number;
  lejatszolista_id: number;
  felhasznalo_id: number;
  uzenet: string;
  letrehozva: string;
  felhasznalo?: {
    id: number;
    felhasznalonev: string;
    email: string;
  };
}

export interface CustomPlaylistItem {
  id: number;
  lejatszolista_id: number;
  dal_id: number;
  sorrend_szam: number;
  dal: Music;
}

export interface CustomPlaylist {
  id: number;
  felhasznalo_id: number;
  nev: string;
  letrehozva: string;
  tetelek: CustomPlaylistItem[];
  kommentek: CustomPlaylistComment[];
}
