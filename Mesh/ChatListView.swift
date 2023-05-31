//
//  ContentView.swift
//  Mesh
//
//  Created by James Wolfe on 06/05/2023.
//

import SwiftUI

struct ChatListView: View {
    
    // MARK: - Variables
    @State var showFilters = false
    @State var users: [User] = [.previewContent, .previewContent, .previewContent, .previewContent, .previewContent, .previewContent]
    
    // MARK: - Views
    var body: some View {
        GeometryReader { proxy in
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 20) {
                    HStack {
                        Text("Messages")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                        Spacer()
                    }
                    .padding(.bottom, 20)
                    if users.count > 0 {
                        ForEach(users) { user in
                            Button(
                                action: {
                                    withAnimation(.easeInOut) {
                                        ContentViewModel.shared.user = user
                                    }
                                },
                                label: { cell(forUser: user) }
                            )
                            .frame(height: 120)
                        }
                    } else {
                        HStack {
                            Spacer()
                            Text("You have no messages")
                                .foregroundColor(.black.opacity(0.5))
                                .font(.headline)
                            Spacer()
                        }
                    }
                }
                .padding(.top, proxy.safeAreaInsets.top - 20)
                .padding()
            }
            .overlay(
                filterButtonOverlay
            )
            .padding(.horizontal)
            .ignoresSafeArea()
        }
    }
    
    var filterButtonOverlay: some View {
        GeometryReader { proxy in
            VStack {
                HStack {
                    Spacer()
                    Button(
                        action: { showFilters.toggle() },
                        label: {
                            Image.sort
                                .font(.system(size: 40))
                                .background(Color.white.clipShape(Circle()).shadow(radius: 5))
                        }
                    )
                }
                Spacer()
            }
            .padding(.top, proxy.safeAreaInsets.top + 55)
        }
    }
    
    @ViewBuilder func cell(forUser user: User) -> some View {
        HStack(alignment: .center, spacing: 20) {
            AsyncImage(
                url: user.image,
                content: { image in
                    image
                    .resizable()
                    .scaledToFit()
                },
                placeholder: {
                    Color.gray
                        .scaledToFit()
                        .clipShape(Circle())
                }
            )
            .clipShape(Circle())
            .shadow(color: .accentColor, radius: 5)
            VStack(alignment: .leading, spacing: 5) {
                Text("\(user.forename) \(user.surname)")
                    .foregroundColor(.black)
                    .font(.headline)
                Text(user.latestMessagePreview)
                    .lineLimit(1)
                    .foregroundColor(.black)
                    .opacity(0.5)
            }
            Spacer()
            if user.unreadCount > 0 {
                Text("\(user.unreadCount)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red.opacity(0.8).clipShape(Circle()))
            }
        }
        .padding()
        .background(
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 5)
        )
    }
}
