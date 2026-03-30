import { Component, effect, inject } from '@angular/core';
import { SidebarLeft } from '../sidebar-left/sidebar-left';
import { SidebarRight } from '../sidebar-right/sidebar-right';
import { Comments } from '../comments/comments';
import { Player } from '../player/player';
import { AuthStateService } from '../auth-state.service';
import { PlaylistStateService } from '../playlist-state.service';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [SidebarLeft, SidebarRight, Comments, Player],
  templateUrl: './home.html',
  styleUrl: './home.css',
})
export class Home {
  private readonly authState = inject(AuthStateService);
  private readonly playlistState = inject(PlaylistStateService);

  constructor() {
    effect(() => {
      const user = this.authState.user();
      this.playlistState.loadPlaylists(user?.id ?? null).subscribe({
        next: () => undefined,
        error: () => undefined,
      });
    });
  }
}
