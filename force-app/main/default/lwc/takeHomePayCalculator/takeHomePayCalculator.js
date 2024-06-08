import { LightningElement } from 'lwc';
const devFundWeight = 0.23;
const ProcessAutoWeight = 0.30;
const UserInterfaceScoreWeight = 0.25;
const debugScoreWeight = 0.22;

export default class PlatformDevCalculator extends LightningElement {

    devFundamentalScore = 50;
    processScore = 50;
    userInterfaceScore = 50;
    debugScore = 50;

    certificationScore = 90;

    calculateScore(){
        let devFundWeightScore = this.devFundamentalScore * devFundWeight;
        let ProcessAutoWeightScore = this.processScore * ProcessAutoWeight;
        let UserInterfaceScoreWeightScore = this.userInterfaceScore * UserInterfaceScoreWeight;
        let debugScoreWeightScore = this.debugScore * debugScoreWeight;
        this.certificationScore = devFundWeightScore + ProcessAutoWeightScore + UserInterfaceScoreWeightScore + debugScoreWeightScore;
    }

    handlechange(event){           //change handler
        console.log(event.target.name, event.target.value);
        const inputName = event.target.name;
        let value = Number(event.target.value);
        if(inputName === 'devfundamentals'){
            this.devFundamentalScore = value;
        } else if (inputName === 'processScore'){
            this.processScore = value;
        } else if (inputName === "User Interface"){
            this.userInterfaceScore = value;
        } else if (inputName === 'Testing and Debugging'){
            this.debugScore = value;
        }

    }
}