//
//  AlbertsonsAlertTest.swift
//  AlbertsonsAssignmentTests
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import XCTest
@testable import AlbertsonsAssignment

class AlbertsonsAlertTest: XCTestCase {
    var albertsonsAlert: AlbertsonsAlert!
    
    override func setUp() {
        albertsonsAlert = AlbertsonsAlert()
    }
    
    func testCustomAlertMultipleButton_Title_Message_Action() {
        // Arrange
        // Act
         AlbertsonsAlert.show(title: "Albertsons", message: "No matching meaning found for Acronyms", buttons: ["OK"], completion: nil)
        // Assert
        XCTAssertEqual(AlbertsonsAlert.alertController?.title, "Albertsons")
        XCTAssertEqual(AlbertsonsAlert.alertController?.message, "No matching meaning found for Acronyms")
    }
}
