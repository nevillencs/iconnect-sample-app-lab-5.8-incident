import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

import { IIncident } from 'app/shared/model/incident.model';

@Component({
  selector: 'ic-incident-detail',
  templateUrl: './incident-detail.component.html'
})
export class IncidentDetailComponent implements OnInit {
  incident: IIncident | null = null;

  constructor(protected activatedRoute: ActivatedRoute) {}

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ incident }) => (this.incident = incident));
  }

  previousState(): void {
    window.history.back();
  }
}
