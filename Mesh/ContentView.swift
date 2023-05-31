//
//  ContentView.swift
//  Mesh
//
//  Created by James Wolfe on 08/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Variables
    @StateObject var viewModel = ContentViewModel.shared
    
    // MARK: - Views
    var body: some View {
        GeometryReader { proxy in
            if let user = viewModel.user {
                ChatView(forUser: user)
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)).combined(with: .opacity))
            } else {
                VStack(spacing: 20) {
                    TabView(selection: $viewModel.selection) {
                        ChatListView()
                            .tag(Tab.messages)
                        ChatListView()
                            .tag(Tab.requests)
                        ChatListView()
                            .tag(Tab.profile)
                    }
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 48))
                    .shadow(radius: 5)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    HStack(spacing: 40) {
                        ForEach(Tab.allCases) { tab in
                            Button(action: { viewModel.selection = tab }, label: {
                                tab.image
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .opacity(viewModel.selection == tab ? 1 : 0.6)
                            })
                        }
                    }
                }
                .padding(.bottom, proxy.safeAreaInsets.bottom + 20)
                .ignoresSafeArea()
                .background(Color.accentColor)
                .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .top)))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
