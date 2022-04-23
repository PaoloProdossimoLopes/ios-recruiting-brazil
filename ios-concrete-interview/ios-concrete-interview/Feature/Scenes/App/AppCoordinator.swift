//
//  AppCoordinator.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 15/04/22.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private(set) var childrens: [Coordinator] = []
    private(set) var rootViewController: UIViewController?
    private(set) var window: UIWindow?
    
    init(_ window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        rootViewController = makeBaseViewController()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    private func makeBaseViewController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = configureRootViewController()
        configureTabBar(tabBarController)
        return tabBarController
    }
    
    private func configureRootViewController() -> [UIViewController] {
        let homeCoordinator = makeMovieCoordiantor()
        childrens.append(homeCoordinator)
        
        let favoritesCoordinator = makeFavoritesCoordinator()
        childrens.append(favoritesCoordinator)
        
        let controllers = [
            homeCoordinator.controller,
            favoritesCoordinator.controller
        ]
        .compactMap { $0 }
        .map { UINavigationController(rootViewController: $0) }
        
        return controllers
    }
    
    private func configureTabBar(_ tabBarController: UITabBarController) {
        tabBarController.tabBar.unselectedItemTintColor = .darkYellowApp
        tabBarController.tabBar.tintColor = .black
    }
    
    private func makeMovieCoordiantor() -> MovieCoordinator {
        let homeCoordinator = MovieCoordinator(rootViewController: rootViewController)
        homeCoordinator.start()
        return homeCoordinator
    }
    
    private func makeFavoritesCoordinator() -> FavoritesCoordinator {
        let favoritesCoordinator = FavoritesCoordinator(rootViewController: rootViewController)
        favoritesCoordinator.start()
        return favoritesCoordinator
    }
}
