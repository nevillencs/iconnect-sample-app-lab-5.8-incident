import { Component, OnInit, OnDestroy } from '@angular/core';
import { HttpErrorResponse, HttpHeaders, HttpResponse } from '@angular/common/http';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { JhiEventManager, JhiParseLinks, JhiAlertService } from 'ng-jhipster';

import { IBed } from 'app/shared/model/bed.model';
import { IWard } from 'app/shared/model/ward.model';

import { ITEMS_PER_PAGE } from 'app/shared/constants/pagination.constants';

import { BedService } from './bed.service';
import { WardService } from '../ward/ward.service';

@Component({
    selector: 'ic-bed',
    templateUrl: './bed.component.html'
})
export class BedComponent implements OnInit, OnDestroy {
    currentAccount: any;
    beds: IBed[];
    error: any;
    success: any;
    eventSubscriber: Subscription;
    routeData: any;
    links: any;
    totalItems: any;
    queryCount: any;
    itemsPerPage: any;
    page: any;
    predicate: any;
    previousPage: any;
    reverse: any;
    wards: IWard[] = [];
    searchBedName = '';
    filteredBeds: IBed[] = [];

    constructor(
        private bedService: BedService,
        private wardService: WardService,
        private parseLinks: JhiParseLinks,
        private jhiAlertService: JhiAlertService,
        private activatedRoute: ActivatedRoute,
        private router: Router,
        private eventManager: JhiEventManager
    ) {
        this.itemsPerPage = ITEMS_PER_PAGE;
        this.routeData = this.activatedRoute.data.subscribe(data => {
            this.page = data.pagingParams.page;
            this.previousPage = data.pagingParams.page;
            this.reverse = data.pagingParams.ascending;
            this.predicate = data.pagingParams.predicate;
        });
    }

    loadAll(): void {
        this.bedService
            .query({
                page: this.page - 1,
                size: this.itemsPerPage,
                sort: this.sort()
            })
            .subscribe(
                (res: HttpResponse<IBed[]>) => {
                    this.paginateBeds(res.body, res.headers);
                    this.filterBeds();
                },
                (res: HttpErrorResponse) => this.onError(res.message)
            );
        this.wardService.query().subscribe(data => {
            this.wards = data.body || [];
        });
    }

    loadPage(page: number): void {
        if (page !== this.previousPage) {
            this.previousPage = page;
            this.transition();
        }
    }

    transition(): void {
        this.router.navigate(['/bed'], {
            queryParams: {
                page: this.page,
                size: this.itemsPerPage,
                sort: this.predicate + ',' + (this.reverse ? 'asc' : 'desc')
            }
        });
        this.loadAll();
    }

    clear(): void {
        this.page = 0;
        this.router.navigate([
            '/bed',
            {
                page: this.page,
                sort: this.predicate + ',' + (this.reverse ? 'asc' : 'desc')
            }
        ]);
        this.loadAll();
    }

    ngOnInit(): void {
        this.loadAll();
        this.registerChangeInBeds();
    }

    ngOnDestroy(): void {
        this.eventManager.destroy(this.eventSubscriber);
    }

    trackId(index: number, item: IBed): number {
        return item.id;
    }

    registerChangeInBeds(): void {
        this.eventSubscriber = this.eventManager.subscribe('bedListModification', () => this.loadAll());
    }

    sort(): string[] {
        const result = [this.predicate + ',' + (this.reverse ? 'asc' : 'desc')];
        if (this.predicate !== 'id') {
            result.push('id');
        }
        return result;
    }
    private paginateBeds(data: IBed[], headers: HttpHeaders): void {
        this.links = this.parseLinks.parse(headers.get('link'));
        this.totalItems = parseInt(headers.get('X-Total-Count'), 10);
        this.queryCount = this.totalItems;
        this.beds = data;
        this.filterBeds();
    }

    private onError(errorMessage: string): void {
        this.jhiAlertService.error(errorMessage, null, null);
    }

    filterBeds(): void {
        if (!this.searchBedName) {
            this.filteredBeds = this.beds;
        } else {
            const query = this.searchBedName.toLowerCase();
            this.filteredBeds = this.beds.filter(bed => bed.bedName && bed.bedName.toLowerCase().includes(query));
        }
    }
}
