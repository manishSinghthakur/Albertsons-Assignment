//
//  HomeViewModel.swift
//  Albertsons Assignments
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import Foundation
import Bond

//MARK: - HomeViewModel class

/// User Home events can be performed here
final class HomeViewModel {
    
    typealias Model = [HomeModel]
    
    typealias Completion = (Model) -> Void
    
    /// `string` for the acronyms
    var acronyms = Observable<String?>("")
    
    /// Acronyms detail  model.
    var homeViewModel: [HomeModel]!
    
    /// Resolve dependency with `AcronymsServicesProtocol`.
    var acronymsServices: AcronymsServicesProtocol {
        return DependencyResolver.resolveAcronymsServices()
    }
    
    /// get AcronymsMeanings For SearchString
    ///
    /// - Parameter completion: `Completion` value for getting the acronyms meanings result
    func getAcronymsMeaningsForSearchString(completion: @escaping Completion){
        guard let acronymsString = acronyms.value else {
            return
        }
        acronymsServices.getAcronymsMeanings(acronyms: acronymsString) { [weak self] (response) in
            if (response.count != 0){
                self?.homeViewModel = response
                completion(response)
            }else{
                completion(response)
            }
        }
    }
}
