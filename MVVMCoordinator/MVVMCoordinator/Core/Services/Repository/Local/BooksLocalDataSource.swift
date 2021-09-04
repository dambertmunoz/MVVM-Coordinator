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
   
    let realm: Realm
    
    public init() throws{
        
        self.realm = try Realm()
    }
    
    public func exists() throws ->  Bool {
        
        return self.realm.objects(Book.self).count > 0
    }
    
    public func save(_ books: [Book]) throws{
        
        try realm.write {
            realm.add(books)
        }
    }
    
    public func getAll() throws -> [Book] {
        return Array(realm.objects(Book.self))
    }
    
    public func findById(_ isbn: String) throws -> [Book] {
        
        let result = realm.objects(Book.self).filter {
            $0.isbn == isbn
        }
        return Array(result)
    }
}
