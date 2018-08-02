//
//  CancelableButtonWidget.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 02/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import Foundation
import UIKit

class CancelableButtonWidget: UIView{
    
    typealias Action = (CancelableButtonWidget) -> Void
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var ivCancel: UIImageView!
    var click: Action?
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 24
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapView)))
    }
    
    @objc func onTapView (gesture: UITapGestureRecognizer){
        click?(self)
    }
}
