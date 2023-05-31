//
//  View+Placeholder.swift
//  Mesh
//
//  Created by James Wolfe on 08/05/2023.
//

import SwiftUI

extension View {
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0).padding()
            self
        }
    }
    
    func placeholder(
            _ text: String,
            when shouldShow: Bool,
            alignment: Alignment = .leading) -> some View {
                placeholder(when: shouldShow, alignment: alignment) { Text(text).foregroundColor(.white.opacity(0.5)) }
        }
    
}
