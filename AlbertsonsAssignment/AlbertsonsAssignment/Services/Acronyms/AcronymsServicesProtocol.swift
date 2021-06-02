//
//  AcronymsServicesProtocol.swift
//  Albertsons Assignments
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import Foundation

/**
 *  Protocol `AcronymsServicesProtocol` defines set of protocols for `AcronymsServices`
 */
protocol AcronymsServicesProtocol {
    
    /// get Acronyms Meanings
       ///
       /// - Parameters:
       ///   - acronyms: string` of 'Acronyms`
       ///   - completion: type of `[HomeModel]` for matching acronyms
    func getAcronymsMeanings(acronyms: String, _ completion: @escaping ([HomeModel]) -> Void)

}
