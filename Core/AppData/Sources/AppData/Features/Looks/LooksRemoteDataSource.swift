//
//  LooksRemoteDataSource.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Foundation
import Domain

public protocol LooksRemoteDataSource {
    
    func getLooks(completion: @escaping (Result<LooksModel, Error>) -> ())
}
