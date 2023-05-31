//
//  MessageAttachment.swift
//  Mesh
//
//  Created by James Wolfe on 08/05/2023.
//

import Foundation

struct MessageAttachment: Codable, Identifiable, Equatable {
    
    // MARK: - Variables
    let id: UUID
    let url: URL
    let type: MessageAttachmentType
}

extension MessageAttachment {
    
    static var imageAttachment: MessageAttachment {
        return .init(
            id: .init(),
            url: .init(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Donald_Trump_official_portrait.jpg/1200px-Donald_Trump_official_portrait.jpg")!,
            type: .image
        )
    }
}
