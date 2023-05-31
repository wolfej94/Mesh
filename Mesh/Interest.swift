//
//  Interest.swift
//  Mesh
//
//  Created by James Wolfe on 06/05/2023.
//

import Foundation

struct Interest: Codable, Identifiable {
    
    // MARK: Variables
    let id: UUID
    let categories: [Category]
    let name: String
    
}

extension Interest {
    
    static var previewContent: Interest {
        return .init(id: .init(), categories: [.previewContent], name: "Anime")
    }
}
