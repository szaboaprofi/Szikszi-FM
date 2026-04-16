import { HttpClient } from '@angular/common/http';
import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { CustomPlaylistComment } from './models/custom-playlist.model';

@Injectable({
  providedIn: 'root',
})
export class CommentService {
  private readonly http = inject(HttpClient);
  private readonly apiUrl = 'http://127.0.0.1:8000/api/lejatszolistak';

  getComments(playlistId: number): Observable<CustomPlaylistComment[]> {
    return this.http.get<CustomPlaylistComment[]>(`${this.apiUrl}/${playlistId}/comments`);
  }
}
