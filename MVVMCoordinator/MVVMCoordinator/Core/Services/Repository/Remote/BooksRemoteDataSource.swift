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
        guard let url = URL(string: "https://raw.githubusercontent.com/ejgteja/files/main/books.json") else {
            completion(.failure(.badUrl))
            return
        }

        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, _, error in
            guard error == nil else {
                completion(.failure(.networkError))
                return
            }
            guard let data = data else {
                completion(.failure(.emptyResponse))
                return
            }
            do {

                let decoder = JSONDecoder()
                let books = try decoder.decode(Books.self, from: data)
                completion(.success(books))

            } catch {
                completion(.failure(.decodingError))
            }
        })
        task.resume()
    }

}
