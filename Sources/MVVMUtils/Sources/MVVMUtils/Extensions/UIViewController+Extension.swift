//
//  File.swift
//  
//
//  Created by Dambert M. on 3/09/21.
//

import UIKit

extension UIViewController {
    
    public func showAlert(title: String, message: String) {
        let viewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        viewController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(viewController, animated: true, completion: nil)
    }
}

