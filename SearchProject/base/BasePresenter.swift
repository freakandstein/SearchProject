//
//  BasePresenter.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 01/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import Foundation

protocol PresenterCommonDelegate {
    // Do if you needed
}

class BasePresenter<T>: PresenterCommonDelegate {
    var view: T!
    
    init(view: T!) {
        self.view = view!
    }
}
