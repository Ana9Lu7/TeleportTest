//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Swinject
import SwinjectAutoregistration
import AppData
import Domain

class DataAssembly: Assembly {

    // MARK: Features
    func assemble(container: Container) {
        assembleLooks(container: container)
    }
}

// MARK: Features

extension DataAssembly {
    
    func assembleLooks(container: Container) {
        container.autoregister(
            Domain.LooksRepository.self,
            initializer: AppData.LooksRepository.init
        )
    }
}
