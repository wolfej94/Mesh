//
//  UIImage+NSFWCheck.swift
//  Mesh
//
//  Created by James Wolfe on 09/05/2023.
//

import Foundation
import UIKit
import NSFWDetector

extension UIImage {
    
    func containsNSFWContent() async throws -> Bool {
        return try await withCheckedThrowingContinuation { continuation in
            NSFWDetector.shared.check(image: self) { result in
                switch result {
                case .success(let confidence):
                    continuation.resume(returning: confidence > 0.7)
                case .error(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
}

extension Array where Element == UIImage {
    
    func containsNSFWContent() async throws -> Bool {
        for element in self {
            if try await element.containsNSFWContent() {
                return true
            }
        }
        return false
    }
}
