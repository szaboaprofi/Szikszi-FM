import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MusorvezetoService } from '../musorvezeto-service';
import { catchError, of } from 'rxjs';

@Component({
  selector: 'app-musorvezetok-page',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './musorvezetok-page.html',
  styleUrl: './musorvezetok-page.css',
})
export class MusorvezetokPage {
  private readonly musorvezetoService = inject(MusorvezetoService);

  readonly musorvezetok$ = this.musorvezetoService.getMusorvezetok().pipe(catchError(() => of([])));
}
