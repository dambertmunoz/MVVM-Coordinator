//
//  BaseCoordinator.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 2/09/21.
//

import UIKit

public protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
}

open class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    public var parentCoordinator: Coordinator?
    public var navigationController = UINavigationController()
    
    public init() {
        
    }
    open func start() {
        fatalError("Start method must be implemented")
    }
    
    public func start(coordinator: Coordinator) {
        self.childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    public func didFinish(coordinator: Coordinator) {
        if let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) {
            self.childCoordinators.remove(at: index)
        }
    }
}
