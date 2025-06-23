import { browser, ExpectedConditions as ec, promise } from 'protractor';
import { NavBarPage, SignInPage, AsideBarPage } from '../../page-objects/jhi-page-objects';

import { ItemComponentsPage, ItemDeleteDialog, ItemUpdatePage } from './item.page-object';

const expect = chai.expect;

describe('Item e2e test', () => {
  let navBarPage: NavBarPage;
  let signInPage: SignInPage;
  let asideBarPage: AsideBarPage;
  let itemComponentsPage: ItemComponentsPage;
  let itemUpdatePage: ItemUpdatePage;
  let itemDeleteDialog: ItemDeleteDialog;

  before(async () => {
    // await browser.get('/');
    navBarPage = new NavBarPage(true);
    asideBarPage = new AsideBarPage();
    signInPage = await navBarPage.getSignInPage();
    await signInPage.autoSignInUsing('appadmin', 'password1');
    await browser.wait(ec.visibilityOf(asideBarPage.entityMenu), 5000);
  });

  it('should load Items', async () => {
    await asideBarPage.goToEntity('item');
    itemComponentsPage = new ItemComponentsPage();
    await browser.wait(ec.visibilityOf(itemComponentsPage.title), 5000);
    expect(await itemComponentsPage.getTitle()).to.eq('iconnectSampleAppLabApp.item.home.title');
    await browser.wait(ec.or(ec.visibilityOf(itemComponentsPage.entities), ec.visibilityOf(itemComponentsPage.noResult)), 1000);
  });

  it('should load create Item page', async () => {
    await itemComponentsPage.clickOnCreateButton();
    itemUpdatePage = new ItemUpdatePage();
    expect(await itemUpdatePage.getPageTitle()).to.eq('iconnectSampleAppLabApp.item.home.createOrEditLabel');
    await itemUpdatePage.cancel();
  });

  it('should create and save Items', async () => {
    const nbButtonsBeforeCreate = await itemComponentsPage.countDeleteButtons();

    await itemComponentsPage.clickOnCreateButton();

    await promise.all([
      itemUpdatePage.setItemReferenceIdInput('ITM_19'),
      itemUpdatePage.setItemNameInput('itemName'),
      itemUpdatePage.incidentSelectLastOption()
    ]);

    expect(await itemUpdatePage.getItemReferenceIdInput()).to.eq('ITM_19', 'Expected ItemReferenceId value to be equals to ITM_19');
    expect(await itemUpdatePage.getItemNameInput()).to.eq('itemName', 'Expected ItemName value to be equals to itemName');

    await itemUpdatePage.save();
    expect(await itemUpdatePage.getSaveButton().isPresent(), 'Expected save button disappear').to.be.false;

    expect(await itemComponentsPage.countDeleteButtons()).to.eq(nbButtonsBeforeCreate + 1, 'Expected one more entry in the table');
  });

  it('should delete last Item', async () => {
    const nbButtonsBeforeDelete = await itemComponentsPage.countDeleteButtons();
    await itemComponentsPage.clickOnLastDeleteButton();

    itemDeleteDialog = new ItemDeleteDialog();
    expect(await itemDeleteDialog.getDialogTitle()).to.eq('iconnectSampleAppLabApp.item.delete.question');
    await itemDeleteDialog.clickOnConfirmButton();

    expect(await itemComponentsPage.countDeleteButtons()).to.eq(nbButtonsBeforeDelete - 1);
  });

  after(async () => {
    await navBarPage.autoSignOut();
  });
});
