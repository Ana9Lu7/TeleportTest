//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

public class VideoFeedViewController: UIViewController {
    
    private lazy var mainView = VideoFeedView()
    private let presenter: VideoFeedPresenting
    var playerLooper: AVPlayerLooper?
    var videoNumber: Int = 0
    
    // MARK: - init
    public init(presenter: VideoFeedPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle

    public override func loadView() {
        self.view = mainView
        mainView.delegate = self
    }
    
    public override func viewDidLoad() {
        presenter.setupView()
    }
}

// MARK: - VideoFeedViewable
extension VideoFeedViewController: VideoFeedViewable {

    public func setViewInfo(viewModel: VideoFeedViewModel) {
        mainView.setViewInfo(viewModel: viewModel)
        DispatchQueue.main.async {
            guard let videoUrl = viewModel.videoUrl else {
                return
            }
            
            let item = AVPlayerItem(url: videoUrl)
            let videoPlayer = AVQueuePlayer(items: [item])
            self.playerLooper = AVPlayerLooper(player: videoPlayer, templateItem: item)
            let layer = AVPlayerLayer(player: videoPlayer)
            layer.frame = self.view.bounds
            layer.videoGravity = .resizeAspectFill
            self.mainView.videoView.layer.addSublayer(layer)

            videoPlayer.play()
        }
    }
    
    public func startLoading() {}
    
    public func stopLoading() {}
}

// MARK: - VideoFeedControllerDelegate
extension VideoFeedViewController: VideoFeedViewControllerDelegate {

    public func selectHeart() {
        mainView.heartNumber = mainView.heartNumber + 1
    }
    
    public func selectFire() {
        mainView.fireNumber = mainView.fireNumber + 1
    }
    
    public func swipeUp() {
        guard var viewModel = presenter.viewModel else {
            return
        }
        videoNumber = videoNumber + 1
        if videoNumber >= viewModel.looksModel.looks.count {
            videoNumber = 0
        }
        if videoNumber < 0 {
            videoNumber = viewModel.looksModel.looks.count - 1
        }
        viewModel.videoNumber = videoNumber
        setViewInfo(viewModel: viewModel)
    }

    public func swipeDown() {
        guard var viewModel = presenter.viewModel else {
            return
        }
        videoNumber = videoNumber - 1
        if videoNumber >= viewModel.looksModel.looks.count {
            videoNumber = 0
        }
        if videoNumber < 0 {
            videoNumber = viewModel.looksModel.looks.count - 1
        }
        viewModel.videoNumber = videoNumber
        setViewInfo(viewModel: viewModel)
    }
}
