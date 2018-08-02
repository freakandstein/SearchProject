//
//  BaseResponse.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 01/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    var status: StatusModel
    var data: Array<T>
}

// Mark : Status Model
struct StatusModel: Codable {
    var errorCode: Int
    var message: String
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message
    }
}

