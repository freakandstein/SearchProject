//
//  BaseViewController.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 01/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController<T:PresenterCommonDelegate>: UIViewController {
    
    var presenter: T!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func showAlert(title: String?, message: String?, actions: [UIAlertAction], _ completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { action in
            alert.addAction(action)
        }
        present(alert, animated: true, completion: completion)
    }
    
    func showError(title: String?, message: String, positiveText: String = "OK", handler: ((UIAlertAction) -> Void)? = nil) {
        let actionPositive = UIAlertAction(title: positiveText, style: .default, handler: handler)
        showAlert(title: title, message: message, actions: [actionPositive])
    }
    
    func showConfirm(title: String?, message: String, buttons: [String], handlers: [((UIAlertAction) -> Void)?]) {
        let actionNegative = UIAlertAction(title: buttons[0], style: .cancel, handler: handlers[0])
        let actionPositive = UIAlertAction(title: buttons[1], style: .default, handler: handlers[1])
        showAlert(title: title, message: message, actions: [actionPositive, actionNegative])
    }
    
    func getViewController(storyboardName: String, identifier: String) -> UIViewController{
        let viewController = UIStoryboard.init(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier)
        return viewController
    }

}
