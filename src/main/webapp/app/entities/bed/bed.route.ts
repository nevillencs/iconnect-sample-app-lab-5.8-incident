import { Injectable } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { Resolve, ActivatedRouteSnapshot, Routes } from '@angular/router';
import { JhiResolvePagingParams } from 'ng-jhipster';

import { Authority } from 'app/shared/constants/authority.constants';
import { UserRouteAccessService } from 'app/core/auth/user-route-access-service';
import { of, Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Bed } from 'app/shared/model/bed.model';
import { BedService } from './bed.service';
import { BedComponent } from './bed.component';
import { BedUpdateComponent } from './bed-update.component';
import { BedViewComponent } from './bed-view.component';
import { BedEditComponent } from './bed-edit.component';
import { BedDeleteDialogComponent } from './bed-delete-dialog.component';
import { IBed } from 'app/shared/model/bed.model';

@Injectable({ providedIn: 'root' })
export class BedResolve implements Resolve<IBed> {
    constructor(private service: BedService) {}

    resolve(route: ActivatedRouteSnapshot): Observable<IBed> | Observable<never> {
        const id = route.params['id'] ? route.params['id'] : null;
        if (id) {
            return this.service.find(id).pipe(map((bed: HttpResponse<Bed>) => bed.body));
        }
        return of(new Bed());
    }
}

export const bedRoute: Routes = [
    {
        path: '',
        component: BedComponent,
        resolve: {
            pagingParams: JhiResolvePagingParams
        },
        data: {
            authorities: ['ROLE_USER'],
            defaultSort: 'id,asc',
            pageTitle: 'iconnectSampleAppLabApp.bed.home.title'
        },
        canActivate: [UserRouteAccessService]
    },
    {
        path: 'new',
        component: BedUpdateComponent,
        resolve: {
            bed: BedResolve
        },
        data: {
            authorities: [Authority.USER],
            pageTitle: 'iconnectSampleAppLabApp.bed.home.title'
        },
        canActivate: [UserRouteAccessService]
    },
    {
        path: ':id/edit',
        component: BedEditComponent,
        resolve: {
            bed: BedResolve
        },
        data: {
            authorities: [Authority.USER],
            pageTitle: 'iconnectSampleAppLabApp.bed.home.title'
        },
        canActivate: [UserRouteAccessService]
    },
    {
        path: ':id/view',
        component: BedViewComponent,
        resolve: {
            bed: BedResolve
        },
        data: {
            authorities: [Authority.USER],
            pageTitle: 'iconnectSampleAppLabApp.bed.home.title'
        },
        canActivate: [UserRouteAccessService]
    },
    {
        path: ':id/delete',
        component: BedDeleteDialogComponent,
        resolve: {
            ward: BedResolve
        },
        data: {
            authorities: [Authority.USER],
            pageTitle: 'iconnectSampleAppLabApp.bed.home.title'
        },
        // outlet: 'popup',
        canActivate: [UserRouteAccessService]
    }
];
