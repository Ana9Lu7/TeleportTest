//
//  LooksModel.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Foundation

public struct LooksModel: Decodable {
    
    public let looks: [LookModel]
}

public struct LookModel: Decodable {
    
    public let id: Int?
    public let songUrl, body, profilePictureUrl, username, videoUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id, body, username
        case songUrl = "song_url"
        case profilePictureUrl = "profile_picture_url"
        case videoUrl = "compressed_for_ios_url"
    }
}
