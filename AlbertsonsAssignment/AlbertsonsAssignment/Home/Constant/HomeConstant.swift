//
//  HomeConstant.swift
//  Albertsons Assignments
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import Foundation

/// Application constants available here in the form of different enum.
/// This enum is only used for constant purpose, we can create constant by using struct also. But struct will have a chance to initiate, so it behaves as value type.
enum  HomeConstant  {
    
    //MARK: - HomeConstant enum
    
    /// Segue naming identifiers
    enum SegueID {
        // Segue names
        static let segueAcronymsDetail = "AcronymsDetail"
    }
    
    /// Acronyms API  Detail
    enum AcronymsAPI {
        // Acronyms API
        static let acronymsAPIURL = "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf="
    }
}
