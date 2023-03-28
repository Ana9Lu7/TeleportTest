//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Swinject
import Networking
import AppData

class NetworkingAssembly: Assembly {

    func assemble(container: Container) {
        
        // MARK: Features
        assembleLooks(container: container)
    }
}

// MARK: Features

extension NetworkingAssembly {
    
    func assembleLooks(container: Container) {
        container.autoregister(
            AppData.LooksRemoteDataSource.self,
            initializer: Networking.LooksRemoteDataSource.init
        )
    }
}
