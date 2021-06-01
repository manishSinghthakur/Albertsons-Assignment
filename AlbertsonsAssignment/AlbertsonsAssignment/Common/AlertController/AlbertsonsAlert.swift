//
//  AlbertsonsAlert.swift
//  AlbertsonsAssignment
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import Foundation
import UIKit

// MARK: - AlbertsonsAlert struct

/**
 * A struct `AlbertsonsAlert` helps to get the universal method to shows the alert
 */
struct AlbertsonsAlert {
    
    // MARK: - Static properties
    
    /// Instance of `UIAlertController`.
    static var alertController: UIAlertController? = nil
    
    // MARK: - Static functions
    
    /// A common alert for entire application screens
    ///
    /// - Parameters:
    ///   - title: Title of the alert
    ///   - message: Message to be displayed
    ///   - buttons: Button title
    ///   - completion: completion block of user actions.
    static func show(title: String?,
                     message: String?,
                     buttons: [String],
                     completion: ((UIAlertAction)->Void)?) {
        dismiss()
        alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        buttons.forEach { (buttonTitle) in
            let alertAction = UIAlertAction(title: buttonTitle, style: .default, handler: completion)
            alertController?.addAction(alertAction)
        }
        alertController?.show()
    }
    
    /// Common Alert dismiss
    static func dismiss() {
        if alertController != nil {
            alertController?.dismiss(animated: false, completion: nil)
        }
    }
}

// MARK: - UIAlertController

/**
 * extension `UIAlertController` shows the alert on the screen. It creates one more `UIWindow` on top of that `UIAlertController` presents.
 */
extension UIAlertController {
    
    /// Addition window for showing all kind of pop-up
    func show() {
        let win = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        vc.view.backgroundColor = .clear
        win.rootViewController = vc
        win.makeKeyAndVisible()
        vc.present(self, animated: true, completion: nil)
    }
}

