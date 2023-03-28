//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Common

public protocol GetLooksUseCaseProtocol {
    
    func execute(completion: @escaping (Result<LooksModel, Error>) -> ())
}

public class GetLooksUseCase {
    
    let repository: LooksRepository
    
    public init(repository: LooksRepository) {
        self.repository = repository
    }
    
}

extension GetLooksUseCase: GetLooksUseCaseProtocol {
    
    public func execute(completion: @escaping (Result<LooksModel, Error>) -> ()) {
        repository.getLooks(completion: completion)
    }
}

