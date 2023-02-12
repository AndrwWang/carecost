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
        //configureWeight()
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
        titleLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 32)
        titleLabel.textColor = .white
        titleLabel.adjustsFontSizeToFitWidth = true
    }
}

