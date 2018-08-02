//
//  FilterViewController.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 01/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import Foundation
import UIKit
import SwiftRangeSlider

class FilterViewController: BaseViewController<FilterPresenter>, UITextFieldDelegate{
    
    @IBOutlet weak var tfMinPrice: TJTextField!
    @IBOutlet weak var tfMaxPrice: TJTextField!
    @IBOutlet weak var sliderPrice: RangeSlider!
    @IBOutlet weak var switchWholeSale: UISwitch!
    @IBOutlet weak var containerShopType: UIStackView!
    var goldMerchant: CancelableButtonWidget?
    var official: CancelableButtonWidget?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValue()
        initDelegate()
        initTarget()
        initXIB()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkShopType()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case tfMinPrice:
            tfMinPrice.text = Int(sliderPrice.lowerValue).description
        case tfMaxPrice:
            tfMaxPrice.text = Int(sliderPrice.upperValue).description
        default:
            tfMaxPrice.text = "0"
            tfMinPrice.text = "0"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.rangeOfCharacter(from: CharacterSet.letters) != nil {
            return false
        } else {
            let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
            if updatedString != "" {
                let value = Double(updatedString!)!
                switch textField {
                case tfMinPrice:
                    sliderPrice.lowerValue = value
                case tfMaxPrice:
                    sliderPrice.upperValue = value
                default:
                    tfMaxPrice.text = "0"
                    tfMinPrice.text = "0"
                }
            }
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case tfMinPrice:
            if sliderPrice.lowerValue < ConstantUtil.MIN_VALUE_DEFAULT {
                sliderPrice.lowerValue = ConstantUtil.MIN_VALUE_DEFAULT
            }
            tfMinPrice.text = NumberFormatterUtil.instance().stringFromNumber(number: sliderPrice.lowerValue)
        case tfMaxPrice:
            if sliderPrice.upperValue > ConstantUtil.MAX_VALUE_DEFAULT {
                sliderPrice.upperValue = ConstantUtil.MAX_VALUE_DEFAULT
            }
            tfMaxPrice.text = NumberFormatterUtil.instance().stringFromNumber(number: sliderPrice.upperValue)
        default:
            tfMaxPrice.text = "0"
            tfMinPrice.text = "0"
        }
    }
    @IBAction func onResetClicked(_ sender: Any) {
        initValue()
        checkShopType()
    }
    
    @IBAction func onCloseClicked(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
        initValue()
        checkShopType()
    }
    
    @IBAction func sliderValueChanged(_ sender: RangeSlider) {
        tfMinPrice.text = NumberFormatterUtil.instance().stringFromNumber(number: sender.lowerValue)
        tfMaxPrice.text = NumberFormatterUtil.instance().stringFromNumber(number: sender.upperValue)
    }
    @IBAction func onApplyClicked(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
        Params.instance().pMin = Int(sliderPrice.lowerValue).description
        Params.instance().pMax = Int(sliderPrice.upperValue).description
    }
    
    @IBAction func onDismissKeyboardTap(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func onShopTypeTap(_ sender: Any) {
        let viewController = getViewController(storyboardName: "Main", identifier: "NavigationShopTypeStoryboard")
        navigationController?.present(viewController, animated: true, completion: nil)
    }
    
    private func initValue() {
        sliderPrice.lowerValue = ConstantUtil.LOWER_VALUE_DEFAULT
        sliderPrice.upperValue = ConstantUtil.UPPER_VALUE_DEFAULT
        tfMinPrice.text = NumberFormatterUtil.instance().stringFromNumber(number: sliderPrice.lowerValue)
        tfMaxPrice.text = NumberFormatterUtil.instance().stringFromNumber(number: sliderPrice.upperValue)
        switchWholeSale.setOn(false, animated: true)
        initParams()
    }
    
    private func initParams(){
        Params.instance().wholesale = false
        Params.instance().official = false
        Params.instance().pMin = ConstantUtil.MIN_VALUE_DEFAULT.description
        Params.instance().pMax = ConstantUtil.MAX_VALUE_DEFAULT.description
        Params.instance().fshop = ""
    }
    
    private func initDelegate() {
        tfMinPrice.delegate = self
        tfMaxPrice.delegate = self
    }
    
    private func initTarget() {
        switchWholeSale.addTarget(self, action: #selector(stateChanged), for: .valueChanged)
    }
    
    private func checkShopType() {
        containerShopType.removeArrangedSubview(goldMerchant!)
        containerShopType.removeArrangedSubview(official!)
        if Params.instance().fshop == "2" {
            goldMerchant?.label.text = "Gold Merchant"
            containerShopType.addArrangedSubview(goldMerchant!)
        } else if Params.instance().fshop == "" {
            containerShopType.removeArrangedSubview(goldMerchant!)
        }
        if Params.instance().official == true {
            official?.label.text = "Official"
            containerShopType.addArrangedSubview(official!)
        } else {
            containerShopType.removeArrangedSubview(official!)
        }
    }
    
    private func initXIB() {
        goldMerchant = Bundle.main.loadNibNamed("CancelableButtonWidget", owner: self, options: nil)?.first! as! CancelableButtonWidget
        official = Bundle.main.loadNibNamed("CancelableButtonWidget", owner: self, options: nil)?.first! as! CancelableButtonWidget
        goldMerchant?.click = {(view) in self.containerShopType.removeArrangedSubview(self.goldMerchant!)}
        official?.click = {(view) in self.containerShopType.removeArrangedSubview(self.official!)}
    }
    
    @objc func stateChanged(switchState: UISwitch) {
        if switchState.isOn {
            Params.instance().wholesale = true
        } else {
            Params.instance().wholesale = false
        }
    }
    
}
