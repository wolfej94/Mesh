//
//  AgeGroup.swift
//  Mesh
//
//  Created by James Wolfe on 06/05/2023.
//

import Foundation

struct AgeGroup: Codable, Identifiable {
    
    // MARK: - Variables
    let id: UUID
    let minimum: Int
    let maximum: Int
    
}

extension AgeGroup {
    
    static var previewContent: AgeGroup {
        return .init(id: .init(), minimum: 16, maximum: 18)
    }
    
}
