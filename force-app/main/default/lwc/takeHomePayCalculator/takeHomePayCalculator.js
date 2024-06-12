import { LightningElement } from 'lwc';
const SocialSecurityWithholding = 0.062;
const MedicareWithholding = 0.0145;
const FederalIncomeTaxRate = 0.25;
const NumberOfPayPeriods = 26;

export default class TakeHomePayCalculator extends LightningElement {
    netTakeHomePayAmount; // Reactive property for the gross take-home pay
    SalaryValue; // Reactive property for the salary
    selectedOption; // Reactive property for the pay frequency
    value; // Reactive property for the marital status
    
    options = [
        { label: 'Daily', value: 'Daily' },
        { label: 'Weekly', value: 'Weekly' },
        { label: 'Bi-Weekly', value: 'Bi-Weekly' },
        { label: 'Semi-Monthly', value: 'Semi-Monthly' },
        { label: 'Monthly', value: 'Monthly' },
        { label: 'Quarterly', value: 'Quarterly' },
        { label: 'Semi-Annually', value: 'Semi-Annually' },
        { label: 'Annually', value: 'Annually' },
    ];

    get radioOptions() {
        return [
            { label: 'Single', value: 'Single' },
            { label: 'Married', value: 'Married' },
        ];
    }

    selectedOption = 'Bi-Weekly'; // Initialize the selected option
    selectedRadioValue = ''; // Initialize the selected radio value


    calculateTakeHomePay() {
        let GrossTakeHomePayAmount = this.SalaryValue / NumberOfPayPeriods;
        let SocialSecurityAmount = GrossTakeHomePayAmount * SocialSecurityWithholding;
        let MedicareAmount = GrossTakeHomePayAmount * MedicareWithholding;
        let FederalTaxAmount = GrossTakeHomePayAmount * FederalIncomeTaxRate;
        
        let netTakeHomePay = GrossTakeHomePayAmount - (SocialSecurityAmount + MedicareAmount + FederalTaxAmount);
        this.netTakeHomePayAmount = netTakeHomePay.toFixed(2);
    }

    handleChange(event) { // Change handler
        this.selectedOption = event.detail.value;
    }

    handleRadioValueChange(event) {
        this.selectedRadioValue = event.detail.value;
        // Perform any additional logic based on the selected radio value
    }

    handleSalaryChange(event) {
        this.SalaryValue = event.detail.value;
}
}
