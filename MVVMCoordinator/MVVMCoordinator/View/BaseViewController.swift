//
//  BaseViewController.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 4/09/21.
//

import UIKit
import SwiftUI
import RxSwift

class BaseViewController: UIViewController {
    
    
    private let disposeBag = DisposeBag()
   // var viewModel: SignInViewModel? = SignInViewModel(authentication: SessionService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.setUpBindings()
    }

}

//
//extension BaseViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//}
