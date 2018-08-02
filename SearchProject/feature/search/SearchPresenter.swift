//
//  SearchPresenter.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 01/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import Foundation

class SearchPresenter: BasePresenter<SearchDelegate>{
    
    func search(params: Params){
        view.taskDidBegin()
        Api.requestSearch(params: params, completion: { (items) in
            self.view.didSuccessSearch(items: items)
            self.view.taskDidFinish()
        }) { (err) in
            self.view.taskDidFinish()
            self.view.taskDidError(message: err.localizedDescription)
        }
    }
}

protocol SearchDelegate: BaseDelegate {
    func didSuccessSearch(items: [ItemModel])
}
