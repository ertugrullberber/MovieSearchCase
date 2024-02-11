//
//  MainTabBarViewController.swift
//  MovieSearchCase
//
//  Created by Ertugrul Berber on 10.02.2024.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        vc1.title = "Home"
        vc2.title = "Top Search"
        
        tabBar.tintColor = .label
        setViewControllers([vc1, vc2], animated: true)
    }
}
