import { element, by, ElementFinder } from 'protractor';

export class IncidentComponentsPage {
  createButton = element(by.id('jh-create-entity'));
  deleteButtons = element.all(by.css('ic-incident div table .btn-danger'));
  title = element.all(by.css('ic-incident div h2#page-heading span')).first();
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

export class IncidentUpdatePage {
  pageTitle = element(by.id('ic-incident-heading'));
  saveButton = element(by.id('save-entity'));
  cancelButton = element(by.id('cancel-save'));

  incidentReferenceIdInput = element(by.id('field_incidentReferenceId'));
  incidentNameInput = element(by.id('field_incidentName'));
  incidentStatusSelect = element(by.id('field_incidentStatus'));
  incidentDateInput = element(by.id('field_incidentDate'));

  async getPageTitle(): Promise<string> {
    return this.pageTitle.getAttribute('jhiTranslate');
  }

  async setIncidentReferenceIdInput(incidentReferenceId: string): Promise<void> {
    await this.incidentReferenceIdInput.sendKeys(incidentReferenceId);
  }

  async getIncidentReferenceIdInput(): Promise<string> {
    return await this.incidentReferenceIdInput.getAttribute('value');
  }

  async setIncidentNameInput(incidentName: string): Promise<void> {
    await this.incidentNameInput.sendKeys(incidentName);
  }

  async getIncidentNameInput(): Promise<string> {
    return await this.incidentNameInput.getAttribute('value');
  }

  async setIncidentStatusSelect(incidentStatus: string): Promise<void> {
    await this.incidentStatusSelect.sendKeys(incidentStatus);
  }

  async getIncidentStatusSelect(): Promise<string> {
    return await this.incidentStatusSelect.element(by.css('option:checked')).getText();
  }

  async incidentStatusSelectLastOption(): Promise<void> {
    await this.incidentStatusSelect
      .all(by.tagName('option'))
      .last()
      .click();
  }

  async setIncidentDateInput(incidentDate: string): Promise<void> {
    await this.incidentDateInput.sendKeys(incidentDate);
  }

  async getIncidentDateInput(): Promise<string> {
    return await this.incidentDateInput.getAttribute('value');
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

export class IncidentDeleteDialog {
  private dialogTitle = element(by.id('ic-delete-incident-heading'));
  private confirmButton = element(by.id('ic-confirm-delete-incident'));

  async getDialogTitle(): Promise<string> {
    return this.dialogTitle.getAttribute('jhiTranslate');
  }

  async clickOnConfirmButton(): Promise<void> {
    await this.confirmButton.click();
  }
}
