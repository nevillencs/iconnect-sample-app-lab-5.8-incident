import { IBed } from './bed.model';

export interface IWard {
  id?: number;
  wardReferenceId?: string;
  wardName?: string;
  wardClassType?: string;
  wardLocation?: string;
  beds?: IBed[];
}

export class Ward implements IWard {
  constructor(
    public id?: number,
    public wardReferenceId?: string,
    public wardName?: string,
    public wardClassType?: string,
    public wardLocation?: string,
    public beds?: IBed[]
  ) {}
}
