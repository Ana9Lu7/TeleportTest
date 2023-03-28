//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Swinject
import Domain
import AppNavigation

class ViewControllersFactoryAssembly: Assembly {

    func assemble(container: Swinject.Container) {
        container.register(LooksViewControllersFactory.self) { ViewControllersFactory(resolver: $0) }
    }
}
