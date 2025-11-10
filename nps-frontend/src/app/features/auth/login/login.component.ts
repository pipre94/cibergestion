import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { Router } from '@angular/router';
import { AuthService } from '../../../core/Services/auth.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, HttpClientModule],
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  form!: FormGroup;
  errorMessage = '';
  loading = false;

  constructor(
    private fb: FormBuilder,
    private auth: AuthService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.form = this.fb.group({
      username: ['', Validators.required],
      password: ['', Validators.required]
    });
  }

  login(): void {
    if (this.form.valid) {
      this.loading = true;
      const { username, password } = this.form.value;

      this.auth.login(username, password).subscribe({
        next: (response) => {
          const role = this.auth.getUserRole();

          if (role === 'Admin') {
            this.router.navigate(['/admin/results']);
          } else if (role === 'Voter') {
            this.router.navigate(['/voter']);
          } else {
            this.router.navigate(['/']);
          }

          this.loading = false;
        },
        error: (error) => {
          this.errorMessage = error.error?.message || 'Error al iniciar sesión';
          this.loading = false;
        }
      });
    }
  }
}
