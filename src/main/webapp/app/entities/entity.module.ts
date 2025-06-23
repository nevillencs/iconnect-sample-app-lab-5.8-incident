import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

@NgModule({
  imports: [
    RouterModule.forChild([
      {
        path: 'incident',
        loadChildren: () => import('./incident/incident.module').then(m => m.IconnectSampleAppLabIncidentModule)
      },
      {
        path: 'item',
        loadChildren: () => import('./item/item.module').then(m => m.IconnectSampleAppLabItemModule)
      }
      /* jhipster-needle-add-entity-route - JHipster will add entity modules routes here */
    ])
  ]
})
export class IconnectSampleAppLabEntityModule {}
