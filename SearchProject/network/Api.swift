//
//  Api.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 01/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import Foundation
import Moya

class Api {
    static let BASE_URL = "https://ace.tokopedia.com/"
    static let provider = MoyaProvider<ApiProvider>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    // Mark : Search
    static func requestSearch(params: Params, completion: @escaping ([ItemModel]) -> (), failure: @escaping (Error) -> ()) {
        provider.request(.search(q: params.q, pMin: params.pMin, pMax: params.pMax, wholesale: params.wholesale,
                                 official: params.official, fshop: params.fshop, start: params.start,
                                 rows: params.rows, vApi: params.vApi), completion: { result in
            switch result {
            case .success(let response):
                do {
                    let model = try ResponseUtil<ItemModel>().parse(response)
                    completion(model)
                }catch (let error) {
                    failure(error)
                }
            case .failure(let err):
                failure(err)
            }
        })
    }
}
