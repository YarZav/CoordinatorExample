//
//  CoordinatorFactory.swift
//  Example
//
//  Created by ZAVYALOV Yaroslav on 07.10.2020.
//

// MARK: - CoordinatorFactory
protocol CoordinatorFactory {
  func authorizationCoordinator(router: Router, coordinatorFactory: CoordinatorFactory) -> Coordinator & AuthorizationCoordinatorOutput
  func cityCoordinator(router: Router) -> Coordinator & CityCoordinatorOutput
  func nameCoordinator(router: Router) -> Coordinator & NameCoordinatorOutput
}
