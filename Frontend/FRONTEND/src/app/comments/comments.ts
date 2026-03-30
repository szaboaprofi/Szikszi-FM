import { CommonModule } from '@angular/common';
import { Component, computed, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { AuthStateService } from '../auth-state.service';
import { PlaylistStateService } from '../playlist-state.service';

@Component({
  selector: 'app-comments',
  imports: [CommonModule, FormsModule],
  standalone: true,
  templateUrl: './comments.html',
  styleUrls: ['./comments.css'],
})
export class Comments {
  private readonly authState = inject(AuthStateService);
  readonly playlistState = inject(PlaylistStateService);

  readonly user = this.authState.user;
  readonly selectedPlaylist = this.playlistState.selectedPlaylist;
  readonly comments = this.playlistState.selectedComments;
  readonly newComment = signal('');
  readonly canSend = computed(() => !!this.user() && !!this.selectedPlaylist() && this.newComment().trim().length >= 2);

  addComment(): void {
    const user = this.user();
    const playlist = this.selectedPlaylist();
    const text = this.newComment().trim();

    if (!user || !playlist || text.length < 2) {
      this.playlistState.statusMessage.set('Komment írásához jelentkezz be, és válassz lejátszási listát.');
      return;
    }

    this.playlistState.addComment(playlist.id, user.id, text, user.id).subscribe({
      next: () => this.newComment.set(''),
      error: (error) => this.playlistState.statusMessage.set(error.error?.message ?? 'Nem sikerült menteni a kommentet.'),
    });
  }
}
