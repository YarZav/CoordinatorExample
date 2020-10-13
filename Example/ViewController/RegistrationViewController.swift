//
//  RegistrationViewController.swift
//  Example
//
//  Created by ZAVYALOV Yaroslav on 07.10.2020.
//

import UIKit

// MARK: - Protocols
protocol RegistrationInput: AnyObject { }

protocol RegistrationOutput: AnyObject {
  var finish: CompletionBlock? { get set }
}

protocol Registration: RegistrationInput & RegistrationOutput & Presenter { }

// MARK: - RegistrationViewController
class RegistrationViewController: UIViewController, Registration {
  var finish: CompletionBlock?
  
  private lazy var registrationButton: UIButton = {
    let button = UIButton()
    button.setTitle("Магическая регистрация прошла", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.addTarget(self, action: #selector(registrationAction), for: .touchUpInside)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Регистрация"
    view.backgroundColor = .white
    view.addSubview(registrationButton)
    registrationButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      registrationButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
      registrationButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
    ])
  }
}

// MARK: - Actions
private extension RegistrationViewController {
  @objc func registrationAction() {
    finish?()
  }
}
