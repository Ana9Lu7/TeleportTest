//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Swinject
import AppData
import Domain

class DomainAssembly: Assembly {
    
    func assemble(container: Container) {

        // MARK: Features
        assembleLooks(container: container)
    }
}

// MARK: Features

extension DomainAssembly {
    
    func assembleLooks(container: Container) {
        container.autoregister(
            GetLooksUseCaseProtocol.self,
            initializer: GetLooksUseCase.init
        )
    }
}
