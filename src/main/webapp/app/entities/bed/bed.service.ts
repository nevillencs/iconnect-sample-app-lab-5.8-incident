import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';
import * as moment from 'moment';
import { DATE_FORMAT } from 'app/shared/constants/input.constants';
import { map } from 'rxjs/operators';

import { SERVER_API_URL } from 'app/app.constants';
import { createRequestOption } from 'app/shared/util/request-util';
import { IBed, IUpdateBedDTO } from 'app/shared/model/bed.model';

type EntityResponseType = HttpResponse<IBed>;
type EntityArrayResponseType = HttpResponse<IBed[]>;

@Injectable({ providedIn: 'root' })
export class BedService {
    private resourceUrl = SERVER_API_URL + 'api/beds';

    constructor(private http: HttpClient) {}

    create(bed: IUpdateBedDTO): Observable<EntityResponseType> {
        const copy = this.convertDateFromClient(bed);
        return this.http
            .post<IUpdateBedDTO>(this.resourceUrl, copy, { observe: 'response' })
            .pipe(map((res: EntityResponseType) => this.convertDateFromServer(res)));
    }

    update(bed: IBed): Observable<EntityResponseType> {
        const copy = this.convertDateFromClient(bed);
        return this.http
            .put<IBed>(this.resourceUrl, copy, { observe: 'response' })
            .pipe(map((res: EntityResponseType) => this.convertDateFromServer(res)));
    }

    find(id: number): Observable<EntityResponseType> {
        return this.http
            .get<IBed>(`${this.resourceUrl}/${id}`, { observe: 'response' })
            .pipe(map((res: EntityResponseType) => this.convertDateFromServer(res)));
    }

    query(req?: any): Observable<EntityArrayResponseType> {
        const options = createRequestOption(req);
        return this.http
            .get<IBed[]>(this.resourceUrl, { params: options, observe: 'response' })
            .pipe(map((res: EntityArrayResponseType) => this.convertDateArrayFromServer(res)));
    }

    delete(id: number): Observable<HttpResponse<any>> {
        return this.http.delete<any>(`${this.resourceUrl}/${id}`, { observe: 'response' });
    }

    private convertDateFromClient(bed: IBed): IBed;
    private convertDateFromClient(bed: IUpdateBedDTO): IBed;

    private convertDateFromClient(bed: IBed | IUpdateBedDTO): IBed {
        const copy: IBed = Object.assign({}, bed, {
            wardAllocationDate:
                bed.wardAllocationDate != null && bed.wardAllocationDate.isValid() ? bed.wardAllocationDate.format(DATE_FORMAT) : null
        });
        return copy;
    }

    private convertDateFromServer(res: EntityResponseType): EntityResponseType {
        res.body.wardAllocationDate = res.body.wardAllocationDate != null ? moment(res.body.wardAllocationDate) : null;
        return res;
    }

    private convertDateArrayFromServer(res: EntityArrayResponseType): EntityArrayResponseType {
        res.body.forEach((bed: IBed) => {
            bed.wardAllocationDate = bed.wardAllocationDate != null ? moment(bed.wardAllocationDate) : null;
        });
        return res;
    }
}
