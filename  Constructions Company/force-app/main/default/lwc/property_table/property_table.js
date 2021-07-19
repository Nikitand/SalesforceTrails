import {api, LightningElement, wire } from 'lwc';
import getPropertyList from '@salesforce/apex/PropertyController.getPropertyList';

const columns =[
        {label: 'Name', fieldName: 'name'},
        {label: 'Price', fieldName: 'price',type: 'currency'}
];

export default class Property_table extends LightningElement {
  
    error;
    columns=columns;

    @api selectedProperties;

    @wire(getPropertyList)
    property;

    handlePropertySelection(event) {
        const selectedRows = event.detail.selectedRows;
        this.selectedProperties = [];
        for (let i = 0; i < selectedRows.length; i++) {
            this.selectedProperties.push(selectedRows[i].Id);
        }
    }
    
}