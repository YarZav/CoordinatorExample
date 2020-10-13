import UIKit

// MARK: - AuthorizationCoordinator
final class AuthorizationCoordinator: BaseCoordinator, AuthorizationCoordinatorOutput {
  var finishFlow: CompletionBlock?
  fileprivate let factory: AuthorizationFactory
  fileprivate let router: Router
  fileprivate let coordinatorFactory: CoordinatorFactory

  /// Init Authorization with 'factory', 'router'
  ///
  /// - Parameters:
  ///     factory: authorization factory
  ///     router: authorization router
  init(with factory: AuthorizationFactory, router: Router, coordinatorFactory: CoordinatorFactory) {
    self.factory = factory
    self.router = router
    self.coordinatorFactory = coordinatorFactory
  }
}

// MARK: - Coordinatable

extension AuthorizationCoordinator: Coordinator {
  func start() {
    let module = registration()
    router.setRoot(module)
  }

  func registration() -> Registration {
    let module = factory.registration()

    module.finish = { [weak self] in
      let nextModule = self?.authorization()
      self?.router.push(nextModule)
    }

    return module
  }

  func authorization() -> Authorization {
    let module = factory.authorization()

    module.finish = { [weak self] in
      let nextModule = self?.tabBar()
      self?.router.setRoot(nextModule, hideBar: false)
    }

    return module
  }

  func tabBar() -> TabBar {
    let module = factory.tabBar()

    let cityNavigationController = UINavigationController()
    cityCoordinator(cityNavigationController)

    let nameNavigationController = UINavigationController()
    nameCoordinator(nameNavigationController)

    module.setNavigationControllers([cityNavigationController, nameNavigationController])

    return module
  }
}

extension AuthorizationCoordinator {
  func cityCoordinator(_ navigationController: UINavigationController) {
    let coordinator = coordinatorFactory.cityCoordinator(router: RouterImp(rootController: navigationController))
    coordinator.start()
    add(coordinator)
  }

  func nameCoordinator(_ navigationController: UINavigationController) {
    let coordinator = coordinatorFactory.nameCoordinator(router: RouterImp(rootController: navigationController))
    coordinator.start()
    add(coordinator)
  }
}
