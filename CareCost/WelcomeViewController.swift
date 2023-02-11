//
//  ViewController.swift
//  CareCost
//
//  Created by Frank Gao on 2/11/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var welcomeTextView: UITextView!
    
    //@IBOutlet weak var nameTextField: UITextField!
    private var nameTextField: CCTextField!
    @IBOutlet weak var startButton: UIButton!
    
    private var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Theme.SCREEN_WIDTH = self.view.frame.width
        Theme.SCREEN_HEIGHT = self.view.frame.height
        self.view.backgroundColor = Theme.VIEW_BACKGROUND_COLOR
        
        configureWelcomeLabel()
        configureAppNameLabel()
        configureNameTextField()
        configureWelcomeTextView()
        configureStartButton()
    }
    
    override func viewDidLayoutSubviews() {
        print(nameTextField.hasAmbiguousLayout)
        print(appNameLabel.frame.width)
        print(appNameLabel.frame.height)
    }
    
    // MARK: Display
    
    private func configureWelcomeLabel() {
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            welcomeLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Theme.SCREEN_WIDTH / 7),
            welcomeLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -Theme.SCREEN_WIDTH / 7),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 50),
            welcomeLabel.bottomAnchor.constraint(equalTo: appNameLabel.topAnchor)
        ])
        
        welcomeLabel.layer.contentsGravity = .center
        welcomeLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 32)
        welcomeLabel.textColor = Theme.DEFAULT_TEXT_COLOR
    }
    
    private func configureAppNameLabel() {
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appNameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: Theme.SCREEN_HEIGHT / 5),
            appNameLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -Theme.SCREEN_HEIGHT * 7 / 10),
            appNameLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Theme.SCREEN_WIDTH / 7),
            appNameLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -Theme.SCREEN_WIDTH / 7)
        ])
        
        appNameLabel.layer.contentsGravity = .center
        appNameLabel.attributedText = NSAttributedString(string: "CareCost",
                                                         attributes: [NSAttributedString.Key.font : UIFont(name: Theme.DEFAULT_FONT, size: 32)!,
                                                                      NSAttributedString.Key.strokeWidth : -2])
    }
    
    private func configureWelcomeTextView() {
        welcomeTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            welcomeTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Theme.SCREEN_WIDTH / 7),
            welcomeTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Theme.SCREEN_WIDTH / 7),
            welcomeTextView.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -20),
            welcomeTextView.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 20)
        ])
        
        welcomeTextView.isUserInteractionEnabled = false
        welcomeTextView.font = UIFont(name: Theme.DEFAULT_FONT, size: 22)
        welcomeTextView.backgroundColor = UIColor(hex: "#00000000")
        welcomeTextView.layer.contentsGravity = .center
        welcomeTextView.textColor = Theme.DEFAULT_TEXT_COLOR
    }
    
    private func configureNameTextField() {
        nameTextField = CCTextField(placeholder: "Name (optional)")
        self.view.addSubview(nameTextField)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Theme.SCREEN_WIDTH / 7).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -Theme.SCREEN_WIDTH / 7).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        nameTextField.addTarget(self, action: #selector(nameFieldEdited), for: .editingChanged)
        
    }
    
    private func configureStartButton() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Theme.SCREEN_WIDTH / 3).isActive = true
        startButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -Theme.SCREEN_WIDTH / 3).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        
        let startTitle = NSAttributedString(string: "Start!",
                                                           attributes: [NSAttributedString.Key.font : UIFont(name: Theme.DEFAULT_FONT, size: Theme.BUTTON_FONT_SIZE)!,
                                                                        NSAttributedString.Key.foregroundColor : Theme.BUTTON_TEXT_COLOR!])
        startButton.setAttributedTitle(startTitle, for: .normal)
        startButton.setBackgroundColor(color: Theme.BUTTON_BACKGROUND_COLOR!, forState: .normal)
        startButton.titleLabel!.textAlignment = .center
        
        startButton.layer.cornerRadius = Theme.CORNER_RADIUS
        startButton.addTarget(self, action: #selector(toInputVC), for: .touchUpInside)
    }
    
    // MARK: Actions
    
    @objc func nameFieldEdited() {
        name = !nameTextField.text!.trimmingCharacters(in: .whitespaces).isEmpty ? nameTextField.text : nil
    }
    
    @objc func toInputVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "InputViewController")

        navigationController!.pushViewController(vc, animated: true)
    }
}

