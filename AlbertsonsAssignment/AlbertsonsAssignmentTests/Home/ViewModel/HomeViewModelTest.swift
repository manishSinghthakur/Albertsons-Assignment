//
//  HomeViewModelTest.swift
//  AlbertsonsAssignmentTests
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import XCTest
@testable import AlbertsonsAssignment

class HomeViewModelTest: XCTestCase {
    
    var viewModel: HomeViewModel!
    
    override func setUpWithError() throws {
        DependencyResolver.container.reset()
        DependencyResolver.configureMockAcronymsServices(MockAcronymsServices())
        viewModel = HomeViewModel()
    }
    
    func testSearchAcronymsMeaningIsSuccess() {
        // Arrange
        DependencyResolver.configureMockAcronymsServices(MockAcronymsServices())
        var homeModel: [HomeModel]!
        viewModel.acronyms.value = "LNT"
        // Act
        let expectation = XCTestExpectation(description: "searchAcronymsMeaning")
        viewModel.getAcronymsMeaningsForSearchString { (response) in
            homeModel = response
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.5)
        
        //Assert
        XCTAssertNotNil(homeModel.first?.sf)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
}
