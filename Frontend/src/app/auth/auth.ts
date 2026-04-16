import { CommonModule } from '@angular/common';
import { Component, computed, inject, signal } from '@angular/core';
import { AbstractControl, FormBuilder, ReactiveFormsModule, ValidationErrors, Validators } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { AuthService } from './auth.service';
import { AuthStateService } from '../auth-state.service';
import { PlaylistStateService } from '../playlist-state.service';

function passwordMatchValidator(control: AbstractControl): ValidationErrors | null {
  const password = control.get('password')?.value;
  const confirmPassword = control.get('confirmPassword')?.value;

  if (!password || !confirmPassword) {
    return null;
  }

  return password === confirmPassword ? null : { passwordMismatch: true };
}

@Component({
  selector: 'app-auth',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, RouterLink],
  templateUrl: './auth.html',
  styleUrl: './auth.css',
})
export class Auth {
  private readonly fb = inject(FormBuilder);
  private readonly authService = inject(AuthService);
  private readonly authState = inject(AuthStateService);
  private readonly playlistState = inject(PlaylistStateService);
  private readonly router = inject(Router);

  readonly isLoginMode = signal(true);
  readonly loading = signal(false);
  readonly error = signal('');
  readonly message = signal('');
  readonly registerPasswordMismatch = computed(() => {
    const form = this.registerForm;
    return !!form.errors?.['passwordMismatch'] && (form.touched || form.dirty);
  });

  readonly loginForm = this.fb.nonNullable.group({
    email: ['', [Validators.required, Validators.email]],
    password: ['', [Validators.required, Validators.minLength(6)]],
  });

  readonly registerForm = this.fb.nonNullable.group(
    {
      felhasznalonev: ['', [Validators.required, Validators.minLength(3)]],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]],
      confirmPassword: ['', [Validators.required]],
    },
    { validators: passwordMatchValidator }
  );

  toggleMode(): void {
    this.isLoginMode.update((current) => !current);
    this.error.set('');
    this.message.set('');
    this.loginForm.markAsUntouched();
    this.registerForm.markAsUntouched();
  }

  submitLogin(): void {
    if (this.loginForm.invalid) {
      this.loginForm.markAllAsTouched();
      return;
    }

    this.loading.set(true);
    this.error.set('');
    this.message.set('');

    this.authService.login(this.loginForm.getRawValue()).subscribe({
      next: (response) => {
        this.authState.setUser(response.user);
        this.playlistState.loadPlaylists(response.user.id).subscribe({ next: () => undefined, error: () => undefined });
        this.message.set(response.message);
        this.loading.set(false);
        this.router.navigateByUrl('/');
      },
      error: (error) => {
        this.loading.set(false);
        this.error.set(error.error?.message ?? 'Sikertelen bejelentkezés.');
      },
    });
  }

  submitRegister(): void {
    if (this.registerForm.invalid) {
      this.registerForm.markAllAsTouched();
      return;
    }

    const { password, confirmPassword, felhasznalonev, email } = this.registerForm.getRawValue();
    if (password !== confirmPassword) {
      this.error.set('A két jelszó nem egyezik meg.');
      return;
    }

    this.loading.set(true);
    this.error.set('');
    this.message.set('');

    this.authService.register({ felhasznalonev, email, password }).subscribe({
      next: (response) => {
        this.authState.setUser(response.user);
        this.playlistState.loadPlaylists(response.user.id).subscribe({ next: () => undefined, error: () => undefined });
        this.message.set(response.message);
        this.loading.set(false);
        this.router.navigateByUrl('/');
      },
      error: (error) => {
        this.loading.set(false);
        this.error.set(error.error?.message ?? 'Sikertelen regisztráció.');
      },
    });
  }
}
