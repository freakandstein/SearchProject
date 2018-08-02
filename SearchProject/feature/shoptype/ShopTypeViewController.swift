//
//  ShopTypeViewController.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 02/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import Foundation
import UIKit

class ShopTypeViewController: BaseViewController<ShopTypePresenter>, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvShopType: UITableView!
    var listShopType = DataUtil.instance().generateShopTypeData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reset()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listShopType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = listShopType[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopTypeViewCell", for: indexPath) as! ShopTypeViewCell
        setItemList(item: item, cell: cell, row: indexPath.row)
        return cell
    }
    
    @IBAction func onCloseClicked(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onResetClicked(_ sender: Any) {
        reset()
    }
    
    @IBAction func onApplyClick(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    private func setItemList(item: ShopTypeModel, cell: ShopTypeViewCell, row: Int){
        cell.lblShopType.text = item.label
        cell.row = row
        cell.click = { (cell, row) in
            item.isChecked = !item.isChecked
            if item.isChecked {
                if row == 0 {
                    Params.instance().fshop = "2"
                } else {
                    Params.instance().official = true
                }
                cell.btnCheckbox.setImage(UIImage(named: "CheckboxIcon"), for: .normal)
            } else {
                if row == 0 {
                    Params.instance().fshop = ""
                } else {
                    Params.instance().official = false
                }
                cell.btnCheckbox.setImage(UIImage(named: "UncheckboxIcon"), for: .normal)
            }
        }
    }
    private func reset() {
        var index: Int = 0
        var cell: ShopTypeViewCell? = nil
        listShopType.forEach { (item) in
            item.isChecked = false
            cell = tvShopType.cellForRow(at: IndexPath(row: index, section: 0)) as? ShopTypeViewCell
            cell?.btnCheckbox.setImage(UIImage(named: "UncheckboxIcon"), for: .normal)
            if index == 0 {
                Params.instance().fshop = ""
            } else if index == 1 {
                Params.instance().official = false
            }
            index = index + 1
        }
    }
}
