import { CommonModule } from '@angular/common';
import { Component, computed, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { AuthStateService } from '../auth-state.service';
import { PlaylistStateService } from '../playlist-state.service';

@Component({
  selector: 'app-sidebar-left',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './sidebar-left.html',
  styleUrls: ['./sidebar-left.css'],
})
export class SidebarLeft {
  private readonly authState = inject(AuthStateService);
  readonly playlistState = inject(PlaylistStateService);

  readonly user = this.authState.user;
  readonly playlists = this.playlistState.playlists;
  readonly selectedPlaylistId = this.playlistState.selectedPlaylistId;
  readonly selectedSong = this.playlistState.selectedSong;
  readonly selectedPlaylist = this.playlistState.selectedPlaylist;
  readonly statusMessage = this.playlistState.statusMessage;
  readonly newPlaylistName = signal('');
  readonly playlistNameError = signal('');
  readonly canCreate = computed(() => !!this.user() && this.newPlaylistName().trim().length >= 3);

  onPlaylistNameChange(value: string): void {
    this.newPlaylistName.set(value);
    const trimmed = value.trim();

    if (!trimmed.length) {
      this.playlistNameError.set('');
      return;
    }

    this.playlistNameError.set(trimmed.length < 3 ? 'A lejátszási lista neve legalább 3 karakter legyen.' : '');
  }

  createPlaylist(): void {
    const user = this.user();
    const nev = this.newPlaylistName().trim();

    if (!user) {
      this.playlistState.statusMessage.set('A lista létrehozásához be kell jelentkezni.');
      return;
    }

    if (nev.length < 3) {
      this.playlistNameError.set('A lejátszási lista neve legalább 3 karakter legyen.');
      this.playlistState.statusMessage.set('Hibás lejátszási lista név.');
      return;
    }

    this.playlistNameError.set('');
    this.playlistState.createPlaylist(user.id, nev).subscribe({
      next: () => {
        this.newPlaylistName.set('');
        this.playlistNameError.set('');
      },
      error: (error) => this.playlistState.statusMessage.set(error.error?.message ?? 'Nem sikerült létrehozni a listát.'),
    });
  }

  selectPlaylist(playlistId: number): void {
    this.playlistState.selectPlaylist(playlistId);
  }

  selectSong(index: number): void {
    this.playlistState.selectSongByIndex(index);
  }

  deletePlaylist(playlistId: number): void {
    const user = this.user();
    if (!user) {
      this.playlistState.statusMessage.set('A törléshez be kell jelentkezni.');
      return;
    }

    this.playlistState.deletePlaylist(playlistId, user.id).subscribe({
      error: (error) => this.playlistState.statusMessage.set(error.error?.message ?? 'Nem sikerült törölni a listát.'),
    });
  }

  removeSongFromPlaylist(tetelId: number): void {
    const user = this.user();
    const playlistId = this.selectedPlaylistId();

    if (!user || !playlistId) {
      this.playlistState.statusMessage.set('A törléshez be kell jelentkezni.');
      return;
    }

    this.playlistState.removeSongFromPlaylist(playlistId, tetelId, user.id).subscribe({
      error: (error) => this.playlistState.statusMessage.set(error.error?.message ?? 'Nem sikerült törölni a dalt a listából.'),
    });
  }
}
