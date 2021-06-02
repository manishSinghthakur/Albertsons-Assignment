//
//  DependencyResolver.swift
//  Albertsons Assignments
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import Dip

// MARK: - DependencyResolver struct

/**
 *  Struct for describing Dip configuration for all protocols.
 *  - container -  DependencyResolver instance
 *  - `configure()` configure using DIP container.
 */

/// Dependency Resolver provides Dip container references to the available services in Albertsons application.
struct DependencyResolver {
    
    static let container: DependencyContainer = DependencyContainer()
    
    /// Dip configuration
    static func configure()  {
        
        /// Register all validators
        self.container.register(.shared) { AcronymsServices() as AcronymsServicesProtocol }
    }
}


// MARK: - AcronymsServices
extension DependencyResolver {
    
    /// `AcronymsServices` interacts with Acronyms API.
    ///
    /// - Returns: 'AcronymsServicesProtocol'.
    static func resolveAcronymsServices() -> AcronymsServicesProtocol {
        return try! container.resolve() as AcronymsServicesProtocol
    }
}

