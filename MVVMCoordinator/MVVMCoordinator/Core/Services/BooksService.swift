//
//  BooksService.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 3/09/21.
//

import Foundation

public class BooksService: BaseProtocol {

    typealias Item = Books
    typealias TypeS = BookType

    // MARK: Properties
    let repository: BooksRepository

    public init(repository: BooksRepository) {
        self.repository = repository
    }
    convenience init() {
        self.init(repository: BooksRepository())
    }

    // MARK: Methods
    func getAll(_ type: BookType? = .all, _ completion: @escaping Callback) {
        self.repository.getAll(type, completion)
    }

    func get(_ completion: @escaping Callback) {
        self.repository.get(completion)
    }

}
