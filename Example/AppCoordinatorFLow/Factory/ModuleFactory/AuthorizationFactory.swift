//
//  AuthorizationFactory.swift
//  Example
//
//  Created by ZAVYALOV Yaroslav on 07.10.2020.
//

// MARK: - AuthorizationFactory
protocol AuthorizationFactory {
  func registration() -> Registration
  func authorization() -> Authorization
  func tabBar() -> TabBar
}
