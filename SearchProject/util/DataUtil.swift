//
//  DataUtil.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 02/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import Foundation

class DataUtil {
    
    static var dataUtil: DataUtil!
    
    static func instance() -> DataUtil{
        if dataUtil == nil {
            dataUtil = DataUtil()
        }
        return dataUtil
    }
    
    func generateShopTypeData() -> Array<ShopTypeModel>{
        var list = Array<ShopTypeModel>()
        list.append(ShopTypeModel(id: 0, isChecked: false, label: "Gold Merchant"))
        list.append(ShopTypeModel(id: 1, isChecked: false, label: "Official Store"))
        return list
    }
}
