//
//  MockDependencyResolver.swift
//  Albertsons AssignmentsTests
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import Foundation
@testable import AlbertsonsAssignment

extension DependencyResolver {
    
    /// Dip configuration
    ///
    /// - Returns: registered class will be returned
    
   // Register Mock Github Service
      static func configureMockAcronymsServices(_ mockAcronymsServices: AcronymsServicesProtocol) {
          self.container.register(.singleton) { mockAcronymsServices as AcronymsServicesProtocol }
      }
}
