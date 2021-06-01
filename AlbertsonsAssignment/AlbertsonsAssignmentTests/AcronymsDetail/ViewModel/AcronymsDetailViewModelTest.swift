//
//  AcronymsDetailViewModelTest.swift
//  AlbertsonsAssignmentTests
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import XCTest
@testable import AlbertsonsAssignment

class AcronymsDetailViewModelTest: XCTestCase {

    var viewModel: AcronymsDetailViewModel!

    override func setUpWithError() throws {
        DependencyResolver.container.reset()
        DependencyResolver.configureMockAcronymsServices(MockAcronymsServices())
        viewModel = AcronymsDetailViewModel()
    }
    
    func testAcronymResultsInsertionIsSuccess() {
        // Arrange
        let mockAcronymsServices = MockAcronymsServices()
        viewModel.searchedAcronym = "TCS"
        viewModel.acronymResults.insert(contentsOf: mockAcronymsServices.acronymsList.first!.lfs, at: 0)
        // Act
        // Assert
        XCTAssertEqual(viewModel.acronymResults.count, 1)
        XCTAssertEqual(viewModel.searchedAcronym, "TCS")

    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }

}
