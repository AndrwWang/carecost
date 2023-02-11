//
//  DigitalValueFormatter.swift
//  CareCost
//
//  Created by Frank Gao on 2/11/23.
//

import Foundation
import Charts

class DigitValueFormatter : NSObject, ValueFormatter {
    func stringForValue(_ value: Double,
                        entry: ChartDataEntry,
                        dataSetIndex: Int,
                        viewPortHandler: ViewPortHandler?) -> String {
        let valueWithoutDecimalPart = String(format: "$%.2f", value)
        return "\(valueWithoutDecimalPart)"
    }
}
