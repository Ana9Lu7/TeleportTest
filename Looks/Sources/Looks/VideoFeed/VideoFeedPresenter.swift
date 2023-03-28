//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Domain
import UIKit

public class VideoFeedPresenter {

    private weak var view: VideoFeedViewable?
    private let coordinator: VideoFeedCoordinating
    private let getLooksUseCase: GetLooksUseCaseProtocol
    
    public var viewModelResponse: VideoFeedViewModel?

    public init(coordinator: VideoFeedCoordinating, getLooksUseCase: GetLooksUseCaseProtocol) {

        self.coordinator = coordinator
        self.getLooksUseCase = getLooksUseCase
    }

    public func attach(_ view: VideoFeedViewable) {
        self.view = view
    }
}

// MARK: - VideoFeedPresenting
extension VideoFeedPresenter: VideoFeedPresenting {

    public var viewModel: VideoFeedViewModel? {
        return viewModelResponse
    }
    
    public func setupView() {
        getLooks()
    }
}

// MARK: - Methods
extension VideoFeedPresenter {
    
    func getLooks() {
        view?.startLoading()
        getLooksUseCase.execute {[weak self] result in
            guard let self = self else {
                return
            }
            self.view?.stopLoading()
            switch result {
            case .success(let response):
                self.viewModelResponse = VideoFeedViewModel(looksModel: response)
                self.view?.setViewInfo(viewModel: VideoFeedViewModel(looksModel: response))
            case .failure(let failure):
                debugPrint(failure)
            }
        }
    }
}
