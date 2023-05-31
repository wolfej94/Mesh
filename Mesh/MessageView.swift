//
//  MessageView.swift
//  Mesh
//
//  Created by James Wolfe on 08/05/2023.
//

import SwiftUI

struct MessageView: View {
    
    // MARK: - Variables
    let message: Message
    
    // MARK: - Views
    var body: some View {
        VStack {
            HStack {
                if message.isSender {
                    Spacer()
                    Text(message.text)
                        .font(.body)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(SentShape(cornerRadius: 10))
                } else {
                    Text(message.text)
                        .font(.body)
                        .foregroundColor(Color.accentColor)
                        .padding()
                        .background(Color.white)
                        .clipShape(ReceivedShape(cornerRadius: 10))
                        .overlay(ReceivedShape(cornerRadius: 10).stroke(Color.accentColor, lineWidth: 2))
                    Spacer()
                }
            }
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
        }
        .padding(.horizontal)
    }
    
    var clipShape: any Shape {
        if message.isSender {
            return SentShape(cornerRadius: 10)
        } else {
            return ReceivedShape(cornerRadius: 10)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: .textPreviewContent)
        MessageView(message: .textPreviewContent)
    }
}
