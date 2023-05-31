//
//  Message.swift
//  Mesh
//
//  Created by James Wolfe on 08/05/2023.
//

import SwiftUI

struct Message: Codable, Identifiable {
    
    // MARK: - Variables
    
    let id: UUID
    let text: String
    let isSender: Bool
    let date: Date
    let attachments: [MessageAttachment]
    
    var cell: AnyView {
        if attachments.contains(where: { $0.type == .image}) {
            return AnyView(GalleryView(message: self))
        } else if attachments.contains(where: { $0.type == .audio }) {
            return AnyView(AudioView(message: self))
        } else if(attachments.contains(where: { $0.type == .link })) {
            return AnyView(LinkView(message: self))
        } else {
            return AnyView(MessageView(message: self))
        }
    }
    
}

extension Message {
    
    static var textPreviewContent: Message {
        return .init(id: .init(), text: "LoremIpsum".localized, isSender: Bool.random(), date: .init(), attachments: [])
    }
    
    static var audioPreviewContent: Message {
        return .init(id: .init(), text: "LoremIpsum".localized, isSender: Bool.random(), date: .init(), attachments: [])
    }
    
    static var imagesPreviewContent: Message {
        return .init(
            id: .init(),
            text: "LoremIpsum".localized,
            isSender: Bool.random(),
            date: .init(),
            attachments: [.imageAttachment, .imageAttachment, .imageAttachment, .imageAttachment, .imageAttachment]
        )
    }
    
    static var linkPreviewContent: Message {
        return .init(id: .init(), text: "LoremIpsum".localized, isSender: Bool.random(), date: .init(), attachments: [])
    }
    
}
