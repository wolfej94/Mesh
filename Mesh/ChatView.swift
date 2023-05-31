//
//  ChatView.swift
//  Mesh
//
//  Created by James Wolfe on 08/05/2023.
//

import SwiftUI
import PhotosUI

struct ChatView: View {
    
    // MARK: - Variables
    @FocusState var focused: Bool
    @State var showImagePicker: Bool = false
    @StateObject var viewModel: ChatViewModel
    
    // MARK: - Initializers
    init(forUser user: User) {
        _viewModel = .init(wrappedValue: .init(user: user))
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 20) {
                VStack(spacing: 0) {
                    header
                        .padding(.top, proxy.safeAreaInsets.top)
                        .padding(.bottom, 20)
                        .padding(.horizontal)
                        .background(Color.white.shadow(radius: 5))
                    chatLog
                    Spacer()
                }
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 48))
                HStack(spacing: 20) {
                    Spacer()
                    TextField("", text: $viewModel.messageText)
                        .foregroundColor(.white)
                        .frame(height: 40)
                        .padding(.horizontal)
                        .background(Color.black.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .focused($focused)
                        .placeholder("Aa", when: (!focused && viewModel.messageText.isEmpty))
                        .submitLabel(.send)
                        .onSubmit(viewModel.sendText)
                    Button(action: { }, label: {
                        Image.microphone
                            .foregroundColor(.white)
                            .font(.title)
                            .foregroundColor(.white)
                    })
                    PhotosPicker(
                        selection: $viewModel.selectedPhotos,
                        maxSelectionCount: 5,
                        label: {
                            Image.imageStack
                                .foregroundColor(.white)
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    )
                    Spacer()
                }
                .padding(.horizontal)
                .frame(height: 40)
            }
            .padding(.bottom, proxy.safeAreaInsets.bottom + 20)
            .ignoresSafeArea()
            .background(Color.accentColor)
            .onChange(of: viewModel.selectedPhotos) { _ in
                guard viewModel.selectedPhotos.count > 0 else { return }
                Task { await viewModel.sendImages() }
            }
        }
        .alert(
            "Unable to Send Images",
            isPresented: $viewModel.showNSFWAlert,
            actions: {
                Button(
                    "Dismiss",
                    role: .cancel,
                    action: {
                        viewModel.showNSFWAlert = false
                        
                    }
                )
            },
            message: { Text("NSFW content detected in images.") }
        )
    }
    
    var header: some View {
        HStack(spacing: 20) {
            Button(
                action: viewModel.hide,
                label: {
                    Image.back
                        .font(.system(size: 40))
                        .background(Color.white.clipShape(Circle()).shadow(radius: 5))
                        .frame(width: 40)
                }
            )
            Text("\(viewModel.user.forename) \(viewModel.user.surname)")
                .foregroundColor(.black)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    var chatLog: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(viewModel.messages) { message in
                    message.cell
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .padding([.top])
        }
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(forUser: .previewContent)
    }
}
