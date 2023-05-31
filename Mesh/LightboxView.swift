//
//  LightboxView.swift
//  Mesh
//
//  Created by James Wolfe on 09/05/2023.
//

import SwiftUI
import Lightbox

struct LightboxView: UIViewControllerRepresentable {
    
    // MARK: - Variables
    let attachments: [MessageAttachment]
    let startIndex: Int
    
    
    // MARK: - Initializers
    init(attachments: [MessageAttachment], startIndex: Int) {
        self.attachments = attachments
        self.startIndex = startIndex
    }
    
    // MARK: - Representable
    func makeUIViewController(context: Context) -> Lightbox.LightboxController {
        let images: [LightboxImage] = attachments.map {
            if $0.url.isFileURL {
                return .init(image: .init(data: try! Data(contentsOf: $0.url))!)
            } else {
                return .init(imageURL: $0.url)
            }
        }
        return .init(images: images, startIndex: startIndex)
    }
    
    func updateUIViewController(_ uiViewController: Lightbox.LightboxController, context: Context) {
        return
    }
    
}
