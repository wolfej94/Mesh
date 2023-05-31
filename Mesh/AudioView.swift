//
//  AudioView.swift
//  Mesh
//
//  Created by James Wolfe on 09/05/2023.
//

import SwiftUI

struct AudioView: View {
    let message: Message
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AudioView_Previews: PreviewProvider {
    static var previews: some View {
        AudioView(message: .audioPreviewContent)
    }
}
