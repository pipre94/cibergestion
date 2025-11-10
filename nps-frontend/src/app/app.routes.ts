import { Routes } from '@angular/router';
import { voterGuard } from './core/Guards/voter.guard';
import { roleGuard } from './core/Guards/role.guard';
import { ResultsComponent } from './features/admin/results/results.component';

export const routes: Routes = [
  {
    path: 'login',
    loadComponent: () =>
      import('./features/auth/login/login.component').then(c => c.LoginComponent)
  },
  {
    path: 'voter',
    loadComponent: () =>
      import('./features/voter/vote/vote.component').then(m => m.VoteComponent),
    canActivate: [voterGuard]
  },
  {
    path: 'admin/results',
    component: ResultsComponent,
    canActivate: [roleGuard],
    data: { role: 'Admin' }
  },
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  { path: '**', redirectTo: 'login' }
];
