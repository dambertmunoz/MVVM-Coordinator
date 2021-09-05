//
//  BooksRemoteDataSource.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 4/09/21.
//

import Foundation

protocol BooksRemoteDataSourceProtocol {

    func getAll(_ completion: @escaping (Result<Books, ErrorType>) -> Void)

}

public class BooksRemoteDataSource: BooksRemoteDataSourceProtocol {

    // MARK: Lifecycle
    public init() {

    }

    // MARK: Methods
    public func getAll(_ completion: @escaping (Result<Books, ErrorType>) -> Void) {
        let url = URL(string: "https://raw.githubusercontent.com/ejgteja/files/main/books.json")!

        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, _, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            do {

                let decoder = JSONDecoder()
                let books = try decoder.decode(Books.self, from: data)
                completion(.success(books))

            } catch {
                print(error)
                completion(.failure(.decodingError))
            }
        })
        task.resume()
    }

}
