//
//  AppDelegate.swift
//  Example
//
//  Created by ZAVYALOV Yaroslav on 07.10.2020.
//

import UIKit

@main
class AppDelegate: UIResponder {
  var window: UIWindow?
  let navigationController = UINavigationController()
  private lazy var coordinator: AppCoordinator = {
    let router = RouterImp(rootController: navigationController)
    let coordinatorFactory = CoordinatorFactoryImp()
    return AppCoordinator(router: router, coordinatorFactory: coordinatorFactory)
  }()
}

extension AppDelegate: UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    coordinator.start()
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    
    return true
  }
}
