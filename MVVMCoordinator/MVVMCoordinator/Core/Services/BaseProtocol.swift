//
//  ServiceProtocol.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 4/09/21.
//

import Foundation



protocol BaseProtocol {
    associatedtype Item
    associatedtype Type_
    
    typealias callback = (Result<Item,ErrorType>) -> Void
    
    func getAll(_ completion: @escaping callback)
    func get(_ completion: @escaping callback)
    func filterByType(_ type: Type_, completion: @escaping callback)
}

public enum BookType {
    case bestSeller
    case history
    case science
    case business
}

public enum ErrorType : Error {
    case badUrl
    case timeout
    case notfound
    case decodingError
    case realmError
    case repositoryError
}
