//
//  BestSellersViewModel.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 4/09/21.
//

import Foundation
import RxSwift

class BooksViewModel {
    var books: Books = Books()
    let didLoadData = PublishSubject<Void>()
    let didErrorData = PublishSubject<ErrorType>()
    private let service: BooksService

    init(service: BooksService = BooksService()) {
        self.service = service
    }

    public func setupData(type: BookType) {

        service.getAll(type, { result in

            switch result {
            case .success(let books):
                DispatchQueue.main.async {
                    self.books = books
                    self.didLoadData.onNext(())
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.didErrorData.onNext(error)
                }
            }
        })

    }
}
