/// Default completion code block
public typealias CompletionBlock = () -> Void

// MARK: - BaseCoordinator
open class BaseCoordinator {
  public lazy var childCoordinators: [Coordinator] = []

  /// Default init
  public init() { }
}

// MARK: - Publics
public extension BaseCoordinator {
  func add(_ coordinator: Coordinator) {
    if !childCoordinators.contains(where: { $0 === coordinator }) {
      childCoordinators.append(coordinator)
    }
  }

  func remove(_ coordinator: Coordinator?) {
    guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
    childCoordinators.removeAll { $0 === coordinator }
  }
}
