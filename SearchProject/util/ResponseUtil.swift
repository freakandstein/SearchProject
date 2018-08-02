//
//  ResponseUtil.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 01/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import Foundation
import Moya

class ResponseUtil<T: Codable> {
    // Mark: Purpose if response return multiple data in Array
    func parse(_ response: Response) throws -> [T] {
        guard let object = try? JSONDecoder().decode(BaseResponse<T>.self, from: response.data) else {
            throw ApiError.internalServerError
        }
        return object.data
    }
    // Mark: Purpose if response return a data but stil as Array
    func parseFirst(_ response: Response) throws -> T {
        let data = try parse(response)
        guard let first = data.first else {
            throw ApiError.internalServerError
        }
        return first
    }
    
}



