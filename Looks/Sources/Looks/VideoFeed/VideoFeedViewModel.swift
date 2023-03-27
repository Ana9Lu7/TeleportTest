//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Domain
import UIKit
import AVKit
import AVFoundation

public struct VideoFeedViewModel {
    
    var looksModel: LooksModel
    var videoNumber = 0
    
    var profilePicture: UIImage? {
        guard let urlString = looksModel.looks[videoNumber].profilePictureUrl,
              let url = URL(string: urlString),
              let data = try? Data(contentsOf: url)
        else {
            return UIImage(named: "avatar")
        }
        return UIImage(data: data)
    }
    
    var videoTitle: String? {
        return looksModel.looks[videoNumber].body
    }
    
    var videoUrl: URL? {
        guard let urlString = looksModel.looks[videoNumber].videoUrl, let url = URL(string: urlString) else {
            return nil
        }
        return url
    }
}
