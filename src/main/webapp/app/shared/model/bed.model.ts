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

export interface IUpdateBedDTO {
    bedReferenceId?: string;
    bedName?: string;
    wardName?: string | null;
    wardAllocationDate?: moment.Moment;
}

export class UpdateBedDTO implements IUpdateBedDTO {
    constructor(
        public bedReferenceId?: string,
        public wardAllocationDate?: moment.Moment,
        public bedName?: string,
        public wardName?: string | null
    ) {}
}
