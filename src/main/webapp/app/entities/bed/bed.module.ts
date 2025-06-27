import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { IconnectSampleAppLabSharedModule } from 'app/shared/shared.module';

import { BedComponent } from './bed.component';
import { BedUpdateComponent } from './bed-update.component';
import { BedViewComponent } from './bed-view.component';
import { bedRoute } from './bed.route';
import { BedEditComponent } from './bed-edit.component';
import { BedDeleteDialogComponent } from './bed-delete-dialog.component';

@NgModule({
    imports: [IconnectSampleAppLabSharedModule, RouterModule.forChild(bedRoute)],
    declarations: [BedComponent, BedUpdateComponent, BedViewComponent, BedEditComponent, BedDeleteDialogComponent],
    entryComponents: []
})
export class BedModule {}
