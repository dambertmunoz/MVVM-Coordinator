//
//  Books.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 4/09/21.
//

import Foundation

public class Books: Decodable, Error {

    var data: [Book] = []

    enum CodingKeys: String, CodingKey {
        case results
        case books
    }
    public init() {

    }
    public init(_ data: [Book]) {
        self.data = data
    }
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let res = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .results)
        self.data = try res.decode([Book].self, forKey: .books)

        print(self.data)
    }
}
