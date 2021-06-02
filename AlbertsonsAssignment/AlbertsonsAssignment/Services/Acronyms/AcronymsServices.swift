//
//  AcronymsServices.swift
//  Albertsons Assignments
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import Foundation
import UIKit

/**
 *  class `AcronymsServices` defines set of  fuction to communicate with the network APIs
 */
class AcronymsServices: AcronymsServicesProtocol {
    
    /// get Acronyms Meanings
    ///
    /// - Parameters:
    ///   - acronyms: string` of 'Acronyms`
    ///   - completion: type of `[HomeModel]` for matching acronyms
    func getAcronymsMeanings(acronyms: String, _ completion: @escaping ([HomeModel]) -> Void){
        let acronymsURL = "\(HomeConstant.AcronymsAPI.acronymsAPIURL)\(acronyms)"
        let request = NSMutableURLRequest(url: NSURL(string: acronymsURL)! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (data != nil) {
                let acronymsList = try! JSONDecoder().decode([HomeModel].self, from: data!)
                completion(acronymsList)
            } else {
                print("Unable to initialise acronyms data")
            }
        })
        dataTask.resume()
    }
}
