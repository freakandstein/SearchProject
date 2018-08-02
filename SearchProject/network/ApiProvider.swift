//
//  ApiProvider.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 01/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import Foundation
import Moya

enum ApiProvider {
    
    // Mark: List of API
    case search(q: String, pMin: String, pMax: String, wholesale: Bool,
        official: Bool, fshop: String, start: String, rows: String, vApi: String)
}

extension ApiProvider: TargetType{
    
    var sampleData: Data {
        return Data()
    }
    
    var baseURL: URL {
        guard var url = URL(string: Api.BASE_URL) else { fatalError("Server Bermasalah") }
        switch self {
        case .search(let q, let pMin, let pMax, let wholesale, let official,
                     let fshop, let start, let rows, let vApi):
            url = URL(string: Api.BASE_URL
                + "/search/\(vApi)/product?q=\(q)&pmin=\(pMin)&pmax=\(pMax)&wholesale=\(wholesale)&official=\(official)&fshop=\(fshop)&start=\(start)&rows=\(rows)")!
            return url
        default:
            return url
        }
        
    }
    
    var path: String {
        switch self {
        case .search:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        return nil
//        switch self {
//        case .login(let username,let password):
//            var parameters = [String: Any]()
//            parameters["username"] = username
//            parameters["password"] = password
//            return parameters
//
//        case .getUserProfile(let userId, _),
//             .getInboxTab(let userId, _):
//            var parameters = [String: Any]()
//            parameters["user_id"] = userId
//            return parameters
//        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var task: Task {
        switch self {
        case .search:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
