import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { isPlatformBrowser } from '@angular/common';
import { PLATFORM_ID } from '@angular/core';
import { AuthService } from '../Services/auth.service';

export const voterGuard: CanActivateFn = (_route, _state) => {
  const platformId = inject(PLATFORM_ID);
  const router = inject(Router);
  const auth = inject(AuthService);

  if (!isPlatformBrowser(platformId)) {
    return true;
  }

  const token = auth.getToken?.() ?? localStorage.getItem('auth_token');
  if (!token) {
    return router.parseUrl('/auth/login');
  }

  try {
    const payload = JSON.parse(atob(token.split('.')[1]));
    const role = payload['http://schemas.microsoft.com/ws/2008/06/identity/claims/role'];

    console.log('[voterGuard] role=', role);

    if (role === 'Voter') {
      return true;
    }

    return router.parseUrl('/auth/login');
  } catch (error) {
    return router.parseUrl('/auth/login');
  }
};
