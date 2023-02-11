//
//  ViewController.swift
//  CareCost
//
//  Created by Frank Gao on 2/11/23.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var privacyLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    private var ageTextField: UITextField!
    @IBOutlet weak var sexLabel: UILabel!
    private var sexTextField: UITextField!
    @IBOutlet weak var childrenLabel: UILabel!
    private var childrenTextField: UITextField!
    
    @IBOutlet weak var bmiLabel: UILabel!
    private var bmiTextField: UITextField!
    @IBOutlet weak var bmiButton: UIButton!
    
    @IBOutlet weak var smokerLabel: UILabel!
    private var smokerTextField: UITextField!
    @IBOutlet weak var stateLabel: UILabel!
    private var stateTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    let sexes = ["", "Female", "Male"]
    var sexPickerView = UIPickerView()
    
    let smokers = ["", "Yes", "No"]
    var smokerPickerView = UIPickerView()
    
    let states = ["", "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
    var statePickerView = UIPickerView()
    
    private var labelTextFieldPadding = CGFloat(10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Theme.VIEW_BACKGROUND_COLOR
        
        configureTitleLabel()
        configurePrivacyLabel()
        
        configureAge()
        configureSex()
        configureNumChildren()
        configureBMI()
        /*configureSmoke()
        configureState()*/
        
        /*sexPickerView.delegate = self
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
        childrenTextField.delegate = self*/
    }
    
    // MARK: Display
    
    private func configureTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: Theme.SCREEN_WIDTH / 7),
            titleLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -Theme.SCREEN_WIDTH / 7)
        ])
        
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 20)
    }
    
    private func configurePrivacyLabel() {
        privacyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            privacyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            privacyLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: Theme.SCREEN_WIDTH / 8),
            privacyLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -Theme.SCREEN_WIDTH / 8)
        ])
        
        privacyLabel.textAlignment = .center
        privacyLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 14)
    }
    
    private func configureAge() {
        ageTextField = CCTextField(placeholder: "")
        self.view.addSubview(ageTextField)
        
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ageTextField.topAnchor.constraint(equalTo: privacyLabel.bottomAnchor, constant: 30),
            ageTextField.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: Theme.SCREEN_WIDTH * 5 / 11),
            ageTextField.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -Theme.SCREEN_WIDTH * 3 / 10)
        ])
        
        ageTextField.textAlignment = .center
        
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ageLabel.rightAnchor.constraint(equalTo: ageTextField.leftAnchor, constant: -labelTextFieldPadding),
            ageLabel.topAnchor.constraint(equalTo: ageTextField.topAnchor),
            ageLabel.bottomAnchor.constraint(equalTo: ageTextField.bottomAnchor)
                                                
        ])
        
        ageLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
    }
    
    private func configureSex() {
        sexTextField = CCTextField(placeholder: "")
        self.view.addSubview(sexTextField)
        
        sexTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sexTextField.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: labelTextFieldPadding * 1.5),
            sexTextField.leftAnchor.constraint(equalTo: ageTextField.leftAnchor),
            sexTextField.rightAnchor.constraint(equalTo: ageTextField.rightAnchor)
        ])
        
        sexTextField.textAlignment = .center
        
        sexLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sexLabel.rightAnchor.constraint(equalTo: sexTextField.leftAnchor, constant: -labelTextFieldPadding),
            sexLabel.topAnchor.constraint(equalTo: sexTextField.topAnchor),
            sexLabel.bottomAnchor.constraint(equalTo: sexTextField.bottomAnchor)
                                                
        ])
        
        sexLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
    }
    
    private func configureNumChildren() {
        childrenTextField = CCTextField(placeholder: "")
        self.view.addSubview(childrenTextField)
        
        childrenTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childrenTextField.topAnchor.constraint(equalTo: sexTextField.bottomAnchor, constant: labelTextFieldPadding * 1.5),
            childrenTextField.leftAnchor.constraint(equalTo: sexTextField.leftAnchor),
            childrenTextField.rightAnchor.constraint(equalTo: sexTextField.rightAnchor)
        ])
        
        childrenTextField.textAlignment = .center
        
        childrenLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childrenLabel.rightAnchor.constraint(equalTo: childrenTextField.leftAnchor, constant: -labelTextFieldPadding),
            childrenLabel.topAnchor.constraint(equalTo: childrenTextField.topAnchor),
            childrenLabel.bottomAnchor.constraint(equalTo: childrenTextField.bottomAnchor)
                                                
        ])
        
        childrenLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
    }
    
    private func configureBMI() {
        bmiTextField = CCTextField(placeholder: "")
        self.view.addSubview(bmiTextField)
        
        bmiTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bmiTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            bmiTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            bmiTextField.widthAnchor.constraint(equalToConstant: Theme.SCREEN_WIDTH / 7)
        ])
        
        bmiTextField.textAlignment = .center
        
        bmiLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bmiLabel.rightAnchor.constraint(equalTo: bmiTextField.leftAnchor, constant: -labelTextFieldPadding),
            bmiLabel.topAnchor.constraint(equalTo: bmiTextField.topAnchor),
            bmiLabel.bottomAnchor.constraint(equalTo: bmiTextField.bottomAnchor)
        ])
        
        bmiLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
        
        bmiButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    // MARK: Actions
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let digits = "1234567890."
        let digitSet = CharacterSet(charactersIn: digits)
        let typedDigitSet = CharacterSet(charactersIn: string)
        
        return digitSet.isSuperset(of: typedDigitSet)
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
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GraphViewController")

        navigationController!.pushViewController(vc, animated: true)
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





