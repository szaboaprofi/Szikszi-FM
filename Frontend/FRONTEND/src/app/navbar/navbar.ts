import { Component, computed, inject } from '@angular/core';
import { Router, RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { AuthStateService } from '../auth-state.service';
import { PlaylistStateService } from '../playlist-state.service';

@Component({
  selector: 'app-navbar',
  standalone: true,
  imports: [RouterLink, FormsModule],
  templateUrl: './navbar.html',
  styleUrl: './navbar.css',
})
export class Navbar {
  private readonly authState = inject(AuthStateService);
  private readonly playlistState = inject(PlaylistStateService);
  private readonly router = inject(Router);

  readonly navLabel = computed(() => this.authState.displayName());
  readonly isLoggedIn = this.authState.isLoggedIn;
  readonly mobileMenuItems = [
    { label: 'Kezdőlap', path: '/' },
    { label: 'Rólunk', path: '/rolunk' },
    { label: 'Műsorvezetők', path: '/musorvezetok' },
    { label: 'Műsorok', path: '/musorok' },
  ];

  navigateFromSelect(path: string): void {
    if (path) {
      this.router.navigateByUrl(path);
    }
  }

  logout(): void {
    this.authState.logout();
    this.playlistState.statusMessage.set('Sikeres kijelentkezés.');
    this.playlistState.loadPlaylists(null).subscribe({
      next: () => undefined,
      error: () => undefined,
    });
    this.router.navigateByUrl('/');
  }
}
