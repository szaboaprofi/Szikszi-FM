import { HttpClient } from '@angular/common/http';
import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { Musor } from './models/musor.model';

@Injectable({
  providedIn: 'root',
})
export class MusorService {
  private readonly http = inject(HttpClient);
  private readonly apiUrl = 'http://127.0.0.1:8000/api/musorok';

  getMusorok(): Observable<Musor[]> {
    return this.http.get<Musor[]>(this.apiUrl);
  }
}
