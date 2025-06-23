import { Moment } from 'moment';
import { IItem } from 'app/shared/model/item.model';
import { IncidentStatus } from 'app/shared/model/enumerations/incident-status.model';

export interface IIncident {
  id?: number;
  incidentReferenceId?: string;
  incidentName?: string;
  incidentStatus?: IncidentStatus;
  incidentDate?: Moment;
  items?: IItem[];
}

export class Incident implements IIncident {
  constructor(
    public id?: number,
    public incidentReferenceId?: string,
    public incidentName?: string,
    public incidentStatus?: IncidentStatus,
    public incidentDate?: Moment,
    public items?: IItem[]
  ) {}
}
