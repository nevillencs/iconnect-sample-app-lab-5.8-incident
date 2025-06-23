import { Component, OnInit } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';

import { IIncident, Incident } from 'app/shared/model/incident.model';
import { IncidentService } from './incident.service';

@Component({
  selector: 'ic-incident-update',
  templateUrl: './incident-update.component.html'
})
export class IncidentUpdateComponent implements OnInit {
  isSaving = false;
  incidentDateDp: any;

  editForm = this.fb.group({
    id: [],
    incidentReferenceId: [
      null,
      [Validators.required, Validators.minLength(6), Validators.maxLength(6), Validators.pattern('INC_[0-1][0-9]')]
    ],
    incidentName: [null, [Validators.required, Validators.minLength(10), Validators.maxLength(20)]],
    incidentStatus: [null, [Validators.required]],
    incidentDate: [null, [Validators.required]]
  });

  constructor(protected incidentService: IncidentService, protected activatedRoute: ActivatedRoute, private fb: FormBuilder) {}

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ incident }) => {
      this.updateForm(incident);
    });
  }

  updateForm(incident: IIncident): void {
    this.editForm.patchValue({
      id: incident.id,
      incidentReferenceId: incident.incidentReferenceId,
      incidentName: incident.incidentName,
      incidentStatus: incident.incidentStatus,
      incidentDate: incident.incidentDate
    });
  }

  previousState(): void {
    window.history.back();
  }

  save(): void {
    this.isSaving = true;
    const incident = this.createFromForm();
    if (incident.id !== undefined) {
      this.subscribeToSaveResponse(this.incidentService.update(incident));
    } else {
      this.subscribeToSaveResponse(this.incidentService.create(incident));
    }
  }

  private createFromForm(): IIncident {
    return {
      ...new Incident(),
      id: this.editForm.get(['id'])!.value,
      incidentReferenceId: this.editForm.get(['incidentReferenceId'])!.value,
      incidentName: this.editForm.get(['incidentName'])!.value,
      incidentStatus: this.editForm.get(['incidentStatus'])!.value,
      incidentDate: this.editForm.get(['incidentDate'])!.value
    };
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<IIncident>>): void {
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
}
