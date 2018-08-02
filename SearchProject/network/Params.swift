//
//  Params.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 01/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import Foundation

class Params: NSObject{
    var q = ""
    var pMin = ""
    var pMax = ""
    var wholesale = false
    var official = false
    var fshop = ""
    var start = ""
    var rows = ""
    var vApi = "v2.5"
    
    static var params: Params?
    
    static func instance() -> Params {
        if params == nil {
            params = Params()
        }
        return params!
    }
    
    func resetParams() {
        pMin = ""
        pMax = ""
        wholesale = false
        official = false
        fshop = ""
        start = ""
        rows = ""
    }
}
