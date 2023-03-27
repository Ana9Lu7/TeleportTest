//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Foundation

public protocol VideoFeedViewControllerDelegate: AnyObject {
    
    func selectHeart()
    func selectFire()
    func swipeUp()
    func swipeDown()
}
