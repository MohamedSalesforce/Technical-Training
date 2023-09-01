import { LightningElement, api } from 'lwc';

export default class EmployeeDetails extends LightningElement {
    @api    
    employeeName;
    @api
    email;
    @api
    phone;
    @api
    company;
    @api
    role;
}