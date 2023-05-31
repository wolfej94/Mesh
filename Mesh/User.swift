//
//  User.swift
//  Mesh
//
//  Created by James Wolfe on 06/05/2023.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    
    // MARK: - Variables
    let id: UUID
    let forename: String
    let surname: String
    let gender: Gender
    let image: URL
    let interests: [Interest]
    let ageGroup: AgeGroup
    let latestMessagePreview: String
    let unreadCount: Int
    
    // MARK: - Equatable
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
    // MARK: - Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(self)
    }
    
}

extension User {
    
    static var previewContent: User {
        .init(
            id: .init(),
            forename: "Tim",
            surname: "Drake",
            gender: .male,
            image: .init(string: "https://xsgames.co/randomusers/avatar.php?g=male")!,
            interests: [.previewContent],
            ageGroup: .previewContent,
            latestMessagePreview: "Test Message Preview Content",
            unreadCount: 5
        )
    }
    
}
