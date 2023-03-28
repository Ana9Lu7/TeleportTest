//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Foundation
import Swinject

class FeaturesAssembly: Assembly {
    
    func assemble(container: Container) {
        assembleLooksFeatures(container: container)
    }
}
