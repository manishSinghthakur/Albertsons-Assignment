//
//  MockAcronymsServices.swift
//  Albertsons AssignmentsTests
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import XCTest
@testable import AlbertsonsAssignment

class MockAcronymsServices: AcronymsServicesProtocol {
    
    var acronymsList: [HomeModel] {
        let acronyms = HomeModel(sf: "LNT", lfs: [LF(lf: "linear no-threshold", freq: 10006, since: 1982, vars: [LF(lf: "liquid-nitrogen temperature", freq: 6689, since: 1982, vars: nil)])])
        return [acronyms]
    }
    
    func getAcronymsMeanings(acronyms: String, _ completion: @escaping ([HomeModel]) -> Void){
        completion(acronyms == "LNT" ? acronymsList: [])
    }
}
