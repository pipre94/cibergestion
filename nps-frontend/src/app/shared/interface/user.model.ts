export interface User {
  id: number;
  username: string;
  role: 'Voter' | 'Admin';
  token?: string;
  refreshToken?: string;
}
