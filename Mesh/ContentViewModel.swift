//
//  ContentViewModel.swift
//  Mesh
//
//  Created by James Wolfe on 08/05/2023.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    
    // MARK: - Variables
    static let shared: ContentViewModel = .init()
    @Published var selection: Tab = .messages
    @Published var user: User?
}
