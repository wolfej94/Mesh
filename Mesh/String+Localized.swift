//
//  String+Localized.swift
//  Mesh
//
//  Created by James Wolfe on 08/05/2023.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}
