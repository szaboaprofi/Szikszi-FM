import { Injectable, computed, inject, signal } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { tap } from 'rxjs/operators';
import { Observable, of } from 'rxjs';
import { CustomPlaylist } from './models/custom-playlist.model';
import { Music } from './models/music.model';

@Injectable({ providedIn: 'root' })
export class PlaylistStateService {
  private readonly http = inject(HttpClient);
  private readonly apiUrl = 'http://127.0.0.1:8000/api/lejatszolistak';

  readonly playlists = signal<CustomPlaylist[]>([]);
  readonly selectedPlaylistId = signal<number | null>(null);
  readonly selectedSong = signal<Music | null>(null);
  readonly statusMessage = signal('');
  readonly selectedPlaylist = computed(
    () => this.playlists().find((playlist) => playlist.id === this.selectedPlaylistId()) ?? null
  );
  readonly selectedPlaylistSongs = computed(() => this.selectedPlaylist()?.tetelek ?? []);
  readonly selectedSongIndex = computed(() => {
    const songId = this.selectedSong()?.id;
    if (!songId) {
      return -1;
    }

    return this.selectedPlaylistSongs().findIndex((item) => item.dal.id === songId);
  });
  readonly selectedComments = computed(() => this.selectedPlaylist()?.kommentek ?? []);
  readonly canGoPrevious = computed(() => this.selectedSongIndex() > 0);
  readonly canGoNext = computed(() => {
    const idx = this.selectedSongIndex();
    const count = this.selectedPlaylistSongs().length;
    return idx >= 0 && idx < count - 1;
  });

  loadPlaylists(userId: number | null): Observable<CustomPlaylist[]> {
    if (!userId) {
      this.playlists.set([]);
      this.selectedPlaylistId.set(null);
      this.selectedSong.set(null);
      return of([]);
    }

    return this.http.get<CustomPlaylist[]>(`${this.apiUrl}/user/${userId}`).pipe(
      tap((playlists) => {
        this.playlists.set(playlists);
        if (!playlists.some((playlist) => playlist.id === this.selectedPlaylistId())) {
          this.selectedPlaylistId.set(playlists[0]?.id ?? null);
        }

        const currentSongId = this.selectedSong()?.id;
        const currentPlaylist = playlists.find((playlist) => playlist.id === this.selectedPlaylistId()) ?? null;
        const currentSongStillExists = !!currentPlaylist?.tetelek.some((item) => item.dal.id === currentSongId);

        if (!currentSongStillExists) {
          this.selectedSong.set(currentPlaylist?.tetelek[0]?.dal ?? null);
        }
      })
    );
  }

  createPlaylist(userId: number, nev: string): Observable<{ success: boolean; message: string }> {
    return this.http.post<{ success: boolean; message: string }>(`${this.apiUrl}/create-playlist`, {
      felhasznalo_id: userId,
      nev,
    }).pipe(
      tap((response) => this.statusMessage.set(response.message)),
      tap(() => {
        this.loadPlaylists(userId).subscribe({ next: () => undefined, error: () => undefined });
      })
    );
  }

  addSongToPlaylist(playlistId: number, dalId: number, userId: number): Observable<{ success: boolean; message: string }> {
    return this.http.post<{ success: boolean; message: string }>(`${this.apiUrl}/${playlistId}/songs`, {
      dal_id: dalId,
    }).pipe(
      tap((response) => this.statusMessage.set(response.message)),
      tap(() => {
        this.loadPlaylists(userId).subscribe({ next: () => undefined, error: () => undefined });
      })
    );
  }

  removeSongFromPlaylist(playlistId: number, tetelId: number, userId: number): Observable<{ success: boolean; message: string }> {
    return this.http.delete<{ success: boolean; message: string }>(`${this.apiUrl}/${playlistId}/songs/${tetelId}`).pipe(
      tap((response) => this.statusMessage.set(response.message)),
      tap(() => {
        this.loadPlaylists(userId).subscribe({ next: () => undefined, error: () => undefined });
      })
    );
  }

  deletePlaylist(playlistId: number, userId: number): Observable<{ success: boolean; message: string }> {
    return this.http.delete<{ success: boolean; message: string }>(`${this.apiUrl}/${playlistId}/delete-playlist`).pipe(
      tap((response) => this.statusMessage.set(response.message)),
      tap(() => {
        this.loadPlaylists(userId).subscribe({ next: () => undefined, error: () => undefined });
      })
    );
  }

  addComment(playlistId: number, felhasznaloId: number, uzenet: string, userId: number): Observable<{ success: boolean; message: string }> {
    return this.http.post<{ success: boolean; message: string }>(`${this.apiUrl}/${playlistId}/comments`, {
      felhasznalo_id: felhasznaloId,
      uzenet,
    }).pipe(
      tap((response) => this.statusMessage.set(response.message)),
      tap(() => {
        this.loadPlaylists(userId).subscribe({ next: () => undefined, error: () => undefined });
      })
    );
  }

  selectPlaylist(playlistId: number): void {
    this.selectedPlaylistId.set(playlistId);
    const firstSong = this.playlists().find((playlist) => playlist.id === playlistId)?.tetelek[0]?.dal ?? null;
    this.selectedSong.set(firstSong);
  }

  selectSong(song: Music): void {
    this.selectedSong.set(song);
  }

  selectSongByIndex(index: number): void {
    const song = this.selectedPlaylistSongs()[index]?.dal ?? null;
    if (song) {
      this.selectedSong.set(song);
    }
  }

  selectPreviousSong(): void {
    const index = this.selectedSongIndex();
    if (index > 0) {
      this.selectSongByIndex(index - 1);
    }
  }

  selectNextSong(): void {
    const index = this.selectedSongIndex();
    if (index >= 0 && index < this.selectedPlaylistSongs().length - 1) {
      this.selectSongByIndex(index + 1);
    }
  }

  clearSongSelection(): void {
    this.selectedSong.set(null);
  }
}
