import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { IconnectSampleAppLabSharedModule } from 'app/shared/shared.module';

import { WardComponent } from './ward.component';
import { WardUpdateComponent } from './ward-update.component';
import { wardRoute } from './ward.route';
import { Ward } from 'app/shared/model/ward.model';
import { WardViewComponent } from './ward-view.component';
import { WardEditComponent } from './ward-edit.component';
import { WardDeleteDialogComponent } from './ward-delete-dialog.component';

@NgModule({
  imports: [IconnectSampleAppLabSharedModule, RouterModule.forChild(wardRoute)],
  declarations: [WardComponent, WardUpdateComponent, WardViewComponent, WardEditComponent, WardDeleteDialogComponent],
  entryComponents: []
})
export class WardModule {}
