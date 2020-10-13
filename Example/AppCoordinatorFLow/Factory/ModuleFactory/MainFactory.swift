//
//  MainFactory.swift
//  Example
//
//  Created by ZAVYALOV Yaroslav on 07.10.2020.
//

// MARK: - MainFactory
protocol MainFactory {
  func cityList() -> CityList
  func cityDetail() -> CityDetail
  func nameList() -> NameList
  func nameDetail() -> NameDetail
}

