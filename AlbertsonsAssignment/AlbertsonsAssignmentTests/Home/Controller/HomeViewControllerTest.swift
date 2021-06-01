//
//  HomeViewControllerTest.swift
//  AlbertsonsAssignmentTests
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import XCTest
@testable import AlbertsonsAssignment

class HomeViewControllerTest: XCTestCase {
    
    var viewController: HomeViewController!
    
    override func setUpWithError() throws {
        DependencyResolver.container.reset()
        DependencyResolver.configureMockAcronymsServices(MockAcronymsServices())
        let storyboard = UIStoryboard(name:"Main", bundle: .main)
        viewController = (storyboard.instantiateViewController(withIdentifier: "HomeView") as! HomeViewController)
        viewController.loadView()
        viewController.viewDidLoad()
        _ = viewController.view
    }
    
    func testUIInitialization() {
        // Arrange
        // Act
        // Assert
        XCTAssertNotNil(viewController.acronymsTextField)
        XCTAssertNotNil(viewController.searchButton)
    }
    
    func testSearchButtonActionIsSuccess() {
        // Arrange
        DependencyResolver.configureMockAcronymsServices(MockAcronymsServices())
        viewController.viewModel.acronyms.value = "LNT"
        // Act
        viewController.searchButton.sendActions(for: .touchUpInside)
        // Assert
        XCTAssertTrue(checkActionForButton(viewController.searchButton, actionName: "onSearchButtonAction", target: viewController!))
    }
    
    func testSearchButtonActionIsFailed() {
        // Arrange
        DependencyResolver.configureMockAcronymsServices(MockAcronymsServices())
        viewController.viewModel.acronyms.value = "TT"
        // Act
        viewController.searchButton.sendActions(for: .touchUpInside)
        // Assert
        XCTAssertTrue(checkActionForButton(viewController.searchButton, actionName: "onSearchButtonAction", target: viewController!))
    }
    
    override func tearDownWithError() throws {
        viewController = nil
    }
}
