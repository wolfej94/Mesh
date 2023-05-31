//
//  GalleryView.swift
//  Mesh
//
//  Created by James Wolfe on 09/05/2023.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - Variables
    let message: Message
    @State var enlarged: MessageAttachment?
    
    // MARK: - Views
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Spacer()
                    ForEach(message.attachments) { attachment in
                        Button(
                            action: {
                                enlarged = attachment
                            }, label: {
                                AsyncImage(
                                    url: attachment.url,
                                    content: { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    },
                                    placeholder: {
                                        Color.gray
                                            .scaledToFill()
                                    }
                                )
                                .frame(width: 100, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .rotationEffect(.init(degrees: message.isSender ? 180 : 0))
                            }
                        )
                    }
                }
                .padding(.horizontal)
            }
            .rotationEffect(.init(degrees: message.isSender ? 180 : 0))
            HStack {
                if message.isSender {
                    Spacer()
                }
                if Calendar.current.isDateInToday(message.date) {
                    Text(DateFormatter("'\(message.isSender ? "Sent" : "Received") Today' hh:mm").string(from: message.date))
                        .font(.caption)
                        .foregroundColor(Color.black.opacity(0.5))
                } else {
                    Text(DateFormatter("'\(message.isSender ? "Sent" : "Received")' dd/MM/yyyy hh:mm").string(from: message.date))
                        .font(.caption)
                        .foregroundColor(Color.black.opacity(0.5))
                }
                if !message.isSender {
                    Spacer()
                }
            }
            .padding(.horizontal)
        }
        .fullScreenCover(item: $enlarged, content: { item in
            LightboxView(attachments: message.attachments, startIndex: message.attachments.firstIndex(of: item) ?? .zero)
                .ignoresSafeArea()
        })
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView(message: .imagesPreviewContent)
        GalleryView(message: .imagesPreviewContent)
    }
}
