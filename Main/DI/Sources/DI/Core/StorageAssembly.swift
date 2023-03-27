//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Swinject
import Storage
import AppData

class StorageAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: Features
        assembleLooks(container: container)
    }
}

// MARK: Features

extension StorageAssembly {
    
    func assembleLooks(container: Container) {
        container.autoregister(
            AppData.LooksLocalDataSource.self,
            initializer: Storage.LooksLocalDataSource.init
        )
    }
}
