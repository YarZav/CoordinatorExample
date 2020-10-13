//
//  CityDetailViewContoller.swift
//  Example
//
//  Created by ZAVYALOV Yaroslav on 07.10.2020.
//

import UIKit

// MARK: - Protocols
protocol CityDetailInput: AnyObject {
  func setCity(_ city: City)
}

protocol CityDetailOutput: AnyObject {
  var dismiss: CompletionBlock? { get set }
}

protocol CityDetail: CityDetailInput & CityDetailOutput & Presenter { }

// MARK: - CityDetailViewContoller
class CityDetailViewContoller: UIViewController, CityDetail {
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

  func setCity(_ city: City) {
    button.setTitle(city, for: .normal)
  }
}

// MARK: - Actions
extension CityDetailViewContoller {
  @objc func action() {
    dismiss?()
  }
}
