//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import UIKit
import Swinject
import AppNavigation
import Domain
import Common

class CoordinatorAssembly: Assembly {
    
    // MARK: Properties
    
    let window: UIWindow?
    
    // MARK: Lifecycle
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    // MARK: Assemble
    
    func assemble(container: Container) {
        assembleAppCoordinator(container: container)
        assembleLooksCoordinator(container: container)
    }
}

// MARK: Coordinators

extension CoordinatorAssembly {
    
    func assembleAppCoordinator(container: Container) {

        let factory = container.resolveSafe(AppCoordinatorsFactory.self)
        let appCoordinator = AppCoordinator(
            window: window,
            navigationController: UINavigationController(),
            coordinatorsFactory: factory
        )
        container.register(AppCoordinator.self) { _ in appCoordinator }
    }
    
    func assembleLooksCoordinator(container: Container) {
        container.register(LooksCoordinator.self) { resolver in
            let appCoordinator = resolver.resolveSafe(AppCoordinator.self)
            return appCoordinator.childCoordinators.first(typeOf: LooksCoordinator.self) ??
            LooksCoordinator(
                navigationController: appCoordinator.navigationController,
                coordinatorFactory: resolver.resolveSafe(LooksCoordinatorsFactory.self),
                viewControllersFactory: resolver.resolveSafe(LooksViewControllersFactory.self),
                delegateCoordinator: appCoordinator
            )
        }
    }

}
