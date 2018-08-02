//
//  ApiError.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 01/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case internalServerError
}

extension ApiError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .internalServerError:
            return "Internal Server Error"
        }
    }
}
