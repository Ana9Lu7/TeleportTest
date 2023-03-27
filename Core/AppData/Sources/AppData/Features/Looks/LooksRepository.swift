//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Foundation
import Domain
import Common

public class LooksRepository {

    // MARK: Properties

    let local: LooksLocalDataSource
    let remote: LooksRemoteDataSource

    // MARK: Lifecycle

    public init(local: LooksLocalDataSource, remote: LooksRemoteDataSource) {
        self.local = local
        self.remote = remote
    }
}

extension LooksRepository: Domain.LooksRepository {
    
    public func getLooks(completion: @escaping (Result<LooksModel, Error>) -> ()) {
        remote.getLooks(completion: completion)
    }
}
