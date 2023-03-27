//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

public protocol VideoFeedPresenting {
    
    var viewModel: VideoFeedViewModel? { get }
    func setupView()
}
