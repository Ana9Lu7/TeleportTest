//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Common
import Domain
import UIKit
import Looks

public protocol LooksCoordinatorsFactory: DependencyFactory {}

public protocol LooksViewControllersFactory: DependencyFactory {
    
    func makeVideoFeedViewController() -> VideoFeedViewController
}

public protocol LooksCoordinatorDelegate: CoordinatorDelegate {
}

// MARK: - Coordinator
public class LooksCoordinator: Coordinator {

    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController

    private let coordinatorFactory: LooksCoordinatorsFactory
    private let viewControllersFactory: LooksViewControllersFactory
    weak var delegateCoordinator: LooksCoordinatorDelegate?

    public init(navigationController: UINavigationController, coordinatorFactory: LooksCoordinatorsFactory,
                viewControllersFactory: LooksViewControllersFactory, delegateCoordinator: LooksCoordinatorDelegate) {
        self.navigationController = navigationController
        self.coordinatorFactory = coordinatorFactory
        self.viewControllersFactory = viewControllersFactory
        self.delegateCoordinator = delegateCoordinator
    }

    public func start() {
        let view = viewControllersFactory.makeVideoFeedViewController()
        navigationController.pushViewController(view, animated: true)
    }
}

// MARK: VideoFeedCoordinating
extension LooksCoordinator: VideoFeedCoordinating {}
