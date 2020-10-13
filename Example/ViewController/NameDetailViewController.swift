//
//  NameDetailViewController.swift
//  Example
//
//  Created by ZAVYALOV Yaroslav on 07.10.2020.
//

import UIKit

// MARK: - Protocols
protocol NameDetailInput: AnyObject {
  func setName(_ name: Name)
}

protocol NameDetailOutput: AnyObject {
  var dismiss: CompletionBlock? { get set }
}

protocol NameDetail: NameDetailInput & NameDetailOutput & Presenter { }

// MARK: - NameDetailViewController
class NameDetailViewController: UIViewController, NameDetail {
  var dismiss: CompletionBlock?

  lazy var button: UIButton = {
    let button = UIButton()
    button.setTitleColor(.black, for: .normal)
    button.addTarget(self, action: #selector(action), for: .touchUpInside)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
    isModalInPresentation = true
    
    view.addSubview(button)
    button.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      button.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      button.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
      button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }

  func setName(_ name: Name) {
    button.setTitle(name, for: .normal)
  }
}

// MARK: - Actions
extension NameDetailViewController {
  @objc func action() {
    dismiss?()
  }
}
