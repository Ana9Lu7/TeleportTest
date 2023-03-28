//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Foundation

public protocol VideoFeedViewable: AnyObject {
    
    func setViewInfo(viewModel: VideoFeedViewModel)
    func startLoading()
    func stopLoading()
    
}
