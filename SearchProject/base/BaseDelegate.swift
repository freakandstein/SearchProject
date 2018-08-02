//
//  BaseDelegate.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 01/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import UIKit
import Foundation

protocol BaseDelegate {
    func taskDidBegin()
    func taskDidFinish()
    func taskDidError(message: String)
}

extension BaseDelegate {
    func taskDidBegin(){}
    func taskDidFinish(){}
    func taskDidError(message: String){}
}


