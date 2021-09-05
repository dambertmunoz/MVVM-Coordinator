//
//  BooksRepository.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 4/09/21.
//

import Foundation
import Realm
import RealmSwift

public class BooksRepository: BaseProtocol {
    
    
    typealias Item = Books
    typealias Type_ = BookType
    
    let localDatasource: BooksLocalDataSource
    let remoteDatasource: BooksRemoteDataSource
    
    public init(localDatasource: BooksLocalDataSource, remoteDatasource: BooksRemoteDataSource ) {
        self.localDatasource = localDatasource
        self.remoteDatasource = remoteDatasource
    }
    
    convenience init() throws {
        try self.init(localDatasource: BooksLocalDataSource(), remoteDatasource: BooksRemoteDataSource())
    }
    
    
    func getAll(_ type: BookType? = .all ,_ completion: @escaping callback) {
        
        do {
            
            // Check if the books exists in realM
            guard try self.localDatasource.exists() == false else {
                
                let books = Books(try self.localDatasource.getAll(type))
                return completion(.success(books))
            }
            
            // If not, I will use remoteDatasource and after that if success save all books
            self.remoteDatasource.getAll { val in
                
                do {
                    switch val {
                    case .success(let books):
                        try self.localDatasource.save(books.data)
                        let bookFiltered = self.localDatasource.filterByType(type!, books: books.data)
                        return completion(.success(Books(bookFiltered)))
                    case .failure(let error): return completion(.failure(error))
                    }
                } catch {
                    completion(.failure(.realmError))
                }
            }
            
        } catch {
            completion(.failure(.repositoryError))
        }
        
    }
    
    func get(_ completion: @escaping callback) {
        
    }
    
    
}
