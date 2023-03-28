//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Swinject
import AppNavigation

class CoordinatorFactoryAssembly: Assembly {

    func assemble(container: Container) {
        container.register(AppCoordinatorsFactory.self) { CoordinatorsFactory(resolver: $0) }
        container.register(LooksCoordinatorsFactory.self) { CoordinatorsFactory(resolver: $0) }
    }
}

