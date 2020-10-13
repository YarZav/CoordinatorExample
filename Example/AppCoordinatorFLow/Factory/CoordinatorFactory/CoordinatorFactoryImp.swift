import UIKit

// MARK: - CoordinatorFactoryImp
final class CoordinatorFactoryImp {
  fileprivate let modulesFactory = ModulesFactory()
}

// MARK: - CoordinatorFactoryProtocol
extension CoordinatorFactoryImp: CoordinatorFactory {
  func authorizationCoordinator(router: Router, coordinatorFactory: CoordinatorFactory) -> AuthorizationCoordinatorOutput & Coordinator {
    return AuthorizationCoordinator(with: modulesFactory, router: router, coordinatorFactory: coordinatorFactory)
  }
  
  func cityCoordinator(router: Router) -> Coordinator & CityCoordinatorOutput {
    return CityCoordinator(with: modulesFactory, router: router)
  }

  func nameCoordinator(router: Router) -> Coordinator & NameCoordinatorOutput {
    return NameCoordinator(with: modulesFactory, router: router)
  }
}
