//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Swinject

extension Resolver {

    public func resolveSafe<Service>(_ serviceType: Service.Type) -> Service {
        guard let dependency = resolve(serviceType, name: nil) else {
            preconditionFailure("\(serviceType) is nil")
        }
        return dependency
    }
}
