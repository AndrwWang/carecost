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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureWelcome()
        configureStart()
    }

    private func configureWelcome() {
        
    }

    private func configureStart() {
        startButton.addTarget(self, action: #selector(toInputVC), for: .touchUpInside)
    }
    
    @objc func toInputVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "InputViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

