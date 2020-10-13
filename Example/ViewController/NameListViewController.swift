//
//  NameListViewController.swift
//  Example
//
//  Created by ZAVYALOV Yaroslav on 07.10.2020.
//

import UIKit

typealias Name = String

// MARK: - Protocols
protocol NameListInput: AnyObject { }

protocol NameListOutput: AnyObject {
  var tapName: ((Name) -> Void)? { get set }
}

protocol NameList: NameListInput & NameListOutput & Presenter { }

// MARK: - NameListViewController
class NameListViewController: UIViewController, NameList {
  var tapName: ((Name) -> Void)?
  let names: [City] = ["Иван", "Василий", "Прохор"]
  
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

// MAMR: - UITableViewDataSource
extension NameListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return names.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = names[indexPath.row]
    return cell
  }
}

// MARK: - UITableViewDelegate
extension NameListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tapName?(names[indexPath.row])
  }
}

