import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Playlist } from './models/playlist.model';

@Injectable({
  providedIn: 'root', 
})
export class PlaylistService {
  private apiUrl = 'http://127.0.0.1:8000/api/lejatszolistak'; 

  constructor(private http: HttpClient) {}

  getPlaylists(): Observable<Playlist[]> {
    return this.http.get<Playlist[]>(this.apiUrl);
  }
}