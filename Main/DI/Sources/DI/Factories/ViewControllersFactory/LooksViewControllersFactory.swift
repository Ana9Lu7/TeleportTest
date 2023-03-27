//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import AppNavigation
import Swinject
import Domain
import Looks

extension ViewControllersFactory: LooksViewControllersFactory {

    func makeVideoFeedViewController() -> Looks.VideoFeedViewController {
        let presenter = resolver.resolveSafe(VideoFeedPresenter.self)
        let viewController = VideoFeedViewController(presenter: presenter)
        presenter.attach(viewController)
        return viewController
    }
}
