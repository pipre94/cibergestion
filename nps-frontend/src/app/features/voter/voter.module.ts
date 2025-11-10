import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { VoteComponent } from './vote/vote.component';

@NgModule({
  imports: [
    CommonModule,
    VoteComponent // standalone component
  ],
  exports: [VoteComponent]
})
export class VoterModule {}
