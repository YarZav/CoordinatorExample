//
//  AuthorizationViewController.swift
//  Example
//
//  Created by ZAVYALOV Yaroslav on 07.10.2020.
//

import UIKit

// MARK: - Protocols
protocol AuthorizationInput: AnyObject { }

protocol AuthorizationOutput: AnyObject {
  var finish: CompletionBlock? { get set }
}

protocol Authorization: AuthorizationInput & AuthorizationOutput & Presenter { }

// MARK: - AuthorizationViewController
class AuthorizationViewController: UIViewController, Authorization {
  var finish: CompletionBlock?

  private lazy var authorizationButton: UIButton = {
    let button = UIButton()
    button.setTitle("Магическая авторизация прошла", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.addTarget(self, action: #selector(authorizationAction), for: .touchUpInside)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Авторизация"
    view.backgroundColor = .white
    view.addSubview(authorizationButton)
    authorizationButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      authorizationButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
      authorizationButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
    ])
  }
}

// MARK: - Actions
private extension AuthorizationViewController {
  @objc func authorizationAction() {
    finish?()
  }
}
