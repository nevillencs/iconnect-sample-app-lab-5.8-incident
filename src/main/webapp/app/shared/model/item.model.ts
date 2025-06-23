export interface IItem {
  id?: number;
  itemReferenceId?: string;
  itemName?: string;
  incidentIncidentName?: string;
  incidentId?: number;
}

export class Item implements IItem {
  constructor(
    public id?: number,
    public itemReferenceId?: string,
    public itemName?: string,
    public incidentIncidentName?: string,
    public incidentId?: number
  ) {}
}
