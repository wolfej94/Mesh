//
//  ChatViewModel.swift
//  Mesh
//
//  Created by James Wolfe on 08/05/2023.
//

import SwiftUI
import PhotosUI
import NSFWDetector

class ChatViewModel: ObservableObject {
    
    // MARK: - Variables
    let user: User
    @Published var selectedPhotos: [PhotosPickerItem] = []
    @Published var messages: [Message]
    @Published var messageText: String = ""
    @Published var showNSFWAlert: Bool = false
    
    // MARK: - Actions
    
    func sendText() {
        withAnimation(.spring()) {
            messages.append(.init(id: .init(), text: messageText, isSender: true, date: .init(), attachments: []))
            messageText = ""
            UIApplication.shared.endEditing()
        }
    }
    
    @MainActor func sendImages() async {
        //Extract images
        var attachments: [MessageAttachment] = []
        var imagesToCheck: [UIImage] = []
        for photo in selectedPhotos {
            guard let data = try? await photo.loadTransferable(type: Data.self), let image = UIImage(data: data) else { continue }
            let id = UUID()
            let path = URL.cachesDirectory.appendingPathComponent("\(id).png").relativePath
            FileManager.default.createFile(atPath: path, contents: image.pngData())
            attachments.append(.init(id: id, url: URL(filePath: path), type: .image))
            imagesToCheck.append(image)
        }
        
        //Clear images
        selectedPhotos = []
        
        //Check for nsfw content
        if (try? await imagesToCheck.containsNSFWContent()) ?? true {
            showNSFWAlert = true
            return
        }
        
        //Send messages
        withAnimation(.spring()) {
            messages.append(.init(id: .init(), text: "", isSender: true, date: .init(), attachments: attachments))
        }
    }
    
    func hide() {
        withAnimation(.easeInOut) {
            ContentViewModel.shared.user = nil
        }
    }
    
    // MARK: - Initializers
    init(user: User) {
        self.user = user
        self.messages = Configuration.isPreview ? [.textPreviewContent] : []
    }
}
