//
//  CodeViewProtocol.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Foundation

public protocol CodeViewProtocol {

    func buildViewsHierarchy()
    func setupConstraints()
    func setupAddtionalConfiguration()
    func setupView()
}

extension CodeViewProtocol {

    public func setupView() {
        buildViewsHierarchy()
        setupConstraints()
        setupAddtionalConfiguration()
    }
}

