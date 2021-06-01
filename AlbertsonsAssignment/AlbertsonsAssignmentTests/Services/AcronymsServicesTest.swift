//
//  AcronymsServicesTest.swift
//  Albertsons AssignmentsTests
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import XCTest
@testable import AlbertsonsAssignment

class AcronymsServicesTest: XCTestCase {
    
    var acronymsServices: AcronymsServicesProtocol {
        return DependencyResolver.resolveAcronymsServices()
    }
    
    override func setUpWithError() throws {
        DependencyResolver.container.reset()
        DependencyResolver.configureMockAcronymsServices(AcronymsServices())
    }
    
    func testSearchAcronymsMeaningIsSuccess() {
        // Arrange
        DependencyResolver.configureMockAcronymsServices(AcronymsServices())
        var homeModel: [HomeModel]!
        
        // Act
        let expectation = XCTestExpectation(description: "searchAcronymsMeaning")
        acronymsServices.getAcronymsMeanings(acronyms: "LNT") { (response) in
            if (response.count != 0){
                homeModel = response
            }else{
                homeModel = response
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
        
        //Assert
        XCTAssertNotNil(homeModel.first?.sf)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
