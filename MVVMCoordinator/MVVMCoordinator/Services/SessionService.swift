//
//  SessionService.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 3/09/21.
//

import RxSwift

enum SignInResponse {
    case success(token: String, userId: String)
    case error(message: String)
}

protocol Authentication {
    func signIn() -> Single<SignInResponse>
}

class SessionService: Authentication {
    func signIn() -> Single<SignInResponse> {
        return Single<SignInResponse>.create { single in
            // call to backend
            single(.success(SignInResponse.success(token: "12345", userId: "5678")))
            return Disposables.create()
        }
    }
}
