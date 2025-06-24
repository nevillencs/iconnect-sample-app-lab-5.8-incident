import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { IconnectSampleAppLabSharedModule } from 'app/shared/shared.module';

import { BedComponent } from './bed.component';
import { BedUpdateComponent } from './bed-update.component';
import { bedRoute } from './bed.route';

@NgModule({
  imports: [IconnectSampleAppLabSharedModule, RouterModule.forChild(bedRoute)],
  declarations: [BedComponent, BedUpdateComponent],
  entryComponents: []
})
export class BedModule {}
