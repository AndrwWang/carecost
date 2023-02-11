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
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Theme.SCREEN_WIDTH = self.view.frame.width
        Theme.SCREEN_HEIGHT = self.view.frame.height
        self.view.backgroundColor = Theme.VIEW_BACKGROUND_COLOR
        
        configureWelcome()
        configureStartButton()
    }
    
    override func viewDidLayoutSubviews() {
        print(startButton.hasAmbiguousLayout)
        print(startButton.titleLabel?.frame.width)
        print(startButton.titleLabel?.frame.height)
    }
    
    private func configureWelcome() {
        //welcomeLabel.font =
    }
    
    private func configureStartButton() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Theme.SCREEN_WIDTH / 3).isActive = true
        startButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -Theme.SCREEN_WIDTH / 3).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10).isActive = true
                
        let mySelectedAttributedTitle = NSAttributedString(string: "Start!",
                                                           attributes: [NSAttributedString.Key.font : UIFont(name: "KannadaSangamMN-Bold", size: 28)!,
                                                                        NSAttributedString.Key.foregroundColor : Theme.BUTTON_TEXT_COLOR!])
        startButton.setAttributedTitle(mySelectedAttributedTitle, for: .normal)
        startButton.setBackgroundColor(color: Theme.BUTTON_BACKGROUND_COLOR!, forState: .normal)
        startButton.titleLabel!.textAlignment = .center

        startButton.layer.cornerRadius = Theme.CORNER_RADIUS
        startButton.addTarget(self, action: #selector(toInputVC), for: .touchUpInside)
    }
    
    @objc func toInputVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "InputViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

