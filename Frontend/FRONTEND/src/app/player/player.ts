import { Component, effect, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PlaylistStateService } from '../playlist-state.service';

@Component({
  selector: 'app-player',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './player.html',
  styleUrl: './player.css',
})
export class Player {
  private readonly playlistState = inject(PlaylistStateService);

  readonly selectedSong = this.playlistState.selectedSong;
  readonly selectedPlaylist = this.playlistState.selectedPlaylist;
  readonly currentIndex = this.playlistState.selectedSongIndex;
  readonly canGoPrevious = this.playlistState.canGoPrevious;
  readonly canGoNext = this.playlistState.canGoNext;
  readonly isPlaying = signal(false);
  readonly currentSongTitle = signal('Nincs kiválasztott zene');

  constructor() {
    effect(() => {
      const song = this.selectedSong();
      this.currentSongTitle.set(song?.cim?.trim() || 'Nincs kiválasztott zene');
      this.isPlaying.set(false);
    });
  }

  togglePlay(): void {
    if (!this.selectedSong()) {
      return;
    }

    this.isPlaying.update((value) => !value);
  }

  previousSong(): void {
    this.playlistState.selectPreviousSong();
    if (this.selectedSong()) {
      this.isPlaying.set(true);
    }
  }

  nextSong(): void {
    this.playlistState.selectNextSong();
    if (this.selectedSong()) {
      this.isPlaying.set(true);
    }
  }
}
