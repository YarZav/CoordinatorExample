//
//  CityListViewController.swift
//  Example
//
//  Created by ZAVYALOV Yaroslav on 07.10.2020.
//

import UIKit

typealias City = String

// MARK: - Protocols
protocol CityListInput: AnyObject { }

protocol CityListOutput: AnyObject {
  var tapCity: ((City) -> Void)? { get set }
}

protocol CityList: CityListInput & CityListOutput & Presenter { }

// MARK: - CityListViewController
class CityListViewController: UIViewController, CityList {
  var tapCity: ((City) -> Void)?
  let cities: [City] = ["Москва", "Санкт-Петербург", "Казань"]

  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.tableFooterView = UIView()
    return tableView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }
}

// MARK: - UITableViewDataSource
extension CityListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cities.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = cities[indexPath.row]
    return cell
  }
}

// MARK: - UITableViewDelegate
extension CityListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tapCity?(cities[indexPath.row])
  }
}
