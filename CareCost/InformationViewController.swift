//
//  ViewController.swift
//  CareCost
//
//  Created by Frank Gao on 2/11/23.
//

import UIKit

class InformationViewController: UIViewController, UITextFieldDelegate {
    private let info = ["Start a Health Savings Account (HSA) or Medical Savings Account (MSA) and claim a tax deduction on savings. Check if your employer’s offer a Flexible Spending Account (FSA) or Health Reimbursement Arrangement (HRA’s) to get reimbursement for medical expenses.", "Always be sure to have adequate savings for sudden, unforeseen medical costs. If you do have enough savings, consider investing in high-deductible health insurance plans with lower monthly premiums. Low premiums will save lots of money in the long run", "Don't be afraid to be cheap! Shop around healthcare providers and compare prices between them. Use telemedicine services that offer virtual consultations which are far cheaper than in-person visits. When you can, choose in-network health care providers as they'll often give better rates. When getting a procedure or surgery, ask if you can get it done at an outpatient clinic as they're cheaper than hospitals. Switch to generic medicines that are cheaper but have the same ingredients and effects as namebrand drugs. Never be afraid to negotiate medical bills.", "One of the most effective and convenient ways to save money on medical costs is to take preventive measuree. Performing regular check ups and taking preventive care will stop more serious and expensive conditions from developing in the future. Other than that, there is no better solution than to simply maintain a healthy lifestyle."]
    
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var infoTextView: UITextView!
    
    private var sourceLabel: UILabel!
    @IBOutlet weak var sourceButton1: UIButton!
    @IBOutlet weak var sourceButton2: UIButton!

    private var startOverButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Theme.VIEW_BACKGROUND_COLOR
        navigationItem.leftBarButtonItem = CCBarButtonItem(selector: #selector(goBack), target: self)
        
        infoTextView.text = "Click the buttons above to learn more!"
    
        configureTitleLabel()
        configureSegementedControl()
        configureInfoTextView()
        configureSourceInfo()
        configureStartOver()
        
        animateLogo()
    }
    
    func animateLogo() {
        let originalFrame = self.logoView.frame
        self.logoView.alpha = 0
        UIView.animate(withDuration: 3, animations: {
            self.logoView.alpha = 1
        }, completion: { (finished) in
            if finished {
                UIView.animate(withDuration: 20, animations: {
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
    
    //MARK: Display
    
    private func configureTitleLabel() {
        titleLabel.text = "Saving Money for Medical Costs"
        titleLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 20)
        titleLabel.textAlignment = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: Theme.SCREEN_WIDTH / 8),
            titleLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -Theme.SCREEN_WIDTH / 8)
        ])
        
    }
    
    private func configureSegementedControl() {
        var titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: Theme.DEFAULT_FONT, size: 14)]
        segControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
        titleTextAttributes[.foregroundColor] = UIColor.black
        segControl.setTitleTextAttributes(titleTextAttributes, for: .selected)
        segControl.backgroundColor = Theme.BUTTON_BACKGROUND_COLOR
        segControl.selectedSegmentTintColor = Theme.BUTTON_TEXT_COLOR
        
        segControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            segControl.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func configureInfoTextView() {
        infoTextView.isUserInteractionEnabled = false
        infoTextView.isScrollEnabled = false
        infoTextView.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
        infoTextView.layer.cornerRadius = Theme.CORNER_RADIUS
        infoTextView.backgroundColor = Theme.BUTTON_BACKGROUND_COLOR
        infoTextView.textColor = .white
        infoTextView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        infoTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoTextView.topAnchor.constraint(equalTo: segControl.bottomAnchor, constant: 20),
            infoTextView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: Theme.SCREEN_WIDTH / 8),
            infoTextView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -Theme.SCREEN_WIDTH / 8)
        ])
        
        infoTextView.text = info[segControl.selectedSegmentIndex]
    }
    
    private func configureSourceInfo() {
        sourceLabel = UILabel()
        sourceLabel.text = "Sources & More Info"
        sourceLabel.textAlignment = .center
        sourceLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
        self.view.addSubview(sourceLabel)
        
        sourceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sourceLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            sourceLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -Theme.SCREEN_HEIGHT / 6.5),
            sourceLabel.heightAnchor.constraint(equalToConstant: Theme.BUTTON_FONT_SIZE)
        ])
        
        sourceButton1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sourceButton1.rightAnchor.constraint(equalTo: sourceLabel.centerXAnchor, constant: -5),
            sourceButton1.topAnchor.constraint(equalTo: sourceLabel.bottomAnchor, constant: 5),
            sourceButton1.heightAnchor.constraint(equalToConstant: 25),
            sourceButton1.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: Theme.SCREEN_WIDTH / 6)
        ])
        
        var attributedText = NSAttributedString(string: "healthcare.gov",
                                                           attributes: [NSAttributedString.Key.font : UIFont(name: Theme.DEFAULT_FONT, size: Theme.BUTTON_FONT_SIZE / 2)!,
                                                                        NSAttributedString.Key.foregroundColor : UIColor.white,
                                                                        NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue])
        sourceButton1.setAttributedTitle(attributedText, for: .normal)
        sourceButton1.setBackgroundColor(color: Theme.BUTTON_BACKGROUND_COLOR!, forState: .normal)
        sourceButton1.titleLabel!.textAlignment = .center
        sourceButton1.layer.cornerRadius = Theme.CORNER_RADIUS / 2
        sourceButton1.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        sourceButton2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sourceButton2.leftAnchor.constraint(equalTo: sourceButton1.rightAnchor, constant: 10),
            sourceButton2.bottomAnchor.constraint(equalTo: sourceButton1.bottomAnchor),
            sourceButton2.topAnchor.constraint(equalTo: sourceButton1.topAnchor),
            sourceButton2.widthAnchor.constraint(equalTo: sourceButton1.widthAnchor)
        ])
        
        attributedText = NSAttributedString(string: "medlineplus.gov",
                                                           attributes: [NSAttributedString.Key.font : UIFont(name: Theme.DEFAULT_FONT, size: Theme.BUTTON_FONT_SIZE / 2)!,
                                                                        NSAttributedString.Key.foregroundColor : UIColor.white,
                                                                        NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue])
        sourceButton2.setAttributedTitle(attributedText, for: .normal)
        sourceButton2.setBackgroundColor(color: Theme.BUTTON_BACKGROUND_COLOR!, forState: .normal)
        sourceButton2.titleLabel!.textAlignment = .center
        sourceButton2.layer.cornerRadius = Theme.CORNER_RADIUS / 2
        sourceButton2.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
       
    }
    
    private func configureStartOver() {
        startOverButton = UIButton()
        self.view.addSubview(startOverButton)
        
        startOverButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startOverButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: Theme.SCREEN_WIDTH / 4),
            startOverButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -Theme.SCREEN_WIDTH / 4),
            startOverButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            startOverButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let btnTitle = NSAttributedString(string: "Start Over",
                                                           attributes: [NSAttributedString.Key.font : UIFont(name: Theme.DEFAULT_FONT, size: Theme.BUTTON_FONT_SIZE)!,
                                                                        NSAttributedString.Key.foregroundColor : Theme.BUTTON_TEXT_COLOR])
        startOverButton.setAttributedTitle(btnTitle, for: .normal)
        startOverButton.setBackgroundColor(color: Theme.BUTTON_BACKGROUND_COLOR!, forState: .normal)
        startOverButton.titleLabel!.textAlignment = .center
        startOverButton.layer.cornerRadius = Theme.CORNER_RADIUS
        
        startOverButton.addTarget(self, action: #selector(startOverClicked), for: .touchUpInside)
    }
    
    //MARK: Actions
    
    @objc func goBack() {
        navigationController!.popViewController(animated: true)
    }
    
    @objc func startOverClicked() {
        navigationController!.popToRootViewController(animated: true)
    }
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        infoTextView.text = info[sender.selectedSegmentIndex]
    }

    @IBAction func moreInfoButton1(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.healthcare.gov")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func moreInfoButton2(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://medlineplus.gov/")! as URL, options: [:], completionHandler: nil)
    }
}
