import { Component, OnInit } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';

import { IBed, IUpdateBedDTO } from 'app/shared/model/bed.model';
import { IWard } from 'app/shared/model/ward.model';
import { BedService } from './bed.service';
import { WardService } from '../ward/ward.service';

type SelectableEntity = IBed;

@Component({
    selector: 'ic-bed-edit',
    templateUrl: './bed-edit.component.html'
})
export class BedEditComponent implements OnInit {
    private bed: IBed;
    isSaving: Boolean;
    bedDateDp: any;
    wardNames: string[] = [];

    editForm = this.fb.group({
        bedReferenceId: [null, [Validators.required, Validators.pattern(/^BED_\d{2}$/)]],
        bedName: [null, []],
        wardName: [null, [Validators.required]],
        wardAllocationDate: [null, [Validators.required]]
    });

    constructor(
        protected bedService: BedService,
        protected wardService: WardService,
        protected activatedRoute: ActivatedRoute,
        private fb: FormBuilder
    ) {}

    ngOnInit(): void {
        this.activatedRoute.data.subscribe(({ bed }) => {
            this.updateForm(bed);
        });
        this.wardService.query().subscribe(response => {
            const wards: IWard[] = response.body || [];
            this.wardNames = wards.map(ward => ward.wardName).sort((a, b) => a.localeCompare(b));
        });
    }

    updateForm(bed: IUpdateBedDTO): void {
        this.editForm.patchValue({
            bedReferenceId: bed.bedReferenceId,
            bedName: bed.bedName,
            wardName: bed.wardName,
            wardAllocationDate: bed.wardAllocationDate
        });
    }

    previousState(): void {
        window.history.back();
    }

    save(): void {
        this.isSaving = true;
        const bed = this.createFromForm();
        this.subscribeToSaveResponse(this.bedService.update(bed));
    }

    private createFromForm(): IUpdateBedDTO {
        return {
            bedReferenceId: this.editForm.get(['bedReferenceId'])!.value,
            bedName: this.editForm.get(['bedName'])!.value
                ? this.editForm.get(['bedName'])!.value
                : `${this.editForm.get(['wardName'])!.value || ''}_${this.editForm.get(['bedReferenceId'])!.value || ''}`,
            wardName: this.editForm.get(['wardName'])!.value,
            wardAllocationDate: this.editForm.get(['wardAllocationDate'])!.value
        };
    }

    protected subscribeToSaveResponse(result: Observable<HttpResponse<IBed>>): void {
        result.subscribe(
            () => this.onSaveSuccess(),
            error => this.onSaveError(error)
        );
    }

    protected onSaveSuccess(): void {
        this.isSaving = false;
        this.previousState();
    }

    protected onSaveError(error: any): void {
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
