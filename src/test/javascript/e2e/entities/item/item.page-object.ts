import { element, by, ElementFinder } from 'protractor';

export class ItemComponentsPage {
  createButton = element(by.id('jh-create-entity'));
  deleteButtons = element.all(by.css('ic-item div table .btn-danger'));
  title = element.all(by.css('ic-item div h2#page-heading span')).first();
  noResult = element(by.id('no-result'));
  entities = element(by.id('entities'));

  async clickOnCreateButton(): Promise<void> {
    await this.createButton.click();
  }

  async clickOnLastDeleteButton(): Promise<void> {
    await this.deleteButtons.last().click();
  }

  async countDeleteButtons(): Promise<number> {
    return this.deleteButtons.count();
  }

  async getTitle(): Promise<string> {
    return this.title.getAttribute('jhiTranslate');
  }
}

export class ItemUpdatePage {
  pageTitle = element(by.id('ic-item-heading'));
  saveButton = element(by.id('save-entity'));
  cancelButton = element(by.id('cancel-save'));

  itemReferenceIdInput = element(by.id('field_itemReferenceId'));
  itemNameInput = element(by.id('field_itemName'));

  incidentSelect = element(by.id('field_incident'));

  async getPageTitle(): Promise<string> {
    return this.pageTitle.getAttribute('jhiTranslate');
  }

  async setItemReferenceIdInput(itemReferenceId: string): Promise<void> {
    await this.itemReferenceIdInput.sendKeys(itemReferenceId);
  }

  async getItemReferenceIdInput(): Promise<string> {
    return await this.itemReferenceIdInput.getAttribute('value');
  }

  async setItemNameInput(itemName: string): Promise<void> {
    await this.itemNameInput.sendKeys(itemName);
  }

  async getItemNameInput(): Promise<string> {
    return await this.itemNameInput.getAttribute('value');
  }

  async incidentSelectLastOption(): Promise<void> {
    await this.incidentSelect
      .all(by.tagName('option'))
      .last()
      .click();
  }

  async incidentSelectOption(option: string): Promise<void> {
    await this.incidentSelect.sendKeys(option);
  }

  getIncidentSelect(): ElementFinder {
    return this.incidentSelect;
  }

  async getIncidentSelectedOption(): Promise<string> {
    return await this.incidentSelect.element(by.css('option:checked')).getText();
  }

  async save(): Promise<void> {
    await this.saveButton.click();
  }

  async cancel(): Promise<void> {
    await this.cancelButton.click();
  }

  getSaveButton(): ElementFinder {
    return this.saveButton;
  }
}

export class ItemDeleteDialog {
  private dialogTitle = element(by.id('ic-delete-item-heading'));
  private confirmButton = element(by.id('ic-confirm-delete-item'));

  async getDialogTitle(): Promise<string> {
    return this.dialogTitle.getAttribute('jhiTranslate');
  }

  async clickOnConfirmButton(): Promise<void> {
    await this.confirmButton.click();
  }
}
