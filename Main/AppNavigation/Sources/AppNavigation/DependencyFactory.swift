//
//  DependencyFactory.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Swinject

public protocol DependencyFactory: AnyObject {

    init(resolver: Resolver)
}

