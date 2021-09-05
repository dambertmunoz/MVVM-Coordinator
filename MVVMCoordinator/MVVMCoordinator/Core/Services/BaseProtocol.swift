//
//  ServiceProtocol.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 4/09/21.
//

import Foundation

protocol BaseProtocol {
    associatedtype Item
    associatedtype TypeS

    typealias Callback = (Result<Item, ErrorType>) -> Void

    func getAll(_ type: TypeS?, _ completion: @escaping Callback)
    func get(_ completion: @escaping Callback)
}

// MARK: Helpful Enums
public enum BookType: String {
    case bestSeller
    case history = "History"
    case science = "Science"
    case business = "Business"
    case all
}

public enum ErrorType: Error {
    case badUrl
    case timeout
    case notfound
    case decodingError
    case realmError
    case repositoryError
    case setupData
}
