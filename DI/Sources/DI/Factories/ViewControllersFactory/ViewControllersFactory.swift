//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import AppNavigation
import Swinject

class ViewControllersFactory: DependencyFactory {

    let resolver: Resolver

    required init(resolver: Resolver) {
        self.resolver = resolver
    }
}
