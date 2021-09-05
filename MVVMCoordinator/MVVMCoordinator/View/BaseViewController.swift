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
    let tableView = UITableView()
    var viewModel = BooksViewModel()
    
    let cellId = "BookTableViewCell"
    
    override func loadView() {
      super.loadView()
      setupTableView()
    }
    
    func setupData(_ type: BookType) {
        
        self.viewModel.setupData(type: type)
        
        self.viewModel.didLoadData.subscribe( onNext: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }).disposed(by: self.disposeBag)
        
        self.viewModel.didErrorData.subscribe(onNext: { error in
            print(error.localizedDescription)
        }).disposed(by: self.disposeBag)
       
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: self.cellId)
    }
    
}

extension BaseViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.books.data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BookTableViewCell
        cell.configure(book: self.viewModel.books.data[indexPath.row])
        return cell
    }
    
}
