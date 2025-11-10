import { Injectable, Inject, PLATFORM_ID } from '@angular/core';
import { isPlatformBrowser } from '@angular/common';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { BehaviorSubject, Observable, of, tap, catchError } from 'rxjs';

export interface LoginResponse {
  accessToken: string;
  refreshToken: string;
  expiresAt: string;
}

@Injectable({ providedIn: 'root' })
export class AuthService {
  private apiUrl = 'https://localhost:7172/api/auth';
  private isBrowser: boolean;
  private tokenKey = 'auth_token';
  private refreshKey = 'refresh_token';
  private inMemoryToken: string | null = null;
  private loggedIn$ = new BehaviorSubject<boolean>(false);

  constructor(
    private http: HttpClient,
    @Inject(PLATFORM_ID) private platformId: Object
  ) {
    this.isBrowser = isPlatformBrowser(this.platformId);

    const token = this.isBrowser ? localStorage.getItem(this.tokenKey) : null;
    if (token) {
      this.inMemoryToken = token;
      this.loggedIn$.next(true);
    }
  }

   private getHeaders(): HttpHeaders {
    const token = this.isBrowser ? localStorage.getItem(this.tokenKey) : null;


    return new HttpHeaders({
      Authorization: `Bearer ${token}`,
      'Content-Type': 'application/json'
    });
  }

  login(username: string, password: string): Observable<LoginResponse> {
    return this.http.post<LoginResponse>(`${this.apiUrl}/login`, { username, password })
      .pipe(tap(res => {
        if (this.isBrowser) {
          localStorage.setItem(this.tokenKey, res.accessToken);
          localStorage.setItem(this.refreshKey, res.refreshToken);

          const payload = JSON.parse(atob(res.accessToken.split('.')[1]));
          localStorage.setItem('role', payload['http://schemas.microsoft.com/ws/2008/06/identity/claims/role']);
        } else {
          this.inMemoryToken = res.accessToken;
        }

        this.loggedIn$.next(true);
      }));
  }

  logout(): Observable<any> {
    const refreshToken = this.isBrowser ? localStorage.getItem(this.refreshKey) : null;

    return this.http.post(`${this.apiUrl}/logout`, { refreshToken },{
      headers: this.getHeaders()
    })
      .pipe(
        tap(() => {
          if (this.isBrowser) {
            localStorage.removeItem(this.tokenKey);
            localStorage.removeItem(this.refreshKey);
            localStorage.removeItem('role');
          } else {
            this.inMemoryToken = null;
          }
          this.loggedIn$.next(false);
        }),
        catchError(() => {
          if (this.isBrowser) {
            localStorage.removeItem(this.tokenKey);
            localStorage.removeItem(this.refreshKey);
            localStorage.removeItem('role');
          } else {
            this.inMemoryToken = null;
          }
          this.loggedIn$.next(false);
          return of(null);
        })
      );
  }

  setToken(token: string | null): void {
    if (this.isBrowser) {
      if (token === null) {
        localStorage.removeItem(this.tokenKey);
      } else {
        localStorage.setItem(this.tokenKey, token);
      }
    } else {
      this.inMemoryToken = token;
    }
  }

  getToken(): string | null {
    return this.isBrowser ? localStorage.getItem(this.tokenKey) : this.inMemoryToken;
  }

  isLoggedIn(): Observable<boolean> {
    return this.loggedIn$.asObservable();
  }

  getUserRole(): string | null {
    return this.isBrowser ? localStorage.getItem('role') : null;
  }
}
