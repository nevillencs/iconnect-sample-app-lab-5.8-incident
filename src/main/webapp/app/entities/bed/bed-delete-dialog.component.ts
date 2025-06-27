import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { BedService } from './bed.service';

@Component({
    selector: 'ic-bed-delete-dialog',
    templateUrl: './bed-delete-dialog.component.html'
})
export class BedDeleteDialogComponent implements OnInit {
    bedId?: number;
    bedReferenceId?: string;
    bedName?: string;

    constructor(protected bedService: BedService, protected activatedRoute: ActivatedRoute, protected router: Router) {}

    ngOnInit(): void {
        this.activatedRoute.params.subscribe(params => {
            this.bedId = params['id'];
            this.bedService.find(this.bedId).subscribe(response => {
                this.bedName = response.body?.bedName;
                this.bedReferenceId = response.body?.bedReferenceId;
            });
        });
    }

    confirmDelete(): void {
        if (this.bedId) {
            this.bedService.delete(this.bedId).subscribe(() => {
                this.router.navigate(['/bed']);
            });
        }
    }

    cancel(): void {
        this.router.navigate(['/bed']);
    }
}
