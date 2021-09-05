//
//  SignInViewModel.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 2/09/21.
//
import RxSwift

class SignInViewModel {

    private let disposeBag = DisposeBag()
    private let authentication: Authentication

    let emailAddress = BehaviorSubject(value: "")
    let password = BehaviorSubject(value: "")
    let isSignInActive: Observable<Bool>

    // events
    let didSignIn = PublishSubject<Void>()
    let didFailSignIn = PublishSubject<Error>()

    init(authentication: Authentication) {
        self.authentication = authentication
        self.isSignInActive = Observable.combineLatest(self.emailAddress, self.password).map {
            let value1 = $0.0 != ""
            let value2 = $0.1 != ""

            return value1 && value2
        }

    }

    func signInTapped() {
        self.authentication.signIn()
            .map { _ in }
            .observe(on: MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] _ in
                self?.didSignIn.onNext(())
            }, onFailure: { [weak self] error in
                    self?.didFailSignIn.onNext(error)
            })
            .disposed(by: self.disposeBag)
    }
}
