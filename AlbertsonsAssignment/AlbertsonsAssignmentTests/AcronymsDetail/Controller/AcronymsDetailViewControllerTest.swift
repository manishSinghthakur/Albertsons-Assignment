//
//  AcronymsDetailViewControllerTest.swift
//  AlbertsonsAssignmentTests
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import XCTest
import Bond
@testable import AlbertsonsAssignment

class AcronymsDetailViewControllerTest: XCTestCase {
    
    var viewController: AcronymsDetailViewController!
    
    override func setUpWithError() throws {
        DependencyResolver.container.reset()
        DependencyResolver.configureMockAcronymsServices(MockAcronymsServices())
        let storyboard = UIStoryboard(name:"Main", bundle: .main)
        viewController = (storyboard.instantiateViewController(withIdentifier: "DetailView") as! AcronymsDetailViewController)
        viewController.viewModel = AcronymsDetailViewModel()
        viewController.loadView()
        viewController.viewDidLoad()
        _ = viewController.view
    }
    
    func testUIInitialization() {
        // Arrange
        // Act
        // Assert
        XCTAssertNotNil(viewController.acronymsDetailTableView)
    }
    
    func testTableViewbinding() {
        // Arrange
        let mockAcronymsServices = MockAcronymsServices()
        viewController.viewModel.acronymResults.insert(contentsOf: mockAcronymsServices.acronymsList.first!.lfs, at: 0)
        // Act
        viewController.viewDidLoad()
        // Assert
        XCTAssertEqual(viewController.viewModel.acronymResults.count, 1)
    }
    
    func testHasATableView() {
        // Assert
        XCTAssertNotNil(viewController.acronymsDetailTableView)
    }
    
    func testTableViewHasDelegate() {
        // Assert
        XCTAssertNotNil(viewController.acronymsDetailTableView.delegate)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        // Assert
        XCTAssertTrue(viewController.conforms(to: UITableViewDelegate.self))
    }
    
    func testTableViewHasDataSource() {
        // Assert
        XCTAssertNotNil(viewController.acronymsDetailTableView.dataSource)
    }
    
    func testTableViewConformsToTableViewDelegateProtocol() {
        // Arrange
        let headerView = UITableViewHeaderFooterView(reuseIdentifier: "mockheaderView")
        headerView.frame = CGRect(x: 0, y: 0, width: viewController.acronymsDetailTableView.frame.size.width,height: 20)
        // Act
        XCTAssertTrue(viewController.responds(to: #selector(viewController.tableView(_:willDisplayHeaderView:forSection:))))
        
        _ = viewController.acronymsDetailTableView.delegate?.tableView!(viewController.acronymsDetailTableView, heightForHeaderInSection: 0)
        
        viewController.acronymsDetailTableView.delegate?.tableView?(viewController.acronymsDetailTableView, willDisplayHeaderView: headerView, forSection: 0)
        
        //let sectionHeaderView = viewController.acronymsDetailTableView.headerView(forSection: 0)
        // Assert
        // XCTAssertNotNil(sectionHeaderView)
    }
    
    override func tearDownWithError() throws {
        viewController = nil
    }
}
