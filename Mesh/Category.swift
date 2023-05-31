//
//  Category.swift
//  Mesh
//
//  Created by James Wolfe on 06/05/2023.
//

import Foundation

struct Category: Codable, Identifiable {
    
    // MARK: - Category
    let id: UUID
    let name: String
    
}

extension Category {
    
    static var previewContent: Category {
        return .init(id: .init(), name: "Media")
    }
    
}
