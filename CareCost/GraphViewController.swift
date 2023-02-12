//
//  ViewController.swift
//  CareCost
//
//  Created by Frank Gao on 2/11/23.
//

import UIKit
import Charts

class GraphViewController: UIViewController {
    private var name: String = ""
    private let regression = [
        "age" : 256.8563525373484,
        "male" : -65.65717969755242,
        "female" : 65.65717969755039,
        "bmi" : 339.1934536108383,
        "children" : 475.50054514912824,
        "yes" : 11924.267270956405,
        "no" : -11924.267270956385,
        "northeast" : 587.0092350283247,
        "northwest" : 234.04533560368202,
        "southeast" : -448.01281435950136,
        "southwest" : -373.04175627250527
    ]
    
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    private var chartContainer: UIView!
    private var chartView: LineChartView!
    
    private var sliderValue = 5
    @IBOutlet weak var yearSlider: UISlider!
    @IBOutlet weak var yearLabel: UILabel!
    
    private var researchButton: UIButton!
    
    //default values for now
    private var age: Int = 18
    private var sex: String = "male"
    private var numOfChildren: Int = 1
    private var bmi: Double = 23.2
    private var smoker: String = "yes"
    private var region: String = "southeast"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Theme.VIEW_BACKGROUND_COLOR
        
        configureResultLabel()
        configureChart()
        configureSlider()
        configureResearchButton()
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
    
    // MARK: Display
    
    private func configureResultLabel() {
        if !name.isEmpty {
            resultLabel.text = name + ", t" + Array(resultLabel.text!)[1...]
        }
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: Theme.SCREEN_WIDTH / 5),
            resultLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -Theme.SCREEN_WIDTH / 5),
            resultLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ])
        
        resultLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 32)
        resultLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func configureSlider() {
        yearSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yearSlider.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: Theme.SCREEN_WIDTH / 3),
            yearSlider.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -Theme.SCREEN_WIDTH / 3),
            yearSlider.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 10)
        ])
        
        yearSlider.thumbTintColor = Theme.BUTTON_BACKGROUND_COLOR
        yearSlider.minimumTrackTintColor = Theme.BUTTON_BACKGROUND_COLOR
        yearSlider.maximumTrackTintColor = Theme.BUTTON_TEXT_COLOR
        yearSlider.minimumValue = 1
        yearSlider.maximumValue = 10
        yearSlider.value = Float(sliderValue)
        yearSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yearLabel.topAnchor.constraint(equalTo: yearSlider.bottomAnchor, constant: 10),
            yearLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        yearLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
        yearLabel.textAlignment = .center
        yearLabel.text = "Look ahead: " + String(sliderValue) + " years"
    }
    
    private func setChartData() {
        let dataset = LineChartDataSet(entries: getGraphData(), label: "")
        dataset.colors = [Theme.BUTTON_TEXT_COLOR!]
        dataset.circleColors = [Theme.BUTTON_TEXT_COLOR!]
        
        let data = LineChartData(dataSet: dataset)
        data.setValueFont(UIFont(name: Theme.DEFAULT_FONT, size: 12)!)
        data.setValueTextColor(Theme.BUTTON_TEXT_COLOR!)
        
        chartView.data = data
        chartView.data?.setValueFormatter(DigitValueFormatter())
    }
    
    private func configureChart() {
        chartView = LineChartView()
        self.view.addSubview(chartView)
        
        chartView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chartView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            chartView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 10),
            chartView.widthAnchor.constraint(equalToConstant: Theme.SCREEN_WIDTH * 5 / 6),
            chartView.heightAnchor.constraint(equalTo: chartView.widthAnchor)
        ])
        
        chartView.backgroundColor = Theme.BUTTON_BACKGROUND_COLOR
        chartView.layer.cornerRadius = Theme.CORNER_RADIUS
        chartView.layer.masksToBounds = true
        chartView.minOffset = 50
        let graphFont = UIFont(name: Theme.DEFAULT_FONT, size: 12)!
        
        
        chartView.setScaleEnabled(false)
        chartView.legend.enabled = false

        let valFormatter = NumberFormatter()
        valFormatter.numberStyle = .currency
        valFormatter.maximumFractionDigits = 0
        valFormatter.currencySymbol = "$"

        chartView.xAxis.labelFont = graphFont
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelTextColor = Theme.BUTTON_TEXT_COLOR!
        chartView.leftAxis.drawLabelsEnabled = false
        chartView.rightAxis.drawLabelsEnabled = false
        
        setChartData()
        
        //add x-axis age label
        var ageLabel = UILabel()
        ageLabel.text = "Age"
        ageLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 12)
        ageLabel.textColor = Theme.BUTTON_TEXT_COLOR
        self.view.addSubview(ageLabel)
        
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: -25),
            ageLabel.centerXAnchor.constraint(equalTo: chartView.centerXAnchor)
        ])
    }
    
    private func configureResearchButton() {
        researchButton = UIButton()
        self.view.addSubview(researchButton)
        
        researchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            researchButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: Theme.SCREEN_WIDTH / 6),
            researchButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -Theme.SCREEN_WIDTH / 6),
            researchButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -Theme.SCREEN_HEIGHT / 7),
            researchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let researchTitle = NSAttributedString(string: "How can I save up?",
                                                           attributes: [NSAttributedString.Key.font : UIFont(name: Theme.DEFAULT_FONT, size: Theme.BUTTON_FONT_SIZE)!,
                                                                        NSAttributedString.Key.foregroundColor : Theme.BUTTON_TEXT_COLOR!])
        researchButton.setAttributedTitle(researchTitle, for: .normal)
        researchButton.setBackgroundColor(color: Theme.BUTTON_BACKGROUND_COLOR!, forState: .normal)
        researchButton.titleLabel!.textAlignment = .center
        researchButton.layer.cornerRadius = Theme.CORNER_RADIUS
        researchButton.addTarget(self, action: #selector(researchClicked), for: .touchUpInside)
    }
    
    // MARK: Helper
    
    func setName(_ name: String) {
        self.name = name
    }
    
    private func calcCharge(_ currAge: Int) -> Double {
        let ageCalc = Double(currAge) * regression["age"]!
        let childrenCalc = Double(numOfChildren) * regression["children"]!
        let bmiCalc = bmi * regression["bmi"]!
        let categorical = regression[sex]! + regression[smoker]! + regression[region]!
        
        return ageCalc + childrenCalc + bmiCalc + categorical
    }
    
    private func getGraphData() -> [ChartDataEntry] {
        var data: [ChartDataEntry] = []
        
        for i in age...(age + sliderValue) {
            data.append(ChartDataEntry(x: Double(i), y: calcCharge(i)))
        }
        
        return data
    }
    
    public func setMetrics(age: Int, sex: String, numOfChildren: Int, bmi: Double, smoker: String, region: String) { // called from InputViewController
        self.age = age
        self.sex = sex
        self.numOfChildren = numOfChildren
        self.bmi = bmi
        self.smoker = smoker
        self.region = region
    }
    
    // MARK: Actions
    
    @objc func researchClicked() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "InformationViewController")

        navigationController!.pushViewController(vc, animated: true)
    }
    
    @objc func sliderValueChanged() {
        sliderValue = Int(yearSlider.value.rounded())
        
        setChartData()
        yearLabel.text = "Look ahead: " + String(sliderValue) + " years"
    }
}





