import { browser, ExpectedConditions as ec, promise } from 'protractor';
import { NavBarPage, SignInPage, AsideBarPage } from '../../page-objects/jhi-page-objects';

import { IncidentComponentsPage, IncidentDeleteDialog, IncidentUpdatePage } from './incident.page-object';

const expect = chai.expect;

describe('Incident e2e test', () => {
  let navBarPage: NavBarPage;
  let signInPage: SignInPage;
  let asideBarPage: AsideBarPage;
  let incidentComponentsPage: IncidentComponentsPage;
  let incidentUpdatePage: IncidentUpdatePage;
  let incidentDeleteDialog: IncidentDeleteDialog;

  before(async () => {
    // await browser.get('/');
    navBarPage = new NavBarPage(true);
    asideBarPage = new AsideBarPage();
    signInPage = await navBarPage.getSignInPage();
    await signInPage.autoSignInUsing('appadmin', 'password1');
    await browser.wait(ec.visibilityOf(asideBarPage.entityMenu), 5000);
  });

  it('should load Incidents', async () => {
    await asideBarPage.goToEntity('incident');
    incidentComponentsPage = new IncidentComponentsPage();
    await browser.wait(ec.visibilityOf(incidentComponentsPage.title), 5000);
    expect(await incidentComponentsPage.getTitle()).to.eq('iconnectSampleAppLabApp.incident.home.title');
    await browser.wait(ec.or(ec.visibilityOf(incidentComponentsPage.entities), ec.visibilityOf(incidentComponentsPage.noResult)), 1000);
  });

  it('should load create Incident page', async () => {
    await incidentComponentsPage.clickOnCreateButton();
    incidentUpdatePage = new IncidentUpdatePage();
    expect(await incidentUpdatePage.getPageTitle()).to.eq('iconnectSampleAppLabApp.incident.home.createOrEditLabel');
    await incidentUpdatePage.cancel();
  });

  it('should create and save Incidents', async () => {
    const nbButtonsBeforeCreate = await incidentComponentsPage.countDeleteButtons();

    await incidentComponentsPage.clickOnCreateButton();

    await promise.all([
      incidentUpdatePage.setIncidentReferenceIdInput('INC_08'),
      incidentUpdatePage.setIncidentNameInput('incidentName'),
      incidentUpdatePage.incidentStatusSelectLastOption(),
      incidentUpdatePage.setIncidentDateInput('2000-12-31')
    ]);

    expect(await incidentUpdatePage.getIncidentReferenceIdInput()).to.eq(
      'INC_08',
      'Expected IncidentReferenceId value to be equals to INC_08'
    );
    expect(await incidentUpdatePage.getIncidentNameInput()).to.eq(
      'incidentName',
      'Expected IncidentName value to be equals to incidentName'
    );
    expect(await incidentUpdatePage.getIncidentDateInput()).to.eq('2000-12-31', 'Expected incidentDate value to be equals to 2000-12-31');

    await incidentUpdatePage.save();
    expect(await incidentUpdatePage.getSaveButton().isPresent(), 'Expected save button disappear').to.be.false;

    expect(await incidentComponentsPage.countDeleteButtons()).to.eq(nbButtonsBeforeCreate + 1, 'Expected one more entry in the table');
  });

  it('should delete last Incident', async () => {
    const nbButtonsBeforeDelete = await incidentComponentsPage.countDeleteButtons();
    await incidentComponentsPage.clickOnLastDeleteButton();

    incidentDeleteDialog = new IncidentDeleteDialog();
    expect(await incidentDeleteDialog.getDialogTitle()).to.eq('iconnectSampleAppLabApp.incident.delete.question');
    await incidentDeleteDialog.clickOnConfirmButton();

    expect(await incidentComponentsPage.countDeleteButtons()).to.eq(nbButtonsBeforeDelete - 1);
  });

  after(async () => {
    await navBarPage.autoSignOut();
  });
});
