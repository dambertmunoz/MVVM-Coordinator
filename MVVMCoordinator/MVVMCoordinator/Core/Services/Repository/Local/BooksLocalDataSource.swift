//
//  BooksLocalDataSource.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 4/09/21.
//

import Foundation
import Realm
import RealmSwift


public class BooksLocalDataSource {
   
   
    public init() throws{
        
    }
    
    public func exists() throws ->  Bool {
        let realm: Realm = try Realm()
        
        return realm.objects(Book.self).count > 0
    }
    
    public func save(_ books: [Book]) throws{
        
        let realm: Realm = try Realm()
        try realm.write {
            realm.add(books)
        }
    }
    
    public func getAll(_ type: BookType? = .all) throws -> [Book] {
        
        let realm: Realm = try Realm()
        let books = Array(realm.objects(Book.self))
        return self.filterByType(type!, books: books)
    }
    
    public func filterByType(_ type: BookType, books: [Book]) -> [Book] {
        
        guard books.count > 0 else { return books }
        guard type != .all else { return books }
        
        return books.filter {
             $0.genre == type.rawValue
        }
    }
    
    public func findById(_ isbn: String) throws -> [Book] {
        
        let realm: Realm = try Realm()
        let result = realm.objects(Book.self).filter {
            $0.isbn == isbn
        }
        return Array(result)
    }
}
