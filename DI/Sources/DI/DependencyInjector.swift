//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import UIKit
import Swinject
import Domain
import AppNavigation

public class DependencyInjector {

    // MARK: - Properties

    let window: UIWindow?

    // MARK: - Lifecycle

    public init(window: UIWindow?) {
        self.window = window
    }

    // MARK: - Functions

    public func build(completion: (_ assembler: Assembler, _ appCoordinator: AppCoordinator) -> ()) {
        let assembler = Assembler([
            // MARK: Main Assemblers
            CoordinatorFactoryAssembly(),
            ViewControllersFactoryAssembly(),
            CoordinatorAssembly(window: window),

            // MARK: frameworks Assemblers
            DomainAssembly(),
            DataAssembly(),
            NetworkingAssembly(),
            StorageAssembly(),

            // MARK: features Assembler
            FeaturesAssembly()
        ])
        let appCoordinator = assembler.resolver.resolveSafe(AppCoordinator.self)
        completion(assembler, appCoordinator)
    }

}
