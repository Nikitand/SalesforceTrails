import { LightningElement, wire } from 'lwc';
import FIRST_NAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LAST_NAME_FIELD from '@salesforce/schema/Contact.LastName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import { reduceErrors } from 'c/ldsUtils';
const COLUMNS = [
    { label: 'Contact First Name', fieldName: FIRST_NAME_FIELD.fieldApiName, type: 'text' },
    { label: 'Contact Last Name', fieldName: LAST_NAME_FIELD.fieldApiName, type: 'currency' },
    { label: 'Email', fieldName: EMAIL_FIELD.fieldApiName, type: 'text' }
];
export default class ContactList extends LightningElement {
    columns = COLUMNS;
    @wire(getContacts)
    error;
    wiredContacts({ error, data }) {
    if (data) {
    this.contacts = data;
    this.error = undefined;
    } else if (error) {
    this.error = error;
    this.contacts = undefined;
    }
    }
    get errors() {
    return (this.accounts.error) ?
    reduceErrors(this.accounts.error) : [];
    }
    }