import { Component, OnInit } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable } from 'rxjs';

import { IWard, Ward } from 'app/shared/model/ward.model';
import { WardService } from './ward.service';

type SelectableEntity = IWard;

@Component({
    selector: 'ic-ward-edit',
    templateUrl: './ward-edit.component.html'
})
export class WardEditComponent implements OnInit {
    private ward: IWard;
    isSaving: Boolean;
    wardDateDp: any;
    wardClassTypes: string[] = ['A', 'B', 'C'];
    wardLocations: string[] = ['A1', 'A2', 'B1', 'B2'];
    editForm = this.fb.group({
        id: [],
        wardReferenceId: [null, [Validators.required, Validators.pattern(/^WARD_\d{2}$/)]],
        wardName: [null, [Validators.required]],
        wardClassType: [null, [Validators.required]],
        wardLocation: [null, [Validators.required]]
    });

    constructor(
        protected wardService: WardService,
        protected activatedRoute: ActivatedRoute,
        protected router: Router,
        private fb: FormBuilder
    ) {}

    ngOnInit(): void {
        this.activatedRoute.data.subscribe(({ ward }) => {
            this.updateForm(ward);
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
            error => this.onSaveError(this.getErrorMessage(error))
        );
    }

    protected onSaveSuccess(): void {
        this.isSaving = false;
        this.previousState();
    }

    private getErrorMessage(error: any): string {
        const errorHeader = error.headers?.get('X-iconnectSampleAppLabApp-error');
        const errorMsg = error.headers?.get('X-iconnectSampleAppLabApp-message');
        if (errorMsg) {
            return errorMsg;
        }
        return error?.message || 'An error occurred';
    }

    protected onSaveError(errorMessage: string): void {
        this.isSaving = false;
        this.router.navigate(['/ward'], { queryParams: { error: errorMessage } });
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
