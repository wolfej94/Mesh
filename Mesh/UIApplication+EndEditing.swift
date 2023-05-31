//
//  UIApplication+EndEditing.swift
//  Mesh
//
//  Created by James Wolfe on 09/05/2023.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
