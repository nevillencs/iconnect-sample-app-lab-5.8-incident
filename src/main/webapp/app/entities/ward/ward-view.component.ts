import { Component, OnInit } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';

import { IWard, Ward } from 'app/shared/model/ward.model';
import { WardService } from './ward.service';
import { IBed } from 'app/shared/model/bed.model';

type SelectableEntity = IWard;

@Component({
    selector: 'ic-ward-view',
    templateUrl: './ward-view.component.html'
})
export class WardViewComponent implements OnInit {
    private ward: IWard;
    isSaving: Boolean;
    wardDateDp: any;
    wardClassTypes: string[] = ['A', 'B', 'C'];
    wardLocations: string[] = ['A1', 'A2', 'B1', 'B2'];
    numberOfBeds = 0;
    editForm = this.fb.group({
        id: [],
        wardReferenceId: [null, [Validators.required, Validators.pattern(/^WARD_\d{2}$/)]],
        wardName: [null, [Validators.required]],
        wardClassType: [null, [Validators.required]],
        wardLocation: [null, [Validators.required]]
    });
    beds: IBed[] = [];
    routeData: any;
    reverse: any;
    predicate: any;

    constructor(protected wardService: WardService, protected activatedRoute: ActivatedRoute, private fb: FormBuilder) {
        this.routeData = this.activatedRoute.data.subscribe(data => {
            // this.page = data.pagingParams.page;
            // this.previousPage = data.pagingParams.page;
            this.reverse = data.pagingParams.ascending;
            this.predicate = data.pagingParams.predicate;
        });
    }

    ngOnInit(): void {
        this.activatedRoute.data.subscribe(({ ward }) => {
            this.updateForm(ward);
            this.numberOfBeds = ward.beds ? ward.beds.length : 0;
            this.beds = ward.beds || [];
        });
    }

    updateForm(ward: IWard): void {
        this.editForm.patchValue({
            id: ward.id,
            wardReferenceId: ward.wardReferenceId,
            wardName: ward.wardName,
            wardClassType: ward.wardClassType,
            wardLocation: ward.wardLocation
        });
    }

    previousState(): void {
        window.history.back();
    }

    save(): void {
        this.isSaving = true;
        const ward = this.createFromForm();
        if (ward.id !== undefined) {
            this.subscribeToSaveResponse(this.wardService.update(ward));
        } else {
            this.subscribeToSaveResponse(this.wardService.create(ward));
        }
    }

    private createFromForm(): IWard {
        return {
            ...new Ward(),
            id: this.editForm.get(['id'])!.value,
            wardReferenceId: this.editForm.get(['wardReferenceId'])!.value,
            wardName: this.editForm.get(['wardName'])!.value,
            wardClassType: this.editForm.get(['wardClassType'])!.value,
            wardLocation: this.editForm.get(['wardLocation'])!.value
        };
    }

    protected subscribeToSaveResponse(result: Observable<HttpResponse<IWard>>): void {
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

    transition(): void {
        if (this.predicate && this.beds) {
            this.beds.sort((a, b) => {
                const aValue = a[this.predicate];
                const bValue = b[this.predicate];

                if (aValue == null && bValue == null) return 0;
                if (aValue == null) return this.reverse ? 1 : -1;
                if (bValue == null) return this.reverse ? -1 : 1;

                const aStr = aValue.toString().toLowerCase();
                const bStr = bValue.toString().toLowerCase();

                if (aStr < bStr) return this.reverse ? 1 : -1;
                if (aStr > bStr) return this.reverse ? -1 : 1;
                return 0;
            });
        }
    }
}
