//
//  ViewController.swift
//  CareCost
//
//  Created by Frank Gao on 2/11/23.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate, UIPopoverPresentationControllerDelegate {
    @IBOutlet weak var logoView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var privacyLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    private var ageTextField: UITextField!
    @IBOutlet weak var sexLabel: UILabel!
    private var sexTextField: UITextField!
    @IBOutlet weak var childrenLabel: UILabel!
    private var childrenTextField: UITextField!
    
    @IBOutlet weak var bmiLabel: UILabel!
    var bmiTextField: UITextField!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Theme.VIEW_BACKGROUND_COLOR
        
        configureTitleLabel()
        configurePrivacyLabel()
        
        configureAge()
        configureSex()
        configureNumChildren()
        configureBMI()
        configureSmoker()
        configureState()
        configureSubmit()
        
        animateLogo()
    }
    
    func animateLogo() {
        let originalFrame = self.logoView.frame
        self.logoView.alpha = 0
        UIView.animate(withDuration: 5, animations: {
            self.logoView.alpha = 1
        }, completion: { (finished) in
            if finished {
                UIView.animate(withDuration: 30, animations: {
                    self.logoView.frame.origin.y -= 1000
                }, completion: { (finished) in
                    if finished {
                        self.logoView.frame = originalFrame
                        self.animateLogo()
                    }
                })
            }
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
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
        ageTextField = CCTextField(placeholder: "", backgroundColor: .white, borderColor: Theme.BUTTON_BACKGROUND_COLOR!)
        ageTextField.delegate = self
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
            ageLabel.rightAnchor.constraint(equalTo: ageTextField.leftAnchor, constant: -Theme.LABEL_TEXTFIELD_PADDING),
            ageLabel.topAnchor.constraint(equalTo: ageTextField.topAnchor),
            ageLabel.bottomAnchor.constraint(equalTo: ageTextField.bottomAnchor)
            
        ])
        
        ageLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
    }
    
    private func configureSex() {
        sexTextField = CCTextField(placeholder: "", backgroundColor: .white, borderColor: Theme.BUTTON_BACKGROUND_COLOR!)
        self.view.addSubview(sexTextField)
        
        sexTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sexTextField.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: Theme.LABEL_TEXTFIELD_PADDING * 1.5),
            sexTextField.leftAnchor.constraint(equalTo: ageTextField.leftAnchor),
            sexTextField.rightAnchor.constraint(equalTo: ageTextField.rightAnchor)
        ])
        
        sexTextField.textAlignment = .center
        
        sexLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sexLabel.rightAnchor.constraint(equalTo: sexTextField.leftAnchor, constant: -Theme.LABEL_TEXTFIELD_PADDING),
            sexLabel.topAnchor.constraint(equalTo: sexTextField.topAnchor),
            sexLabel.bottomAnchor.constraint(equalTo: sexTextField.bottomAnchor)
            
        ])
        
        sexLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
        
        sexPickerView.delegate = self
        sexPickerView.dataSource = self
        sexTextField.inputView = sexPickerView
        sexTextField.textAlignment = .center
        sexPickerView.tag = 1
    }
    
    private func configureNumChildren() {
        childrenTextField = CCTextField(placeholder: "", backgroundColor: .white, borderColor: Theme.BUTTON_BACKGROUND_COLOR!)
        childrenTextField.delegate = self
        self.view.addSubview(childrenTextField)
        
        childrenTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childrenTextField.topAnchor.constraint(equalTo: sexTextField.bottomAnchor, constant: Theme.LABEL_TEXTFIELD_PADDING * 1.5),
            childrenTextField.leftAnchor.constraint(equalTo: sexTextField.leftAnchor),
            childrenTextField.rightAnchor.constraint(equalTo: sexTextField.rightAnchor)
        ])
        
        childrenTextField.textAlignment = .center
        
        childrenLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childrenLabel.rightAnchor.constraint(equalTo: childrenTextField.leftAnchor, constant: -Theme.LABEL_TEXTFIELD_PADDING),
            childrenLabel.topAnchor.constraint(equalTo: childrenTextField.topAnchor),
            childrenLabel.bottomAnchor.constraint(equalTo: childrenTextField.bottomAnchor)
        ])
        
        childrenLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
    }
    
    private func configureBMI() {
        bmiTextField = CCTextField(placeholder: "", backgroundColor: .white, borderColor: Theme.BUTTON_BACKGROUND_COLOR!)
        bmiTextField.delegate = self
        self.view.addSubview(bmiTextField)
        
        bmiTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bmiTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -Theme.SCREEN_WIDTH / 8),
            bmiTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            bmiTextField.widthAnchor.constraint(equalToConstant: Theme.SCREEN_WIDTH / 7)
        ])
        
        bmiTextField.textAlignment = .center
        
        bmiLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bmiLabel.rightAnchor.constraint(equalTo: bmiTextField.leftAnchor, constant: -Theme.LABEL_TEXTFIELD_PADDING),
            bmiLabel.topAnchor.constraint(equalTo: bmiTextField.topAnchor),
            bmiLabel.bottomAnchor.constraint(equalTo: bmiTextField.bottomAnchor)
        ])
        
        bmiLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
        
        bmiButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bmiButton.leftAnchor.constraint(equalTo: bmiTextField.rightAnchor, constant: Theme.LABEL_TEXTFIELD_PADDING),
            bmiButton.widthAnchor.constraint(equalToConstant: Theme.SCREEN_WIDTH * 3 / 10),
            bmiButton.topAnchor.constraint(equalTo: bmiTextField.topAnchor, constant: 5),
            bmiButton.bottomAnchor.constraint(equalTo: bmiTextField.bottomAnchor, constant: -5)
        ])
        
        let bmiButtonTitle = NSAttributedString(string: "What is my BMI?",
                                                attributes: [NSAttributedString.Key.font : UIFont(name: Theme.DEFAULT_FONT, size: 12)!,
                                                             NSAttributedString.Key.foregroundColor : Theme.BUTTON_TEXT_COLOR!])
        bmiButton.setAttributedTitle(bmiButtonTitle, for: .normal)
        
        bmiButton.setBackgroundColor(color: Theme.BUTTON_BACKGROUND_COLOR!, forState: .normal)
        bmiButton.titleLabel!.textAlignment = .center
        
        bmiButton.layer.cornerRadius = Theme.CORNER_RADIUS * 2 / 3
        bmiButton.addTarget(self, action: #selector(bmiClicked), for: .touchUpInside)
    }
    
    private func configureSmoker() {
        smokerTextField = CCTextField(placeholder: "", backgroundColor: .white, borderColor: Theme.BUTTON_BACKGROUND_COLOR!)
        self.view.addSubview(smokerTextField)
        
        smokerTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            smokerTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: Theme.SCREEN_HEIGHT / 2),
            //smokerTextField.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -Theme.SCREEN_HEIGHT / 5),
            smokerTextField.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: Theme.SCREEN_WIDTH * 3 / 5),
            smokerTextField.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -Theme.SCREEN_WIDTH / 5),
        ])
        
        smokerTextField.textAlignment = .center
        
        smokerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            smokerLabel.rightAnchor.constraint(equalTo: smokerTextField.leftAnchor, constant: -Theme.LABEL_TEXTFIELD_PADDING),
            smokerLabel.topAnchor.constraint(equalTo: smokerTextField.topAnchor),
            smokerLabel.bottomAnchor.constraint(equalTo: smokerTextField.bottomAnchor)
            
        ])
        
        smokerLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
        
        smokerPickerView.delegate = self
        smokerPickerView.dataSource = self
        smokerTextField.inputView = smokerPickerView
        smokerTextField.textAlignment = .center
        smokerPickerView.tag = 2
    }
    
    private func configureState() {
        stateTextField = CCTextField(placeholder: "", backgroundColor: .white, borderColor: Theme.BUTTON_BACKGROUND_COLOR!)
        self.view.addSubview(stateTextField)
        
        stateTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stateTextField.topAnchor.constraint(equalTo: smokerTextField.bottomAnchor, constant: Theme.LABEL_TEXTFIELD_PADDING * 1.5),
            stateTextField.leftAnchor.constraint(equalTo: smokerTextField.leftAnchor),
            stateTextField.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -Theme.SCREEN_WIDTH / 12)
        ])
        
        stateTextField.textAlignment = .center
        stateTextField.font = UIFont(name: Theme.DEFAULT_FONT, size: 12)
        
        stateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stateLabel.rightAnchor.constraint(equalTo: stateTextField.leftAnchor, constant: -Theme.LABEL_TEXTFIELD_PADDING),
            stateLabel.topAnchor.constraint(equalTo: stateTextField.topAnchor),
            stateLabel.bottomAnchor.constraint(equalTo: stateTextField.bottomAnchor)
            
        ])
        
        stateLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
        
        statePickerView.delegate = self
        statePickerView.dataSource = self
        stateTextField.inputView = statePickerView
        stateTextField.textAlignment = .center
        statePickerView.tag = 3
    }
    
    private func configureSubmit() {
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Theme.SCREEN_WIDTH / 3).isActive = true
        submitButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -Theme.SCREEN_WIDTH / 3).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        submitButton.topAnchor.constraint(equalTo: stateTextField.bottomAnchor, constant: 40).isActive = true
        
        let startTitle = NSAttributedString(string: "Submit!",
                                            attributes: [NSAttributedString.Key.font : UIFont(name: Theme.DEFAULT_FONT, size: Theme.BUTTON_FONT_SIZE)!,
                                                         NSAttributedString.Key.foregroundColor : Theme.BUTTON_TEXT_COLOR!])
        submitButton.setAttributedTitle(startTitle, for: .normal)
        submitButton.setBackgroundColor(color: Theme.BUTTON_BACKGROUND_COLOR!, forState: .normal)
        submitButton.titleLabel!.textAlignment = .center
        
        submitButton.layer.cornerRadius = Theme.CORNER_RADIUS
        submitButton.addTarget(self, action: #selector(submitClicked), for: .touchUpInside)
        submitButton.isEnabled = shouldEnableSubmitButton()
    }
    
    // MARK: Helper
    
    private func shouldEnableSubmitButton() -> Bool {
        return true //FOR TESTING
        
        guard let age = Double(ageTextField.text!) else {
            return false
        }
        guard let sex = sexTextField.text else {
            return false
        }
        guard let numChildren = Int(childrenTextField.text!) else {
            return false
        }
        guard let bmi = Double(bmiTextField.text!) else {
            return false
        }
        guard let smoker = smokerTextField.text else {
            return false
        }
        guard let state = stateTextField.text else {
            return false
        }
        
        return age >= 0 && !sex.isEmpty && numChildren >= 0 && bmi >= 0 && !smoker.isEmpty && !state.isEmpty
    }
    
    // MARK: Actions
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        submitButton.isEnabled = shouldEnableSubmitButton()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let digits = "1234567890."
        let digitSet = CharacterSet(charactersIn: digits)
        let typedDigitSet = CharacterSet(charactersIn: string)
        
        return digitSet.isSuperset(of: typedDigitSet)
    }
    
    @objc func bmiClicked() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier:"BMICalculatorViewController") {
            vc.modalTransitionStyle   = .coverVertical
            vc.modalPresentationStyle = .popover
            vc.popoverPresentationController?.sourceView = self.view
            vc.popoverPresentationController?.sourceRect =
            CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            vc.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue:0)
            vc.popoverPresentationController?.delegate = self
            
            vc.preferredContentSize = CGSize(width: Theme.SCREEN_WIDTH * 3 / 4, height: Theme.SCREEN_HEIGHT / 3)
            
            (vc as! BMICalculatorViewController).delegate = self
            
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @objc func submitClicked() {
        let northwest = ["Alaska", "Colorado", "Idaho", "Iowa", "Montana", "Nebraska", "North Dakota", "Oregon", "South Dakota", "Washington", "Wyoming"]
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
        
        /*let age = Int(ageTextField.text!)!
        let sex = sexTextField.text!
        let bmi = Double(bmiTextField.text!)!
        let numberOfChildren = Int(childrenTextField.text!)!
        let smokerStatus = smokerTextField.text!*/
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GraphViewController") as! GraphViewController
        //vc.setMetrics(age: age, sex: sex.lowercased(), numOfChildren: numberOfChildren, bmi: bmi, smoker: smokerStatus.lowercased(), region: region.lowercased())
        
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
        
        submitButton.isEnabled = shouldEnableSubmitButton()
    }
}





