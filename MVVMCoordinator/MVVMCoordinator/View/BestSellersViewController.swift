//
//  BestSellersViewController.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 3/09/21.
//

import UIKit
import RxCocoa
import RxSwift

class BestSellersViewController: BaseViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData(.science)
    }

}
