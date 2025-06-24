import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { IconnectSampleAppLabSharedModule } from 'app/shared/shared.module';

import { WardComponent } from './ward.component';
import { WardUpdateComponent } from './ward-update.component';
import { wardRoute } from './ward.route';
import { Ward } from 'app/shared/model/ward.model';

@NgModule({
  imports: [IconnectSampleAppLabSharedModule, RouterModule.forChild(wardRoute)],
  declarations: [WardComponent, WardUpdateComponent],
  entryComponents: []
})
export class WardModule {}
