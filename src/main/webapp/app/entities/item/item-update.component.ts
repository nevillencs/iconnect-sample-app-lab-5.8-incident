import { Component, OnInit } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';

import { IItem, Item } from 'app/shared/model/item.model';
import { ItemService } from './item.service';
import { IIncident } from 'app/shared/model/incident.model';
import { IncidentService } from 'app/entities/incident/incident.service';

@Component({
  selector: 'ic-item-update',
  templateUrl: './item-update.component.html'
})
export class ItemUpdateComponent implements OnInit {
  isSaving = false;
  incidents: IIncident[] = [];

  editForm = this.fb.group({
    id: [],
    itemReferenceId: [null, [Validators.required, Validators.minLength(6), Validators.maxLength(6), Validators.pattern('ITM_[0-1][0-9]')]],
    itemName: [null, [Validators.maxLength(20)]],
    incidentId: []
  });

  constructor(
    protected itemService: ItemService,
    protected incidentService: IncidentService,
    protected activatedRoute: ActivatedRoute,
    private fb: FormBuilder
  ) {}

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ item }) => {
      this.updateForm(item);

      this.incidentService.query().subscribe((res: HttpResponse<IIncident[]>) => (this.incidents = res.body || []));
    });
  }

  updateForm(item: IItem): void {
    this.editForm.patchValue({
      id: item.id,
      itemReferenceId: item.itemReferenceId,
      itemName: item.itemName,
      incidentId: item.incidentId
    });
  }

  previousState(): void {
    window.history.back();
  }

  save(): void {
    this.isSaving = true;
    const item = this.createFromForm();
    if (item.id !== undefined) {
      this.subscribeToSaveResponse(this.itemService.update(item));
    } else {
      this.subscribeToSaveResponse(this.itemService.create(item));
    }
  }

  private createFromForm(): IItem {
    return {
      ...new Item(),
      id: this.editForm.get(['id'])!.value,
      itemReferenceId: this.editForm.get(['itemReferenceId'])!.value,
      itemName: this.editForm.get(['itemName'])!.value,
      incidentId: this.editForm.get(['incidentId'])!.value
    };
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<IItem>>): void {
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

  trackById(index: number, item: IIncident): any {
    return item.id;
  }
}
