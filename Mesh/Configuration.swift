//
//  Configuration.swift
//  Mesh
//
//  Created by James Wolfe on 08/05/2023.
//

import Foundation

class Configuration {
    
    static var isPreview: Bool = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}
