import { HttpClient } from '@angular/common/http';
import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { Music } from './models/music.model';

@Injectable({
  providedIn: 'root',
})
export class MusicService {
  private readonly http = inject(HttpClient);
  private readonly apiUrl = 'http://127.0.0.1:8000/api/dalok';

  getMusics(): Observable<Music[]> {
    return this.http.get<Music[]>(this.apiUrl);
  }
}
