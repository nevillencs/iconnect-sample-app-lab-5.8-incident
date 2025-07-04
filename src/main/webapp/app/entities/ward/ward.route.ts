import { Injectable } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { Resolve, ActivatedRouteSnapshot, Routes } from '@angular/router';
import { JhiResolvePagingParams } from 'ng-jhipster';
import { Authority } from 'app/shared/constants/authority.constants';
import { UserRouteAccessService } from 'app/core/auth/user-route-access-service';
import { of, Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Ward } from 'app/shared/model/ward.model';
import { WardService } from './ward.service';
import { WardUpdateComponent } from './ward-update.component';
import { WardViewComponent } from './ward-view.component';
import { WardEditComponent } from './ward-edit.component';
import { WardDeleteDialogComponent } from './ward-delete-dialog.component';
import { WardComponent } from './ward.component';
import { IWard } from 'app/shared/model/ward.model';
import { Code } from 'app/admin/code-admin/code/code.model';
import { CodePopupService } from 'app/admin/code-admin/code';

@Injectable({ providedIn: 'root' })
export class WardResolve implements Resolve<IWard> {
  constructor(private service: WardService) {}

  resolve(route: ActivatedRouteSnapshot): Observable<IWard> | Observable<never> {
    const id = route.params['id'] ? route.params['id'] : null;
    if (id) {
      return this.service.find(id).pipe(map((ward: HttpResponse<Ward>) => ward.body));
    }
    return of(new Ward());
  }
}

export const wardRoute: Routes = [
  {
    path: '',
    component: WardComponent,
    resolve: {
      pagingParams: JhiResolvePagingParams
    },
    data: {
      authorities: ['ROLE_USER'],
      defaultSort: 'id,asc',
      pageTitle: 'iconnectSampleAppLabApp.ward.home.title'
    },
    canActivate: [UserRouteAccessService]
  },
  {
    path: 'new',
    component: WardUpdateComponent,
    resolve: {
      ward: WardResolve
    },
    data: {
      authorities: [Authority.USER],
      pageTitle: 'iconnectSampleAppLabApp.ward.home.title'
    },
    canActivate: [UserRouteAccessService]
  },
  {
    path: ':id/edit',
    component: WardEditComponent,
    resolve: {
      ward: WardResolve
    },
    data: {
      authorities: [Authority.USER],
      pageTitle: 'iconnectSampleAppLabApp.ward.home.title'
    },
    canActivate: [UserRouteAccessService]
  },
  {
    path: ':id/view',
    component: WardViewComponent,
    resolve: {
      ward: WardResolve
    },
    data: {
      authorities: [Authority.USER],
      pageTitle: 'iconnectSampleAppLabApp.ward.home.title'
    },
    canActivate: [UserRouteAccessService]
  },
  {
    path: ':id/delete',
    component: WardDeleteDialogComponent,
    resolve: {
      ward: WardResolve
    },
    data: {
      authorities: [Authority.USER],
      pageTitle: 'iconnectSampleAppLabApp.ward.home.title'
    },
    // outlet: 'popup',
    canActivate: [UserRouteAccessService]
  }
];
