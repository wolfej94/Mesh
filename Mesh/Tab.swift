//
//  Tab.swift
//  Mesh
//
//  Created by James Wolfe on 08/05/2023.
//

import SwiftUI

public enum Tab: Int, CaseIterable, Identifiable {

    // MARK: - Cases
    case messages = 0
    case requests
    case profile
    
    // MARK: - Variables
    var image: Image {
        switch self {
            case .messages:
                return .chatBubble
            case .profile:
                return .profileIcon
            case .requests:
                return .invites
        }
    }
    
    public var id: Int {
        return rawValue
    }
    
}
