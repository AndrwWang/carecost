//
//  ViewController.swift
//  CareCost
//
//  Created by Frank Gao on 2/11/23.
//

import UIKit
import Charts

class GraphViewController: UIViewController {
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
    
    @IBOutlet weak var resultLabel: UILabel!
    private var chartView: LineChartView!
    
    private var sliderValue = 5
    @IBOutlet weak var yearSlider: UISlider!
    @IBOutlet weak var yearLabel: UILabel!
    
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
        
        setUpChart()
        setUpSlider()
    }
    
    override func viewWillLayoutSubviews() {
        
    }
    
    // MARK: Display
    
    private func setUpSlider() {
        yearSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yearSlider.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: Theme.SCREEN_WIDTH / 3),
            yearSlider.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -Theme.SCREEN_WIDTH / 3),
            yearSlider.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 10)
        ])
        
        yearSlider.minimumValue = 1
        yearSlider.maximumValue = 10
        yearSlider.value = Float(sliderValue)
        yearSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yearLabel.topAnchor.constraint(equalTo: yearSlider.bottomAnchor, constant: 10),
            yearLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
            //yearLabel.leftAnchor.constraint(equalTo: yearSlider.leftAnchor),
            //yearLabel.rightAnchor.constraint(equalTo: yearSlider.rightAnchor),
        ])
        
        yearLabel.font = UIFont(name: Theme.DEFAULT_FONT, size: 16)
        yearLabel.textAlignment = .center
        yearLabel.text = "Look ahead: " + String(sliderValue) + " years"
    }
    
    private func setChartData() {
        let dataset = LineChartDataSet(entries: getGraphData(), label: "Charge")
        let data = LineChartData(dataSet: dataset)
        chartView.data = data
        chartView.data?.setValueFormatter(DigitValueFormatter())
    }
    
    private func setUpChart() {
        chartView = LineChartView()
        self.view.addSubview(chartView)
        
        chartView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chartView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            chartView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            chartView.widthAnchor.constraint(equalToConstant: Theme.SCREEN_WIDTH * 5 / 6),
            chartView.heightAnchor.constraint(equalTo: chartView.widthAnchor)
        ])
        
        chartView.data?.setValueFont(UIFont(name: Theme.DEFAULT_FONT, size: 12)!)
        setChartData()
    }
    
    // MARK: Helper
    
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
    
    @objc func sliderValueChanged() {
        sliderValue = Int(yearSlider.value.rounded())
        
        setChartData()
        yearLabel.text = "Look ahead: " + String(sliderValue) + " years"
    }
}





