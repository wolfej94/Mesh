//
//  DateFormatter+Extension.swift
//  Mesh
//
//  Created by James Wolfe on 09/05/2023.
//

import Foundation

extension DateFormatter {
    
    convenience init(_ format: String) {
        self.init()
        self.dateFormat = format
        self.locale = .current
    }
}
