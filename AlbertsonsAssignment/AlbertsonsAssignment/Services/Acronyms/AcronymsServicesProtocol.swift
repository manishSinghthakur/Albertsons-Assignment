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
    
    func getAcronymsMeanings(acronyms: String, _ completion: @escaping ([HomeModel]) -> Void)

}
