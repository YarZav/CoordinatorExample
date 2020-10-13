// MARK: - CityCoordinator
final class CityCoordinator: BaseCoordinator, CityCoordinatorOutput {
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

extension CityCoordinator: Coordinator {
  func start() {
    let module = cityList()
    router.setRoot(module)
  }

  func cityList() -> CityList {
    let module = factory.cityList()

    module.tapCity = { [weak self] city in
      let nextModule = self?.cityDetail(city)
      self?.router.present(nextModule)
    }

    return module
  }

  func cityDetail(_ city: City) -> CityDetail {
    let module = factory.cityDetail()
    module.setCity(city)

    module.dismiss = { [weak self] in
      self?.router.dismiss(module)
    }

    return module
  }
}
