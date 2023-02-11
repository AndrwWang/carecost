//
//  ViewController.swift
//  CareCost
//
//  Created by Frank Gao on 2/11/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logoPlaceholder: UILabel!
    @IBOutlet weak var welcomeTextView: UITextView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    
    private var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Theme.SCREEN_WIDTH = self.view.frame.width
        Theme.SCREEN_HEIGHT = self.view.frame.height
        self.view.backgroundColor = Theme.VIEW_BACKGROUND_COLOR
        
        configureWelcomeLabel()
        configureWelcomeTextView()
        configureNameTextField()
        configureStartButton()
    }
    
    override func viewDidLayoutSubviews() {
        print(nameTextField.hasAmbiguousLayout)
        print(startButton.titleLabel?.frame.width)
        print(startButton.titleLabel?.frame.height)
    }
    
    // MARK: Display
    
    private func configureWelcomeLabel() {
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Theme.SCREEN_WIDTH / 5).isActive = true
        welcomeLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -Theme.SCREEN_WIDTH / 5).isActive = true
        welcomeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        welcomeLabel.bottomAnchor.constraint(equalTo: logoPlaceholder.topAnchor, constant: -20).isActive = true
        
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 32)
        welcomeLabel.textColor = Theme.DEFAULT_TEXT_COLOR
    }
    
    private func configureWelcomeTextView() {
        welcomeTextView.translatesAutoresizingMaskIntoConstraints = false
        welcomeTextView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Theme.SCREEN_WIDTH / 7).isActive = true
        welcomeTextView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -Theme.SCREEN_WIDTH / 7).isActive = true
        welcomeTextView.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -20).isActive = true
        welcomeTextView.topAnchor.constraint(equalTo: logoPlaceholder.bottomAnchor, constant: 20).isActive = true
        
        welcomeTextView.isUserInteractionEnabled = false
        welcomeTextView.font = UIFont(name: Theme.DEFAULT_FONT, size: 22)
        welcomeTextView.backgroundColor = UIColor(hex: "#00000000")
        welcomeTextView.textAlignment = .center
        welcomeTextView.textColor = Theme.DEFAULT_TEXT_COLOR
    }
    
    private func configureNameTextField() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Theme.SCREEN_WIDTH / 7).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -Theme.SCREEN_WIDTH / 7).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        nameTextField.placeholder = "Name (optional)"
        nameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: Theme.BUTTON_PADDING, height: nameTextField.frame.height))
        nameTextField.leftViewMode = .always
        nameTextField.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
        nameTextField.layer.borderWidth = 3
        nameTextField.layer.cornerRadius = Theme.CORNER_RADIUS
        nameTextField.layer.borderColor = Theme.BUTTON_BACKGROUND_COLOR!.cgColor
        nameTextField.clipsToBounds = true
        nameTextField.addTarget(self, action: #selector(nameFieldEdited), for: .editingChanged)

    }
    
    private func configureStartButton() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Theme.SCREEN_WIDTH / 3).isActive = true
        startButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -Theme.SCREEN_WIDTH / 3).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
                
        let mySelectedAttributedTitle = NSAttributedString(string: "Start!",
                                                           attributes: [NSAttributedString.Key.font : UIFont(name: Theme.DEFAULT_FONT, size: Theme.BUTTON_FONT_SIZE)!,
                                                                        NSAttributedString.Key.foregroundColor : Theme.BUTTON_TEXT_COLOR!])
        startButton.setAttributedTitle(mySelectedAttributedTitle, for: .normal)
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
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

