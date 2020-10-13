// MARK: - NameCoordinator
final class NameCoordinator: BaseCoordinator, NameCoordinatorOutput {
  var finishFlow: CompletionBlock?
  fileprivate let factory: MainFactory
  fileprivate let router: Router

  /// Init Authorization with 'factory', 'router'
  ///
  /// - Parameters:
  ///     factory: authorization factory
  ///     router: authorization router
  init(with factory: MainFactory, router: Router) {
    self.factory = factory
    self.router = router
  }
}

// MARK: - Coordinatable

extension NameCoordinator: Coordinator {
  func start() {
    let module = nameList()
    router.setRoot(module)
  }

  func nameList() -> NameList {
    let module = factory.nameList()

    module.tapName = { [weak self] city in
      let nextModule = self?.nameDetail(city)
      self?.router.present(nextModule)
    }

    return module
  }

  func nameDetail(_ name: Name) -> NameDetail {
    let module = factory.nameDetail()
    module.setName(name)

    module.dismiss = { [weak self] in
      self?.router.dismiss(module)
    }

    return module
  }
}
