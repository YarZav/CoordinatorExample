//
//  TabBarViewController.swift
//  Example
//
//  Created by ZAVYALOV Yaroslav on 07.10.2020.
//

import UIKit

// MARK: - Protocols
protocol TabBarInput: AnyObject {
  func setNavigationControllers(_ controllers: [UINavigationController])
}

protocol TabBarOutput: AnyObject { }

protocol TabBar: TabBarInput & TabBarOutput & Presenter { }

// MARK: - TabBarViewController
class TabBarViewController: UITabBarController, TabBar {
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  func setNavigationControllers(_ controllers: [UINavigationController]) {
    for (index, controller) in controllers.enumerated() {
      let tabBarItem = UITabBarItem(title: "Итем \(index)", image: nil, selectedImage: nil)
      controller.tabBarItem = tabBarItem
    }
    viewControllers = controllers
  }
}
