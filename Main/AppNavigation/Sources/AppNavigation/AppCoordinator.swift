//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Common
import Domain
import UIKit

public protocol AppCoordinatorsFactory: DependencyFactory {

    func makeLooksCoordinator() -> LooksCoordinator
}

public class AppCoordinator: Coordinator {

    // MARK: Properties

    weak var window: UIWindow?
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    private let coordinatorsFactory: AppCoordinatorsFactory

    // MARK: Lifecycle

    public init(window: UIWindow?, navigationController: UINavigationController, coordinatorsFactory: AppCoordinatorsFactory) {
        self.window = window
        self.navigationController = navigationController
        self.coordinatorsFactory = coordinatorsFactory
    }

    public func start() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        showLooksFlow()
    }
}

// MARK: Methods

extension AppCoordinator {
    
    func showLooksFlow() {
        let coordinator = coordinatorsFactory.makeLooksCoordinator()
        childCoordinators = [coordinator]
        coordinator.start()
    }
}

// MARK: - Delegate

// MARK: LooksCoordinatorDelegate

extension AppCoordinator: LooksCoordinatorDelegate {

}
