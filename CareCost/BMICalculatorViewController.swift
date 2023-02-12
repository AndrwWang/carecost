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
    private var titleLabel: UILabel!
    
    private var weightLabel: UILabel!
    private var weightField: UITextField!
    private var poundsLabel: UILabel!
    
    private var heightLabel: UILabel!
    private var feetField: UITextField!
    private var inchesField: UITextField!
    private var feetLabel: UILabel!
    private var inchesLael: UILabel!
    
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
    }

    private func configureTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Calculate Your BMI\n(Body Mass Index)"
        titleLabel.numberOfLines = 2
        self.view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: vcHeight / 10),
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
}

