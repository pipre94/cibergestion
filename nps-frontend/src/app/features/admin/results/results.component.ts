import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { NpsService } from '../../../core/Services/nps.service';
import { AuthService } from '../../../core/Services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-results',
  standalone: true,
  imports: [CommonModule, HttpClientModule],
  templateUrl: './results.component.html',
  styleUrls: ['./results.component.scss']
})
export class ResultsComponent implements OnInit {
  votes: any[] = [];
  valueNps: number  = 0;
  loading = true;
  errorMessage = '';

  constructor(
    private npsService: NpsService,
    private auth: AuthService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.fetchResults();
  }

  fetchResults(): void {
    this.npsService.getResults().subscribe({
      next: (response) => {
        this.votes = response;
        this.loading = false;
        this.npsResults();
      },
      error: (error) => {
        this.errorMessage = error.error?.message || 'Error al cargar los votos';
        this.loading = false;
      }
    });
  }

  npsResults(): void {
    this.npsService.getNpsResults().subscribe({
      next: (response) => {
        this.valueNps = response;
        this.loading = false;
      },
      error: (error) => {
        this.errorMessage = error.error?.message || 'Error al cargar los votos';
        this.loading = false;
      }
    });
  }

   logout(): void {
    this.auth.logout().subscribe({
      next: () => {
        this.router.navigate(['/auth/login']);
      },
      error: () => {
        this.router.navigate(['/auth/login']);
      }
    });
  }
}
