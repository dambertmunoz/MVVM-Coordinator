//
//  BestSellersViewModel.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 4/09/21.
//

import RxSwift

class BooksViewModel {
    var books: Books = Books()
    let didLoadData = PublishSubject<Void>()
    let didErrorData = PublishSubject<ErrorType>()

    public func setupData(type: BookType) {

        BooksService().getAll(type, { result in

            switch result {
            case .success(let books):
                self.books = books
                self.didLoadData.onNext(())
            case .failure(let error):
                self.didErrorData.onNext(error)
            }
        })

    }
}
