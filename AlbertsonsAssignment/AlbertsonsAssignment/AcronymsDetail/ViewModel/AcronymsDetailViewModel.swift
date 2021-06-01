//
//  AcronymsDetailViewModel.swift
//  Albertsons Assignments
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import Foundation
import Bond

//MARK: - AcronymsDetailViewModel class

/// User Acronyms DetailView events can be performed here
final class AcronymsDetailViewModel {

    /// `String` for the acronymResults
    var searchedAcronym: String!
    
    /// `MutableObservableArray` for the acronymResults
    let acronymResults = MutableObservableArray<LF>([])



}
