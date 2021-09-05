//
//  BooksService.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 3/09/21.
//

import Foundation

public class BooksService : BaseProtocol {
    
    typealias Item = Books
    typealias Type_ = BookType
    
    let repository: BooksRepository
    
    public init(repository: BooksRepository) {
        self.repository = repository
    }
    convenience init() throws {
        try self.init(repository: BooksRepository())
    }
    
    func getAll(_ type: BookType? = .all , _ completion: @escaping callback) {
        self.repository.getAll(type, completion)
    }
    
    func get(_ completion: @escaping callback) {
        self.repository.get(completion)
    }
    
    
    
    
}
