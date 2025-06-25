import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { WardService } from './ward.service';

@Component({
  selector: 'ic-ward-delete-dialog',
  templateUrl: './ward-delete-dialog.component.html'
})
export class WardDeleteDialogComponent implements OnInit {
  wardId?: number;
  wardName?: string;

  constructor(protected wardService: WardService, protected activatedRoute: ActivatedRoute, protected router: Router) {}

  ngOnInit(): void {
    this.activatedRoute.params.subscribe(params => {
      this.wardId = params['id'];
    });
  }

  confirmDelete(): void {
    if (this.wardId) {
      this.wardService.delete(this.wardId).subscribe(() => {
        // this.router.navigate([{ outlets: { popup: null } }]);
        this.router.navigate(['/ward']);
      });
    }
  }

  cancel(): void {
    // this.router.navigate([{ outlets: { popup: null } }]);
    this.router.navigate(['/ward']);
  }
}
