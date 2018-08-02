//
//  ShopTypeViewCell.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 02/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import Foundation
import UIKit

class ShopTypeViewCell: UITableViewCell{
   
    @IBOutlet weak var lblShopType: UILabel!
    @IBOutlet weak var btnCheckbox: UIButton!
    typealias Action = (ShopTypeViewCell, Int) -> Void
    var click: Action?
    var row: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initTapGesture()
        row = 0
    }
    
    private func initTapGesture(){
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapItem)))
    }
    
    @objc func onTapItem(gesture: UITapGestureRecognizer){
        click?(self, row!)
    }
}
