//
//  SignInViewController.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 2/09/21.
//

import UIKit
import MVVMUtils
import RxCocoa
import RxSwift

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    private let disposeBag = DisposeBag()
    var viewModel: SignInViewModel? = SignInViewModel(authentication: SessionService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpBindings()
    }
    
    private func setUpBindings() {
        guard let viewModel = viewModel else { return }
        
        self.emailTextField.rx.text.orEmpty
            .bind(to: viewModel.emailAddress)
            .disposed(by: self.disposeBag)
        
        self.passwordTextField.rx.text.orEmpty
            .bind(to: viewModel.password)
            .disposed(by: self.disposeBag)
        
        self.signInButton.rx.tap
            .observe(on: MainScheduler.instance)
            .bind {
                viewModel.signInTapped()
            }
            .disposed(by: self.disposeBag)
        
//        viewModel.isSignInActive
//            .bind(to: self.signInButton.rx.isEnabled)
//            .disposed(by: self.disposeBag)
        
        viewModel.didFailSignIn
            .subscribe(onNext: { error in
                print("Failed: \(error)")
            })
            .disposed(by: self.disposeBag)
        
        viewModel.didSignIn
            .subscribe(onNext: { error in
                self.performSegue(withIdentifier: Constants.Segue.SignIn_Home, sender: nil)
            })
            .disposed(by: self.disposeBag)
        
        
    }
}

