//
//  NumberFormatterUtil.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 01/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import Foundation

class NumberFormatterUtil{
    
    static var numberFormatterUtil: NumberFormatterUtil?
    var formatter: NumberFormatter!
    
    init() {
        initFormatter()
    }
    
    static func instance() -> NumberFormatterUtil{
        if numberFormatterUtil == nil {
            numberFormatterUtil = NumberFormatterUtil()
        }
        
        return numberFormatterUtil!
    }
    
    func stringFromNumber(number: Double) -> String {
        let price = formatter.string(from: NSNumber(value: number))!
        return price
    }
    
    private func initFormatter(){
        formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.maximumFractionDigits = 0
    }
    
}
