//
//  ItemModel.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 01/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import Foundation

struct ItemModel: Codable{
    var id: Int
    var name: String
    var uri: String
    var imageUri: String
    var price: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case uri
        case imageUri = "image_uri"
        case price
    }
}
