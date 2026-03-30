import { HttpClient } from '@angular/common/http';
import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { Musorvezeto } from './models/musorvezeto.model';

@Injectable({
  providedIn: 'root',
})
export class MusorvezetoService {
  private readonly http = inject(HttpClient);
  private readonly apiUrl = 'http://127.0.0.1:8000/api/musorvezetok';

  getMusorvezetok(): Observable<Musorvezeto[]> {
    return this.http.get<Musorvezeto[]>(this.apiUrl);
  }
}
