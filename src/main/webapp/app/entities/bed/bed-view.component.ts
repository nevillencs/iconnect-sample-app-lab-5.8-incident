import { Component, OnInit } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';

import { IBed, Bed } from 'app/shared/model/bed.model';
import { BedService } from './bed.service';

type SelectableEntity = IBed;

@Component({
    selector: 'ic-bed-view',
    templateUrl: './bed-view.component.html'
})
export class BedViewComponent implements OnInit {
    private bed: IBed;
    isSaving: Boolean;
    bedDateDp: any;
    // bedClassTypes: string[] = ['A', 'B', 'C'];
    // bedLocations: string[] = ['A1', 'A2', 'B1', 'B2'];
    editForm = this.fb.group({
        id: [],
        bedReferenceId: [null, [Validators.required]],
        bedName: [null, [Validators.required]],
        wardName: [null, [Validators.required]],
        wardClassType: [null, [Validators.required]],
        wardLocation: [null, [Validators.required]],
        wardAllocationDate: [null, [Validators.required]]
    });

    constructor(protected bedService: BedService, protected activatedRoute: ActivatedRoute, private fb: FormBuilder) {}

    ngOnInit(): void {
        this.activatedRoute.data.subscribe(({ bed }) => {
            this.updateForm(bed);
        });
    }

    updateForm(bed: any): void {
        this.editForm.patchValue({
            id: bed.id,
            bedReferenceId: bed.bedReferenceId,
            bedName: bed.bedName,
            wardName: bed.wardName,
            wardClassType: bed.wardClassType,
            wardLocation: bed.wardLocation,
            wardAllocationDate: bed.wardAllocationDate
        });
    }

    previousState(): void {
        window.history.back();
    }

    save(): void {
        this.isSaving = true;
        const bed = this.createFromForm();
        if (bed.id !== undefined) {
            this.subscribeToSaveResponse(this.bedService.update(bed));
        } else {
            this.subscribeToSaveResponse(this.bedService.create(bed));
        }
    }

    private createFromForm(): IBed {
        return {
            ...new Bed(),
            id: this.editForm.get(['id'])!.value,
            bedReferenceId: this.editForm.get(['bedReferenceId'])!.value,
            bedName: this.editForm.get(['bedName'])!.value,
            ward: this.editForm.get(['bedClassType'])!.value
        };
    }

    protected subscribeToSaveResponse(result: Observable<HttpResponse<IBed>>): void {
        result.subscribe(
            () => this.onSaveSuccess(),
            () => this.onSaveError()
        );
    }

    protected onSaveSuccess(): void {
        this.isSaving = false;
        this.previousState();
    }

    protected onSaveError(): void {
        this.isSaving = false;
    }

    trackById(index: number, item: SelectableEntity): any {
        return item.id;
    }

    toUpperCase(controlName: string): void {
        const control = this.editForm.get(controlName);
        if (control) {
            const upper = control.value?.toUpperCase() || '';
            if (control.value !== upper) {
                control.setValue(upper, { emitEvent: false });
            }
        }
    }
}
