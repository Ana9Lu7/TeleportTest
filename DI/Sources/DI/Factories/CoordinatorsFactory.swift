//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Swinject
import Common
import AppNavigation
import Domain

public class CoordinatorsFactory: DependencyFactory {

    let resolver: Resolver

    required public init(resolver: Resolver) {
        self.resolver = resolver
    }
}

extension CoordinatorsFactory: AppCoordinatorsFactory {
    
    public func makeLooksCoordinator() -> LooksCoordinator {
        resolver.resolveSafe(LooksCoordinator.self)
    }
}

extension CoordinatorsFactory: LooksCoordinatorsFactory {}
