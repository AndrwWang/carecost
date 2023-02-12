//
//  ViewController.swift
//  CareCost
//
//  Created by Frank Gao on 2/11/23.
//

import UIKit

class InformationViewController: UIViewController, UITextFieldDelegate {
    private let info = ["Start a Health Savings Account (HSA) or Medical Savings Account (MSA) and claim a tax deduction on savings. Check if your employer’s offer a Flexible Spending Account (FSA) or Health Reimbursement Arrangement (HRA’s) to get reimbursement for medical expenses.", "Always be sure to have adequate savings for sudden, unforeseen medical costs. If you do have enough savings, consider investing in high-deductible health insurance plans with lower monthly premiums. Low premiums will save lots of money in the long run", "Don't be afraid to be cheap! Shop around healthcare providers and compare prices between them. Use telemedicine services that offer virtual consultations which are far cheaper than in-person visits. When you can, choose in-network health care providers as they'll often give better rates. When getting a procedure or surgery, ask if you can get it done at an outpatient clinic as they're cheaper than hospitals. Switch to generic medicines that are cheaper but have the same ingredients and effects as namebrand drugs. Never be afraid to negotiate medical bills.", "One of the most effective and convenient ways to save money on medical costs is to take preventive measuree. Performing regular check ups and taking preventive care will stop more serious and expensive conditions from developing in the future. Other than that, there is no better solution than to simply maintain a healthy lifestyle."]
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var infoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Theme.VIEW_BACKGROUND_COLOR
        infoTextView.text = "Click the buttons above to learn more!"
        //moreInfoLabel = Link(destination: URL(string: "))
        
        configureTitleLabel()
        //configureInfoTextView()
    }
    
    @IBAction func moreInfoButton1(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.healthcare.gov")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func moreInfoButton2(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://medlineplus.gov/")! as URL, options: [:], completionHandler: nil)
    }
    
    
    //MARK: Display
    
    private func configureTitleLabel() {
        titleLabel.text = "Saving Money for Medical Costs"
        titleLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 20)
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: Theme.SCREEN_WIDTH / 6),
            titleLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -Theme.SCREEN_WIDTH / 6)
        ])
        
    }
    /*private func configureInfoTextView() {
        infoTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
        ])
    }*/
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        infoTextView.text = info[sender.selectedSegmentIndex]
    }

}
