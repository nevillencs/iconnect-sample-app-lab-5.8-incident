import * as moment from 'moment';
import { Ward } from './ward.model';

export interface IBed {
  id?: number;
  bedReferenceId?: string;
  bedName?: string;
  ward?: Ward;
  wardAllocationDate?: moment.Moment;
}

export class Bed implements IBed {
  constructor(
    public id?: number,
    public bedReferenceId?: string,
    public bedName?: string,
    public ward?: Ward,
    public wardAllocationDate?: moment.Moment
  ) {}
}
