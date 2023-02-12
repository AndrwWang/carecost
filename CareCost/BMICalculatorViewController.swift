//
//  BMICalculatorViewController.swift
//  CareCost
//
//  Created by Frank Gao on 2/11/23.
//

import Foundation
//
//  ViewController.swift
//  CareCost
//
//  Created by Frank Gao on 2/11/23.
//

import UIKit

class BMICalculatorViewController: UIViewController {
    var delegate: InputViewController?
    
    private var titleLabel: UILabel!
    
    private var weightLabel: UILabel!
    private var weightField: UITextField!
    private var poundsLabel: UILabel!
    
    private var heightLabel: UILabel!
    private var feetField: UITextField!
    private var inchesField: UITextField!
    private var feetLabel: UILabel!
    private var inchesLabel: UILabel!
    
    private var calculateButton: UIButton!
    
    private var vcHeight: CGFloat = -1
    private var vcWidth: CGFloat = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vcHeight = preferredContentSize.height
        vcWidth = preferredContentSize.width
        self.view.backgroundColor = Theme.BUTTON_BACKGROUND_COLOR
        
        configureTitleLabel()
        configureWeight()
        configureHeight()
        configureCalculateButton()
    }

    //MARK: Display
    
    private func configureTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Calculate Your BMI\n(Body Mass Index)"
        titleLabel.numberOfLines = 2
        self.view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: vcHeight / 20),
            titleLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: vcWidth / 5),
            titleLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -vcWidth / 5)
        ])
        
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 24)
        titleLabel.textColor = .white
        titleLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func configureWeight() {
        weightField = CCTextField(placeholder: "", backgroundColor: Theme.VIEW_BACKGROUND_COLOR!, borderColor: Theme.BUTTON_TEXT_COLOR!)
        weightField.textAlignment = .center
        weightField.textColor = .white
        weightField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        self.view.addSubview(weightField)
        
        weightField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weightField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            weightField.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: vcWidth * 3 / 7),
            weightField.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -vcWidth / 3)
        ])
        
        weightLabel = UILabel()
        weightLabel.text = "Weight:"
        weightLabel.textColor = .white
        weightLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
        self.view.addSubview(weightLabel)
        
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weightLabel.rightAnchor.constraint(equalTo: weightField.leftAnchor, constant: -Theme.LABEL_TEXTFIELD_PADDING),
            weightLabel.topAnchor.constraint(equalTo: weightField.topAnchor),
            weightLabel.bottomAnchor.constraint(equalTo: weightField.bottomAnchor)
        ])
        
        poundsLabel = UILabel()
        poundsLabel.text = "lbs"
        poundsLabel.textColor = .white
        poundsLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
        self.view.addSubview(poundsLabel)
        
        poundsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            poundsLabel.leftAnchor.constraint(equalTo: weightField.rightAnchor, constant: Theme.LABEL_TEXTFIELD_PADDING),
            poundsLabel.topAnchor.constraint(equalTo: weightField.topAnchor),
            poundsLabel.bottomAnchor.constraint(equalTo: weightField.bottomAnchor)
        ])
    }
    
    private func configureHeight() {
        feetField = CCTextField(placeholder: "", backgroundColor: Theme.VIEW_BACKGROUND_COLOR!, borderColor: Theme.BUTTON_TEXT_COLOR!)
        feetField.textAlignment = .center
        feetField.textColor = .white
        feetField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        self.view.addSubview(feetField)
        
        feetField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            feetField.topAnchor.constraint(equalTo: weightField.bottomAnchor, constant: 20),
            feetField.leftAnchor.constraint(equalTo: weightField.leftAnchor),
            feetField.rightAnchor.constraint(equalTo: weightField.rightAnchor, constant: -20)
        ])
        
        feetLabel = UILabel()
        feetLabel.text = "ft"
        feetLabel.textColor = .white
        feetLabel.textAlignment = .center
        feetLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
        self.view.addSubview(feetLabel)
        
        feetLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            feetLabel.topAnchor.constraint(equalTo: feetField.bottomAnchor, constant: Theme.LABEL_TEXTFIELD_PADDING / 2),
            feetLabel.leftAnchor.constraint(equalTo: feetField.leftAnchor),
            feetLabel.rightAnchor.constraint(equalTo: feetField.rightAnchor)
        ])

        heightLabel = UILabel()
        heightLabel.text = "Height:"
        heightLabel.textColor = .white
        heightLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
        self.view.addSubview(heightLabel)

        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightLabel.rightAnchor.constraint(equalTo: feetField.leftAnchor, constant: -Theme.LABEL_TEXTFIELD_PADDING),
            heightLabel.topAnchor.constraint(equalTo: feetField.topAnchor),
            heightLabel.bottomAnchor.constraint(equalTo: feetField.bottomAnchor)
        ])
        
        inchesField = CCTextField(placeholder: "", backgroundColor: Theme.VIEW_BACKGROUND_COLOR!, borderColor: Theme.BUTTON_TEXT_COLOR!)
        inchesField.textAlignment = .center
        inchesField.textColor = .white
        inchesField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        self.view.addSubview(inchesField)
        
        inchesField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inchesField.leftAnchor.constraint(equalTo: feetField.rightAnchor, constant: Theme.LABEL_TEXTFIELD_PADDING),
            inchesField.topAnchor.constraint(equalTo: feetField.topAnchor),
            inchesField.bottomAnchor.constraint(equalTo: feetField.bottomAnchor),
            inchesField.widthAnchor.constraint(equalTo: feetField.widthAnchor)
        ])
        
        inchesLabel = UILabel()
        inchesLabel.text = "in"
        inchesLabel.textColor = .white
        inchesLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
        inchesLabel.textAlignment = .center
        self.view.addSubview(inchesLabel)
        
        inchesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inchesLabel.topAnchor.constraint(equalTo: inchesField.bottomAnchor, constant: Theme.LABEL_TEXTFIELD_PADDING / 2),
            inchesLabel.leftAnchor.constraint(equalTo: inchesField.leftAnchor),
            inchesLabel.rightAnchor.constraint(equalTo: inchesField.rightAnchor)
        ])
    }
    
    private func configureCalculateButton() {
        calculateButton = UIButton()
        self.view.addSubview(calculateButton)
        
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calculateButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: vcWidth / 3),
            calculateButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -vcWidth / 3),
            calculateButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -vcHeight / 10),
            calculateButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let calculateTitle = NSAttributedString(string: "Calculate",
                                                attributes: [NSAttributedString.Key.font : UIFont(name: Theme.DEFAULT_FONT, size: Theme.BUTTON_FONT_SIZE * 2 / 3)!,
                                                                        NSAttributedString.Key.foregroundColor : Theme.BUTTON_BACKGROUND_COLOR!])
        calculateButton.setAttributedTitle(calculateTitle, for: .normal)
        calculateButton.setBackgroundColor(color: Theme.BUTTON_TEXT_COLOR!, forState: .normal)
        calculateButton.titleLabel!.textAlignment = .center
        calculateButton.layer.cornerRadius = Theme.CORNER_RADIUS / 2
        
        calculateButton.addTarget(self, action: #selector(calculateClicked), for: .touchUpInside)
        calculateButton.isEnabled = shouldEnableCalculateButton()
    }
    
    //MARK: Helper
    
    private func calculateBMI(weightInPounds: Double, heightInInches: Double) -> Double {
        let kg = weightInPounds * 0.45359237
        let metersSquared = pow(heightInInches * 0.0254, 2)
        
        return kg / metersSquared
    }
    
    private func shouldEnableCalculateButton() -> Bool {
        guard let weight = Double(weightField.text!) else {
            return false
        }
        guard let feet = Double(feetField.text!) else {
            return false
        }
        guard let inches = Double(inchesField.text!) else {
            return false
        }
        
        return weight >= 0 && feet >= 0 && inches >= 0
    }

    //MARK: Action
    
    @objc func textFieldDidChange() {
        calculateButton.isEnabled = shouldEnableCalculateButton()
    }
    
    @objc func calculateClicked() {
        delegate?.bmiTextField.text = String(format: "%.1f", calculateBMI(weightInPounds: Double(weightField.text!)!, heightInInches: Double(feetField.text!)! * 12 + Double(inchesField.text!)!))

        dismiss(animated: true)
        
    }
}

