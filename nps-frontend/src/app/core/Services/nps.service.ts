import { Injectable, Inject, PLATFORM_ID } from '@angular/core';
import { isPlatformBrowser } from '@angular/common';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AuthService } from './auth.service';

@Injectable({ providedIn: 'root' })
export class NpsService {
  private API_URL = 'https://localhost:7172/api';
  private isBrowser: boolean;

  constructor(
    private http: HttpClient,
    private auth: AuthService,
    @Inject(PLATFORM_ID) private platformId: Object
  ) {
    this.isBrowser = isPlatformBrowser(this.platformId);
  }

  private getHeaders(): HttpHeaders {
    let token: string | null = null;

    if (this.isBrowser) {
      token = this.auth.getToken?.() ?? localStorage.getItem('auth_token');
    } else {
      token = this.auth.getToken?.();
    }

    return new HttpHeaders({
      Authorization: `Bearer ${token}`,
      'Content-Type': 'application/json'
    });
  }

  vote(score: number): Observable<any> {
  const scoreValue = Math.floor(score);
  return this.http.post(
    `${this.API_URL}/vote`,
    scoreValue,
    { headers: this.getHeaders() }
  );
}


  getResults(): Observable<any> {
    return this.http.get(`${this.API_URL}/vote/all`, {
      headers: this.getHeaders()
    });
  }

  getNpsResults(): Observable<any> {
    return this.http.get(`${this.API_URL}/vote/calculate-nps`, {
      headers: this.getHeaders()
    });
  }
}
