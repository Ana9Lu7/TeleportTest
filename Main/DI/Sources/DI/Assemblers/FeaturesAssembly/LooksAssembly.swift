//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import AppNavigation
import Foundation
import Swinject
import Domain
import Looks

extension FeaturesAssembly {
    
    // MARK: Assembler
    func assembleLooksFeatures(container: Container) {
        assembleVideoFeed(container: container)
    }
}

// MARK: Methods

extension FeaturesAssembly {
    
    func assembleVideoFeed(container: Container) {
        container.register(VideoFeedCoordinating.self) { $0.resolveSafe(LooksCoordinator.self) }
        container.autoregister(VideoFeedPresenter.self, initializer: VideoFeedPresenter.init)
    }
}
