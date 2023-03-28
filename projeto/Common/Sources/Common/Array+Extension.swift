//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Foundation

public extension Array {
    
    func first<T>(typeOf: T.Type) -> T? {
        first(where: { $0 is T }) as? T
    }
}
