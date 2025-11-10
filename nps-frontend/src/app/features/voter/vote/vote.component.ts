import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { NpsService } from '../../../core/Services/nps.service';
import { Router } from '@angular/router';
import { AuthService } from '../../../core/Services/auth.service';

@Component({
  selector: 'app-vote',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, HttpClientModule],
  templateUrl: './vote.component.html',
  styleUrls: ['./vote.component.scss']
})
export class VoteComponent implements OnInit {
  voteForm!: FormGroup;
  scores = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  submitted = false;
  errorMessage = '';

  constructor(
    private fb: FormBuilder,
    private npsService: NpsService,
    private auth: AuthService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.voteForm = this.fb.group({
      score: ['', Validators.required]
    });
  }

  onSubmit(): void {
  if (this.voteForm.valid) {
    this.npsService.vote(this.voteForm.value.score).subscribe({
      next: (response) => {
        this.submitted = true;
        alert('Éxito: Voto registrado');
      },
      error: (error) => {
        if (error.status === 400) {
          alert('Ya has registrado tu voto previamente');
        } else if (error.status === 401) {
          alert('No autorizado');
        } else {
          alert('Ocurrió un error al registrar el voto');
        }
      }
    });
  }
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
