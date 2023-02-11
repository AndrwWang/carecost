//
//  ViewController.swift
//  CareCost
//
//  Created by Frank Gao on 2/11/23.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    
    @IBOutlet weak var bmiTextField: UITextField!
    
    @IBOutlet weak var childrenTextField: UITextField!
    
    @IBOutlet weak var smokerTextField: UITextField!
    
    @IBOutlet weak var stateTextField: UITextField!
    
    let sexes = ["", "Female", "Male"]
    var sexPickerView = UIPickerView()
    
    let smokers = ["", "Yes", "No"]
    var smokerPickerView = UIPickerView()
    
    let states = ["", "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
    var statePickerView = UIPickerView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sexPickerView.delegate = self
        sexPickerView.dataSource = self
        sexTextField.inputView = sexPickerView
        sexTextField.textAlignment = .center
        sexPickerView.tag = 1
        
        smokerPickerView.delegate = self
        smokerPickerView.dataSource = self
        smokerTextField.inputView = smokerPickerView
        smokerTextField.textAlignment = .center
        smokerPickerView.tag = 2
        
        statePickerView.delegate = self
        statePickerView.dataSource = self
        stateTextField.inputView = statePickerView
        stateTextField.textAlignment = .center
        statePickerView.tag = 3
        
        ageTextField.delegate = self
        bmiTextField.delegate = self
        childrenTextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
             let digits = "1234567890."
             let digitSet = CharacterSet(charactersIn: digits)
            let typedDigitSet = CharacterSet(charactersIn: string)
            return digitSet .isSuperset(of: typedDigitSet)
        
        
       }
    
    @IBAction func submitButton(_ sender: UIButton) {
        let northwest = ["Alaska", "Colorado", "Idaho", "Montana", "Nebraska", "North Dakota", "Oregon", "South Dakota", "Washington", "Wyoming"]
        let northeast = ["Connecticut", "Delaware", "District of Columbia", "Illinois", "Indiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "New Hampshire", "New Jersey", "New York", "Ohio", "Pennsylvania", "Rhode Island", "Vermont", "Wisconsin"]
        let southwest = ["Arizona", "California", "Hawaii", "Kansas", "Kentucky", "Louisiana", "Nevada", "New Mexico", "Oklahoma", "Texas", "Utah" ]
        let southeast = ["Alabama", "Arkansas", "Florida", "Georgia", "Mississippi", "Missouri", "North Carolina", "South Carolina", "Tennessee", "Virginia", "West Virginia"]
        var region = ""
        if(northwest.contains(stateTextField.text!)) {
            region = "northwest"
        } else if (northeast.contains(stateTextField.text!)) {
            region = "northeast"
        } else if (southwest.contains(stateTextField.text!)) {
            region = "southwest"
        } else if (southeast.contains(stateTextField.text!)) {
            region = "southeast"
        }
        
        let age = Int(ageTextField.text!)
        let sex = sexTextField.text!
        let bmi = Double(bmiTextField.text!)
        let numberOfChildren = Int(childrenTextField.text!)
        let smokerStatus = smokerTextField.text!
        
        print(age)
        print(sex)
        print(bmi)
        print(numberOfChildren)
        print(smokerStatus)
        print(region)
        
    }
}

extension InputViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if (pickerView.tag == 1) {
            return 1
        } else if (pickerView.tag == 2) {
            return 1
        } else if (pickerView.tag == 3) {
            return 1
        }
        return 0
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1) {
            return sexes.count
        } else if (pickerView.tag == 2) {
            return smokers.count
        } else if (pickerView.tag == 3) {
            return states.count
        }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1) {
            return sexes[row]
        } else if (pickerView.tag == 2) {
            return smokers[row]
        } else if (pickerView.tag == 3) {
            return states[row]
        }
        return ""
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 1) {
            sexTextField.text = sexes[row]
            sexTextField.resignFirstResponder()
        } else if (pickerView.tag == 2) {
            smokerTextField.text = smokers[row]
            smokerTextField.resignFirstResponder()
        }
        else if (pickerView.tag == 3) {
            stateTextField.text = states[row]
            stateTextField.resignFirstResponder()
        }
    }
}
    




