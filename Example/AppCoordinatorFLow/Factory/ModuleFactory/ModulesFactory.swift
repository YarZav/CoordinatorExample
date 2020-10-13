//
//  ModulesFactory.swift
//  Example
//
//  Created by ZAVYALOV Yaroslav on 07.10.2020.
//

// MARK: - ModulesFactory
final class ModulesFactory {}

// MARK: - AuthorizationFactory
extension ModulesFactory: AuthorizationFactory {
  func registration() -> Registration {
    return RegistrationViewController()
  }
  
  func authorization() -> Authorization {
    return AuthorizationViewController()
  }

  func tabBar() -> TabBar {
    return TabBarViewController()
  }
}

// MARK: - MainFactory
extension ModulesFactory: MainFactory {
  func cityList() -> CityList {
    return CityListViewController()
  }
  
  func cityDetail() -> CityDetail {
    return CityDetailViewContoller()
  }
  
  func nameList() -> NameList {
    return NameListViewController()
  }
  
  func nameDetail() -> NameDetail {
    return NameDetailViewController()
  }
}
