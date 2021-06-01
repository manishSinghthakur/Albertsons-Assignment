//
//  ButtonActionTests+Extension.swift
//  AlbertsonsAssignmentTests
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import Foundation
import XCTest

// MARK: - Extension to check IBAction
extension XCTestCase {
    func checkActionForButton(_ button: UIButton?, actionName: String, event: UIControl.Event = UIControl.Event.touchUpInside, target: UIViewController) -> Bool {
        if let unwrappedButton = button, let actions = unwrappedButton.actions(forTarget: target, forControlEvent: event) {
            var testAction = actionName
            if let trimmedActionName = actionName.components(separatedBy: ":").first {
                testAction = trimmedActionName
            }
            return (!actions.filter { $0.contains(testAction) }.isEmpty)
        }
        return false
    }
}
