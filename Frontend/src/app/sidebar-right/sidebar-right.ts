import { Component, OnInit, computed, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MusicService } from '../music-service';
import { Music } from '../models/music.model';
import { PlaylistStateService } from '../playlist-state.service';
import { AuthStateService } from '../auth-state.service';

@Component({
  selector: 'app-sidebar-right',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './sidebar-right.html',
  styleUrls: ['./sidebar-right.css'],
})
export class SidebarRight implements OnInit {
  private readonly musicService = inject(MusicService);
  readonly playlistState = inject(PlaylistStateService);
  private readonly authState = inject(AuthStateService);

  readonly musics = signal<Music[]>([]);
  readonly searchTerm = signal('');
  readonly filteredMusics = computed(() => {
    const term = this.searchTerm().trim().toLowerCase();
    if (!term) {
      return this.musics();
    }

    return this.musics().filter((music) => music.cim.toLowerCase().includes(term));
  });

  ngOnInit(): void {
    this.musicService.getMusics().subscribe({
      next: (data) => this.musics.set(data),
      error: () => this.playlistState.statusMessage.set('Nem sikerült betölteni a zenéket.'),
    });
  }

  selectSong(song: Music): void {
    this.playlistState.selectSong(song);
  }

  addSelectedSong(song: Music): void {
    const user = this.authState.user();
    const playlistId = this.playlistState.selectedPlaylistId();

    if (!user) {
      this.playlistState.statusMessage.set('A hozzáadáshoz jelentkezz be.');
      return;
    }

    if (!playlistId) {
      this.playlistState.statusMessage.set('Előbb válassz ki egy lejátszási listát bal oldalon.');
      return;
    }

    this.playlistState.addSongToPlaylist(playlistId, song.id, user.id).subscribe({
      next: () => this.playlistState.selectSong(song),
      error: (error) => this.playlistState.statusMessage.set(error.error?.message ?? 'Nem sikerült hozzáadni a zenét.'),
    });
  }
}
