//
//  Book.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 4/09/21.

import Realm
import RealmSwift

@objcMembers public class Book: Object, Decodable, Error {
        dynamic var isbn: String?
        dynamic var title: String?
        dynamic var author: String?
        dynamic var desc: String?
        dynamic var genre: String?
        dynamic var img: String?
        dynamic var imported: Bool?

    enum CodingKeys: String, CodingKey {
        case isbn
        case title
        case author
        case desc = "description"
        case genre
        case img
        case imported
    }
    public override init() {

    }

}
