//
//  Alert.swift
//  UIKitComponet
//
//  Created by Omkar Shisode on 21/12/24.
//

import UIKit

class AlertHandler {
    
    static let alert = AlertHandler()
    private let alertController = UIAlertController()
    private init(){}
    
    func alertWithOk(
        viewController: UIViewController,
        title: String,
        message: String,
        okHandler: (() -> Void)? = nil
    ) {
        alertController.title = title
        alertController.message = message
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            okHandler?()
        }
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true)
    }
}
