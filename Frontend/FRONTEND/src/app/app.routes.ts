import { Routes } from '@angular/router';
import { Home } from './home/home';
import { Auth } from './auth/auth';
import { About } from './about/about';
import { MusorvezetokPage } from './musorvezetok-page/musorvezetok-page';
import { MusorokPage } from './musorok-page/musorok-page';

export const routes: Routes = [
  { path: '', component: Home },
  { path: 'rolunk', component: About },
  { path: 'musorvezetok', component: MusorvezetokPage },
  { path: 'musorok', component: MusorokPage },
  { path: 'auth', component: Auth },
  { path: '**', redirectTo: '' },
];
