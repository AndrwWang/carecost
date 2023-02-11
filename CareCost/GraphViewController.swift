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
    
    private var chartView: LineChartView!
    
    private var age: Int = -1
    private var sex: String = ""
    private var numOfChildren: Int = -1
    private var bmi: Double = -1
    private var smoker: String = ""
    private var region: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Theme.VIEW_BACKGROUND_COLOR
        
        setUpChart()
    }
    
    // MARK: Display
    
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
        
        //set the data
        let dataset = LineChartDataSet(entries: getGraphData(), label: "Charge")
        let data = LineChartData(dataSet: dataset)
        chartView.data = data
        chartView.data?.setValueFormatter(DigitValueFormatter())
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
        
        for i in age...(age + 10) {
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
    
    
}





