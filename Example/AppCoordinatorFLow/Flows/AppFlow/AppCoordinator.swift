import UIKit

// MARK: - AppCoordinator
final class AppCoordinator: BaseCoordinator {
  fileprivate let coordinatorFactory: CoordinatorFactory
  fileprivate let router: Router

  /// Init with 'router', 'factory'
  ///
  /// - Parameters:
  ///       router: default router behavior
  ///       factory: protocol which contains all flows
  init(router: Router, coordinatorFactory: CoordinatorFactory) {
    self.router = router
    self.coordinatorFactory = coordinatorFactory
  }
}

// MARK: - Coordinatable
extension AppCoordinator: Coordinator {
  func start() {
    childCoordinators.forEach { remove($0) }
    authorizationCoordinator()
  }

  func authorizationCoordinator() {
    let coordinator = coordinatorFactory.authorizationCoordinator(router: router, coordinatorFactory: coordinatorFactory)
    add(coordinator)

    coordinator.finishFlow = { [unowned coordinator] in
      self.remove(coordinator)
    }

    coordinator.start()
  }

  func cityCoordinator() {
    let coordinator = coordinatorFactory.cityCoordinator(router: RouterImp(rootController: UINavigationController()))
    add(coordinator)
    coordinator.start()
  }

  func nameCoordinator() {
    let coordinator = coordinatorFactory.nameCoordinator(router: RouterImp(rootController: UINavigationController()))
    remove(coordinator)
    coordinator.start()
  }
}
