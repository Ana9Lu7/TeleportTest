//
//  DecodeData.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Foundation

public class DecodeData {

    public static func decodeFor <T: Decodable> (_ model: T.Type, data: Data, completion: @escaping (Result<T, Error>) -> Void) {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedData))
        } catch {
            completion(.failure(DecodeError.unableToDecode))
        }
    }
}

enum DecodeError: Error {
    
    case unableToDecode
}
