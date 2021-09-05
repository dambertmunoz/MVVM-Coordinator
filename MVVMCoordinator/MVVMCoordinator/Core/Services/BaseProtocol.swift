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
    
    func getAll(_ type: Type_?, _ completion: @escaping callback)
    func get(_ completion: @escaping callback)
}

public enum BookType: String {
    case bestSeller
    case history = "History"
    case science = "Science"
    case business = "Business"
    case all 
}

public enum ErrorType : Error {
    case badUrl
    case timeout
    case notfound
    case decodingError
    case realmError
    case repositoryError
    case setupData
}
