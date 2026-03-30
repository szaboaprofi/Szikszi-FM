import { Injectable, computed, signal } from '@angular/core';
import { User } from './models/user.model';

@Injectable({ providedIn: 'root' })
export class AuthStateService {
  private readonly storageKey = 'szikszi_user';
  readonly user = signal<User | null>(this.readStoredUser());
  readonly isLoggedIn = computed(() => this.user() !== null);
  readonly displayName = computed(() => this.user()?.felhasznalonev ?? 'Bejelentkezés');

  setUser(user: User): void {
    this.user.set(user);
    localStorage.setItem(this.storageKey, JSON.stringify(user));
  }

  logout(): void {
    this.user.set(null);
    localStorage.removeItem(this.storageKey);
  }

  private readStoredUser(): User | null {
    const raw = localStorage.getItem(this.storageKey);
    if (!raw) {
      return null;
    }

    try {
      return JSON.parse(raw) as User;
    } catch {
      localStorage.removeItem(this.storageKey);
      return null;
    }
  }
}
