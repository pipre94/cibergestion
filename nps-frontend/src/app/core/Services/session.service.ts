import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class SessionService {
  private timeoutId: any;
  private readonly SESSION_DURATION = 5 * 60 * 1000;

  constructor(private auth: AuthService, private router: Router) {
     if (typeof window !== 'undefined') {
      this.startTimer();
      this.setupActivityListeners();
     }

  }

  private startTimer() {
    this.clearTimer();
    this.timeoutId = setTimeout(() => {
      this.logout();
    }, this.SESSION_DURATION);
  }

  private resetTimer() {
    this.startTimer();
    this.checkTokenExpiration();
  }

  private setupActivityListeners() {
    ['mousemove', 'keydown', 'click', 'scroll'].forEach(event => {
      window.addEventListener(event, () => this.resetTimer());
    });
  }

  private clearTimer() {
    if (this.timeoutId) {
      clearTimeout(this.timeoutId);
    }
  }

  private logout() {
    this.auth.logout().subscribe({
      next: () => {
        this.router.navigate(['/auth/login']);
      },
      error: () => {
        this.router.navigate(['/auth/login']);
      }
    });
    alert('Sesión cerrada por inactividad');
  }

  private checkTokenExpiration() {
    const token = this.auth.getToken();
    if (!token) return;
    const payload = JSON.parse(atob(token.split('.')[1]));
    if (Date.now() > payload.exp * 1000) {
      this.logout();
    }
  }
}
