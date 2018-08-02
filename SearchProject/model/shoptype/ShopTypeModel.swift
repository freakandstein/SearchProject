//
//  ShopTypeModel.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 02/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import Foundation

class ShopTypeModel{
    var id = 0
    var isChecked = false
    var label = ""
    
    init(id: Int, isChecked: Bool, label: String) {
        self.id = id
        self.isChecked = isChecked
        self.label = label
    }
}
